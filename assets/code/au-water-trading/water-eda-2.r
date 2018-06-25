library(readxl)
library(plyr)
library(reshape2)
library(ggplot2)

## run prep script
rm(list=ls())
source("prep-trading-data.r") # does some stuff to make the data nicer to use

interest <- c(3,15,16,18:23,29)

ents_m <- ddply(ents,.(year,MonthOfTrade,mdb,from_state,interstate),summarize,v_ents_pp=sum(quantityTraded[PricePerML!=0]),v_ents_zp=sum(quantityTraded[PricePerML==0]),price_ents=mean(PricePerML[PricePerML!=0]),n_ents=length(quantityTraded),np_ents=length(PricePerML[PricePerML!=0]))

alls_m <- ddply(alls,.(year,MonthOfTrade,mdb,from_state,interstate),summarize,v_alls_pp=sum(quantityTraded[PricePerML!=0]),v_alls_zp=sum(quantityTraded[PricePerML==0]),price_alls=mean(PricePerML[PricePerML!=0]),n_alls=length(quantityTraded),np_alls=length(PricePerML[PricePerML!=0]))

### merge alls and ents
trades_m <- join(alls_m,ents_m,by=c("MonthOfTrade","mdb","from_state","interstate"),type="full",match="first")
trades_m[(is.na(trades_m))] <- 0 # replace NaN and NA with 0

### some cleaning
ents_m[(is.na(ents_m))] <- 0
ents_m_rest <- ents_m[which(ents_m$price_ents!=0),]
ents_m_rest <- ents_m_rest[which(ents_m$mdb==1),]

### some regressions
reg1 <- lm(log(price_ents) ~ v_ents_zp + np_ents + year + from_state + interstate,data=ents_m_rest)
summary(reg1)
