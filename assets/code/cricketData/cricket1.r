#### Script to scrape data about cricket scoring from espncricinfo

library("tidyr")
library("dplyr")
library("stringr")
library("ggplot2")

setwd("C://Users/Akhil/Documents/akhilrao.github.io/public/code/cricketData")

# Read in the csv
dfrm <- read.csv("india.csv",header=TRUE)[,-c(6,10)]

# Some cleaning
temp <- str_split_fixed(as.character(dfrm$Opposition),"v",2)
dfrm$Opposition <- as.factor(temp[,2])
dfrm$MatchType <- as.factor(temp[,1])
temp <- str_split_fixed(as.character(dfrm$Start.Date)," ",3)
dfrm$Start.Date <- paste(temp[,1],temp[,2])
dfrm$Year <- temp[,3]

dfrm <- dfrm[-which(dfrm$Result=="draw"|dfrm$Result=="n/r"),] #drop draws and n/rs
dfrm$Result <- ifelse(dfrm$Result=="lost", 0, 1) #recode win/loss to 1/0
dfrm$Toss <- ifelse(dfrm$Toss=="lost", 0, 1) #recode win/loss to 1/0
dfrm$Bat <- ifelse(dfrm$Result=="2nd", 0, 1) #recode 1st/2nd to 1/0

dfrm <- cbind(idx = rownames(dfrm),dfrm)

# Some plots
