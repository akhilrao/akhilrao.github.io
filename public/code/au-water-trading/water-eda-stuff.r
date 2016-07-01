# water trading eda script

setwd("C:/Users/Akhil/Documents/akhilrao.github.io/public/code/au-water-trading")
#setwd("C:/Users/Akhil/Dropbox/school/water/data/trading")

## load libraries - make sure these are installed! stuff to read excel files, reshape data, plot pretty pictures, estimate consistent standard errors, and probably other useful things.  Probably don't need all of these.
library(readxl)
library(plyr)
library(reshape2)
library(ggplot2)

## run prep script
rm(list=ls()) # I use these liberally. Caveat emptor.
source("prep-trading-data.r") # does some stuff to make the data nicer to use

## monthly trading
ents_m <- ddply(ents,.(year,MonthOfTrade,mdb,from_state,interstate,zerop),summarize,v_ents=sum(quantityTraded),price_ents=mean(PricePerML[PricePerML!=0]),n_ents=length(quantityTraded),np_ents=length(PricePerML[PricePerML!=0]))

alls_m <- ddply(alls,.(year,MonthOfTrade,mdb,from_state,interstate,zerop),summarize,v_alls=sum(quantityTraded),price_alls=mean(PricePerML[PricePerML!=0]),n_alls=length(quantityTraded),np_alls=length(PricePerML[PricePerML!=0]))

### merge alls and ents
trades_m <- join(alls_m,ents_m,by=c("MonthOfTrade","mdb","from_state","interstate","zerop"),type="full",match="first")
trades_m[(is.na(trades_m))] <- 0 # replace NaN and NA with 0

### melt trades_m
trades_m_melted <- melt(trades_m[,c(1,2,3,4,5,6,7,8,9,10,11,12,13,14)],id=c("year","MonthOfTrade","mdb","from_state","interstate","zerop")) # useful for plots later

## yearly trading
ents_y <- ddply(ents,.(year,mdb,from_state,interstate,zerop),summarize,v_ents=sum(quantityTraded),price_ents=mean(PricePerML[PricePerML!=0]),n_ents=length(quantityTraded),np_ents=length(PricePerML[PricePerML!=0]))
alls_y <- ddply(alls,.(year,mdb,from_state,interstate,zerop),summarize,v_alls=sum(quantityTraded),price_alls=mean(PricePerML[PricePerML!=0]),n_alls=length(quantityTraded),np_alls=length(PricePerML[PricePerML!=0]))

### merge alls and ents
trades_y <- join(alls_y,ents_y,by=c("year","mdb","from_state","interstate","zerop"),type="full",match="first")
trades_y[(is.na(trades_y))] <- 0 # replace NaN and NA with 0

### yearly summary
yearly_summary <- ddply(trades_y,.(year),summarize,v_alls=sum(v_alls),v_ents=sum(v_ents),n_alls=sum(n_alls),n_ents=sum(n_ents)) # for a summary table

save.image("C:/Users/Akhil/Documents/akhilrao.github.io/public/code/au-water-trading/water-eda-stuff.RData") # save workspace for .Rmd

rm(list=ls())

load("C:/Users/Akhil/Documents/akhilrao.github.io/public/code/au-water-trading/water-eda-stuff.RData") # load workspace

## drop everything before 2008
trades_m <- subset(trades_m,year>2008)
trades_m_melted <- subset(trades_m_melted,year>2008)

## make plots

## 06/29/2016 post
### facet by mdb/not
#### volume over time
trade_vols <- ggplot(trades_m_melted[c(which(trades_m_melted$variable=="v_ents"),which(trades_m_melted$variable=="v_alls")),], aes(x=MonthOfTrade,y=value,color=factor(mdb)))

trade_vols + geom_point() + geom_smooth(method="lm",fill=NA) + facet_wrap(~variable) + scale_colour_discrete(name="In MDB",labels=c("No","Yes")) + ggtitle("Water volume traded in and out of MDB") + ylab("Volume (ML) traded per month") + xlab("time")

#### trades over time
trade_counts <- ggplot(trades_m_melted[c(which(trades_m_melted$variable=="n_ents"),which(trades_m_melted$variable=="n_alls")),], aes(x=MonthOfTrade,y=value,color=factor(mdb)))

trade_counts + geom_point() + geom_smooth(method="lm",fill=NA) + facet_wrap(~variable) + scale_colour_discrete(name="In MDB",labels=c("No","Yes")) + ggtitle("Trades in and out of MDB") + ylab("Number of trades per month") + xlab("time")

#### prices over time
trade_prices <- ggplot(trades_m_melted[c(intersect(which(trades_m_melted$variable=="price_ents"),which(trades_m_melted$value!=0)),intersect(which(trades_m_melted$variable=="price_alls"),which(trades_m_melted$value!=0))),], aes(x=MonthOfTrade,y=value,color=factor(mdb)))  # only looking at observations with positive prices

trade_prices + geom_point() + geom_smooth(method="lm",se=TRUE,fill=NA) + facet_wrap(~variable) + scale_colour_discrete(name="In MDB",labels=c("No","Yes")) + ggtitle("Monthly average trade prices in and out of MDB") + ylab("AUD") + xlab("time")

### facet by state
#### volumes over time
trade_vols_state <- ggplot(trades_m_melted[c(which(trades_m_melted$variable=="v_ents"),which(trades_m_melted$variable=="v_alls")),], aes(x=MonthOfTrade,y=value,color=factor(variable)))

trade_vols_state + geom_point() + geom_smooth(method="lm",fill=NA) + facet_wrap(~from_state) + scale_colour_discrete(name="Product type",labels=c("Allocations","Entitlements")) + ggtitle("Water volume traded in each state") + ylab("Volume (ML) traded per month") + xlab("time")

#### counts over time
trade_counts_state <- ggplot(trades_m_melted[c(which(trades_m_melted$variable=="n_ents"),which(trades_m_melted$variable=="n_alls")),], aes(x=MonthOfTrade,y=value,color=factor(variable)))

trade_counts_state + geom_point() + geom_smooth(method="lm",fill=NA) + facet_wrap(~from_state) + scale_colour_discrete(name="Product type",labels=c("Allocations","Entitlements")) + ggtitle("Trades in each state") + ylab("Number of trades per month") + xlab("time")

#### prices over time
trade_prices_state <- ggplot(trades_m_melted[c(intersect(which(trades_m_melted$variable=="price_ents"),which(trades_m_melted$value!=0)),intersect(which(trades_m_melted$variable=="price_alls"),which(trades_m_melted$value!=0))),], aes(x=MonthOfTrade,y=value,color=factor(variable))) 

trade_prices_state + geom_point() + geom_smooth(method="lm",fill=NA) + facet_wrap(~from_state) + scale_colour_discrete(name="Product type",labels=c("Allocations","Entitlements")) + ggtitle("Monthly average trade prices in each state") + ylab("AUD") + xlab("time")

## 07/01/2016 post
### facet by state, color by zero price/not
#### volumes over time - allocations
trade_vols_state <- ggplot(trades_m_melted[which(trades_m_melted$variable=="v_alls"),], aes(x=MonthOfTrade,y=value,color=factor(zerop)))

trade_vols_state + geom_point() + geom_smooth(method="lm",fill=NA) + facet_wrap(~from_state) + ggtitle("Allocation trading by state") + ylab("Volume (ML) traded per month") + xlab("time") + scale_colour_discrete(name="Price",labels=c("positive","zero")) + scale_x_discrete(breaks=c("200900","201000","201100","201200","201300","201400"))

+ scale_x_discrete(breaks=NULL)

+ scale_x_discrete(breaks=c("200900","201000","201100","201200","201300","201400"), labels=c("2009","2010","2011","2012","2013","2014"))

#### volumes over time - entitlements
trade_vols_state <- ggplot(trades_m_melted[which(trades_m_melted$variable=="v_ents"),], aes(x=MonthOfTrade,y=value,color=factor(zerop)))

trade_vols_state + geom_point() + geom_smooth(method="lm",fill=NA) + facet_wrap(~from_state) + ggtitle("Entitlement trading by state") + ylab("Volume (ML) traded per month") + xlab("time") + scale_colour_discrete(name="Price",labels=c("positive","zero"))

#### counts over time - allocations
trade_counts_state <- ggplot(trades_m_melted[which(trades_m_melted$variable=="n_alls"),], aes(x=MonthOfTrade,y=value,color=factor(zerop)))

trade_counts_state + geom_point() + geom_point() + geom_smooth(method="lm",fill=NA) + facet_wrap(~from_state) + ggtitle("Allocation trading by state") + ylab("Number of trades per month") + xlab("time") + scale_colour_discrete(name="Price",labels=c("positive","zero"))

#### counts over time - entitlements
trade_counts_state <- ggplot(trades_m_melted[which(trades_m_melted$variable=="n_ents"),], aes(x=MonthOfTrade,y=value,color=factor(zerop)))

trade_counts_state + geom_point() + geom_point() + geom_smooth(method="lm",fill=NA) + facet_wrap(~from_state) + ggtitle("Entitlement trading by state") + ylab("Number of trades per month") + xlab("time") + scale_colour_discrete(name="Price",labels=c("positive","zero"))

