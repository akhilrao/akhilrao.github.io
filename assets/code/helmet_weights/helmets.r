library(xlsx)
library(ggplot2)
library(stringr)

rm(list=ls())
setwd("C:/Users/Akhil/Documents/akhilrao.github.io/public/code/helmet_weights")

hels <- read.xlsx("helmet weights.xlsx",1)

# a histogram of weights
#win.graph()
ggplot(data=hels, aes(hels$Grams)) + geom_histogram(binwidth=50, breaks=seq(min(hels$Grams),max(hels$Grams),by=50),col="red") + labs(title="Histogram of helmet weights, 50 gram bins") + labs(x="Grams", y="Count")

# let's slice this by brand
byBrand <- lm(Grams ~ Brand - 1, data = hels)
#summary(byBrand)
brands <- coef(byBrand)
brands <- as.data.frame(brands)
labs <- rownames(brands)
labs <- str_split_fixed(labs,"Brand",2)
brands <- cbind(labs[,2],brands)
colnames(brands) <- c("brand","weight")
rownames(brands) <- NULL

#win.graph()
ggplot(data=brands, aes(x=brand,y=weight)) + geom_bar(stat="identity", col="blue") + labs(title="Average weight by brand")

# which brand has the lightest/heaviest helmets?
brands[which.min(brands[,2]),]
brands[which.max(brands[,2]),]

# how many models are there per brand?
models <- aggregate(data.frame(count = hels$Brand), list(value = hels$Brand), length)
mean(models$count) # average models per brand

#win.graph()
ggplot(data=models, aes(x=value,y=count)) + geom_bar(stat="identity", col="blue") + labs(title="Number of models per brand")
