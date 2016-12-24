

rm(list=ls())
setwd("C:/Unnamed_source/widgets")
wagg <- read.csv("122416 widgets_agg_1.csv")
wmic <- read.csv("122416 widgets_mic_1.csv")
wmic <- wmic[,-c(1,7,8)]  # remove the url fields and unnnecessary row name field

linked <- merge(wmic,wagg,by="Brand")  # merge by brand

# remove brand and product names
wagg$Brand <- as.numeric(wagg$Brand)
colnames(wagg)[1] <- c("Firm.id")
wmic$Brand <- as.numeric(wmic$Brand)
wmic$Product.Name <- as.numeric(wmic$Product.Name)
colnames(wmic)[c(1,2)] <- c("Product.id","Firm.id")
linked$Brand <- as.numeric(linked$Brand)
linked$Product.Name <- as.numeric(linked$Product.Name)
colnames(linked)[c(1,2)] <- c("Product.id","Firm.id")

wagg <- wagg[-(dim(wagg)[1]),]
wagg$dispersion <- wagg$Max.Price - wagg$Min.Price

# put stuff into a dataset to put into an Rdata file
dataset <- list(wagg,wmic,linked)
names(dataset) <- c("wagg","wmic","linked")

save(dataset, file="widgets.Rdata")

############################################################
# load the Rdata file - this can be published
rm(list=ls())
library(ggplot2)
library(GGally)
library(stringr)
load("C:/Unnamed_source/widgets/widgets.Rdata")

###### the aggregated dataset
wagg <- dataset$wagg

plotfun <- function(data, mapping, ...) {
    output <- ggplot(data = data, mapping = mapping) + geom_point() + geom_smooth(method=loess,fill="red",color="blue")  
    output
}

# matrix of scatterplots, densities, and correlation coefficients
ggpairs(wagg[,c(2,3,6,7)])

# with loess lines and confidence intervals
ggpairs(wagg[,c(2,3,6,7)], lower=list(continuous = plotfun))

# determinants of min/max dispersion?
m1.wagg <- lm(dispersion ~ Tot.Rvws + SKUs + Avg.Price, data=wagg)
summary(m1.wagg)

# determinants of average price?
m2.wagg <- lm(Avg.Price ~ Tot.Rvws + SKUs, data=wagg)
summary(m2.wagg)

##############################################################
###### a "micro" dataset

#wmic <- read.csv("122416 widgets_mic_1.csv")
wmic <- dataset$wmic

# clean commas out of 'price' variable, take average of ranges, make numeric, add back to wmic
price.orig <- wmic$Price
wmic <- wmic[,-3]
Price <- gsub(",", "", price.orig)
duals.idx <- grep("-", Price, value=FALSE)
duals.vals <- grep("-", Price, value=TRUE)
duals.split <- as.numeric(str_split_fixed(duals.vals,"-",2))
duals.means <- c(mean(duals.split[1:2]),mean(duals.split[3:4]),mean(duals.split[5:6]),mean(duals.split[7:8]))
Price[duals.idx] <- duals.means
Price <- as.numeric(Price)
wmic <- cbind(wmic,Price)

# matrix of scatterplots
ggpairs(wmic[,3:5])

save(wmic, file="wmic.Rdata")

rm(list=ls())
load("C:/Unnamed_source/widgets/wmic.Rdata")

# simple hedonic regression
m1.wmic <- lm(Price ~ factor(Firm.id) - 1, data=wmic)
summary(m1.wmic)

# plot the average prices with error bars
brands <- data.frame(summary(m1.wmic)$coef[summary(m1.wmic)$coef[,4] <= .1, 1]) # only grab brands with enough products for error bars which exclude 0 (p-value less than 0.1)
labs <- rownames(brands)
labs <- str_split_fixed(labs,".id",2) #have to leave the close parens alone since str_split_fixed looks for regular expressions
brands <- cbind(labs[,2],brands)
colnames(brands) <- c("brand","price")
rownames(brands) <- NULL
brands$brand <- gsub(")", "", brands$brand) #get rid of that annoying close parens

# getting the standard errors
ses <- coef(summary(m1.wmic))[,2]
ses <- as.data.frame(ses)
labs <- rownames(ses)
labs <- str_split_fixed(labs,".id",2)
ses <- cbind(labs[,2],ses)
colnames(ses) <- c("brand","error")
rownames(ses) <- NULL
ses$brand <- gsub(")", "", ses$brand)

sticky <- merge(brands,ses,by="brand")
limits <- aes(ymax= (sticky$price + sticky$error), ymin= (sticky$price - sticky$error))

ggplot(data=sticky, aes(x=brand,y=price)) + geom_bar(stat="identity", col="blue") + labs(title="Average price by brand") + geom_errorbar(limits,width=0.2)

load("C:/Unnamed_source/widgets/wmic.Rdata")
# brand hedonic with more stuff
m2.wmic <- lm(Price ~ Firm.id - 1 + Reviews + Rating, data=wmic)
summary(m2.wmic)

m3.wmic <- lm(Rating ~ Reviews + Price, data=wmic)
summary(m3.wmic)


