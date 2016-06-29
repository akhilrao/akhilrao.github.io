---
layout: post
comments: true
title: A look at some Australian water trading data
category: eda
tags: eda, visualization, R, ggplot2, water trading, markets, data, empirics
year: 2016
month: 6
day: 29
published: false
summary: A look at some Australian water trading data
---

*This is my first attempt at using Rmarkdown, knitr, and ggplot2. The scripts to reproduce and extend everything discussed here are [here](https://github.com/akhilrao/akhilrao.github.io/tree/master/public/code/au-water-trading). My use of knitr and Rmarkdown is based on this [post](http://brooksandrew.github.io/simpleblog/articles/blogging-with-r-markdown-and-jekyll-using-knitr/) by Andrew Brooks.*

I'm currently working on two projects: one is about orbital debris and satellites launches (what my previous post was about), and the other is about water trading in Australian water markets (that's what this post is about). It's too early to talk much about the substantive content of either project; in this post I'm going to describe some interesting (to me!) things in some of the water data I have.

## Why Australian water markets?

I've liked the idea of water markets since I learned about [California's messed up water rights](http://www.latimes.com/local/california/la-me-water-rights-legal-20150629-story.html) as a [Coro Fellow](http://www.corola.org/) (FPPA LA '12, fun times). Australia actually has pretty well-defined water markets with some trading data, so I started there.

Plus, water markets lend themselves to some great awful puns about market liquidity and trade volumes.

## A little bit about the markets

Australian water trading can broadly be classified into two categories: allocation trades and entitlement trades. Allocation trades are short-term transfers of an amount of water, lasting for the remainder of the water year (water years are July 1st xxx(y)-June 30th xxx(y+1)). Entitlement trades are transfers of the rights to water from a given source. Entitlement transfers can further be divided into permanent/ongoing and leases.

I say "markets" instead of "market" because each state has some different laws relating to water trading within its borders. But the broad allocations/entitlements distinction still stands. The [implementation details vary](http://www.nationalwatermarket.gov.au/about/products.html). (I'm saying "entitlement" instead of "access entitlement" for brevity.)

A given water resource will be divided into consumptive and non-consumptive use. Consumptive use is for private purposes like irrigation, urban use, etc., while non-consumptive use is for things like generating hydroelectricity or to guarantee the stability of the environment in that region. Tradeable water rights are defined as shares of a consumptive pool from a given water source. Water resource plans define the amount of water available to a consumptive pool. The national water market's [resources page](http://www.nationalwatermarket.gov.au/about/resources.html) has more information on how this works.

There's a lot of state-level heterogeneity in how this all looks in practice, but my understanding is that these broad statements are true across the country.

## What are the data?

The data used for this post are publicly available at the Bureau of Meteorology's [Water Market Information page](http://www.nationalwatermarket.gov.au/water-market-reports/download-data.html), specifically the "trade history" dataset.

The dataset describes all of the water transactions that occurred between 2009-2014. A lot of the trades have a zero recorded price. A spoke to one of the people at the Bureau of Meteorology about this some time back, and he told me that only the quantity traded is mandatory, not the price. So a lot of prices are zero. One of the things I want to check is how the distributions of zero price trades compares to the distribution of positive price trades, to see if there's anything interesting going on there. I'm not going to look into that too much here.

One of my goals for the future is to learn to use mapping tools to get data out of maps like [these](http://www.bom.gov.au/jsp/awap/rain/index.jsp). Rainfall information would be really useful for this project. Along the way, it would help to find a shapefile for a map of Australia with the Murray-Darling Basin and the different water systems marked out.

## Doing stuff with the data

I'm going to skip all the data cleaning and prep work. It's in the script `prep-trading-data.r`. I'm calling it "cleaning and prep work" but I guess it's called "wrangling" now? What happend to "munging", did it go out of style? [Life's mysteries](https://en.wikipedia.org/wiki/Data_wrangling). 

`prep-trading-data.r` outputs two csv files, one each for allocation and entitlement trades. I used `rm(list=ls())` liberally throughout the `prep-trading-data.r`, so consider yourself warned. Don't use the script if you have other things you want to keep in your workspace.

`prep-trading-data.r` does a bunch of useful things for me, like create an indicator variable for whether a trade was in the Murray-Darling Basin or not, a categorical variable describing the origin and destination states of a trade, and get rid of 14 observations with years like 2103 (at which point we'll have no water, so they're clearly wrong). The most tedious part of writing it was going through the [Australian Water Markets Report 2013-14](http://www.agriculture.gov.au/abares/publications/display?url=http://143.188.17.20/anrdl/DAFFService/display.php?fid=pb_awmr_d9aawr20151211.xml) to figure out whether a given water system was in the Murray-Darling Basin or not.

`ents` and `alls` are from the csv files of prepped daily water trading data. From there I used `water-eda.r` to do a little more processing and make some tables and pictures. The data processing in `water-eda.r` is below:

```r
## load libraries - make sure these are installed! stuff to read excel files, reshape data, plot pretty pictures, estimate consistent standard errors, and probably other useful things.  Probably don't need all of these.
library(readxl)
library(plyr)
library(reshape2)

## run prep script
rm(list=ls()) # I use these liberally. Caveat emptor.
source("prep-trading-data.r") # does some stuff to make the data nicer to use

## monthly trading
ents_m <- ddply(ents,.(year,MonthOfTrade,mdb,from_state,interstate),summarize,v_ents=sum(quantityTraded),price_ents=mean(PricePerML[PricePerML!=0]),n_ents=length(quantityTraded),np_ents=length(PricePerML[PricePerML!=0]))
alls_m <- ddply(alls,.(year,MonthOfTrade,mdb,from_state,interstate),summarize,v_alls=sum(quantityTraded),price_alls=mean(PricePerML[PricePerML!=0]),n_alls=length(quantityTraded),np_alls=length(PricePerML[PricePerML!=0]))

### merge alls and ents
trades_m <- join(alls_m,ents_m,by=c("MonthOfTrade","mdb","from_state","interstate"),type="full",match="first")
trades_m[(is.na(trades_m))] <- 0 # replace NaN and NA with 0

### melt trades_m
trades_m_melted <- melt(trades_m[,c(1,2,3,4,5,6,7,8,9,10,11,12,13)],id=c("year","MonthOfTrade","mdb","from_state","interstate")) # useful for plots later

## yearly trading
ents_y <- ddply(ents,.(year,mdb,from_state,interstate),summarize,v_ents=sum(quantityTraded),price_ents=mean(PricePerML[PricePerML!=0]),n_ents=length(quantityTraded),np_ents=length(PricePerML[PricePerML!=0]))
alls_y <- ddply(alls,.(year,mdb,from_state,interstate),summarize,v_alls=sum(quantityTraded),price_alls=mean(PricePerML[PricePerML!=0]),n_alls=length(quantityTraded),np_alls=length(PricePerML[PricePerML!=0]))

### merge alls and ents
trades_y <- join(alls_y,ents_y,by=c("year","mdb","from_state","interstate"),type="full",match="first")
trades_y[(is.na(trades_y))] <- 0 # replace NaN and NA with 0

### yearly summary
yearly_summary <- ddply(trades_y,.(year),summarize,v_alls=sum(v_alls),v_ents=sum(v_ents),n_alls=sum(n_alls),n_ents=sum(n_ents)) # for a summary table
```

Just some `ddply()`, `join()`, and `melt()` to make pictures and tables easier later. `n_ents` and `n_alls` are the number of entitlement and allocation trades respectively, while `v_ents` and `v_alls` are the total monthly volume of entitlements and allocations traded.

(I'm still a noob at this whole "generating pretty things in markdown" business, so I used this handy online [markdown table generator](http://www.tablesgenerator.com/markdown_tables#) to make this table.)

| year | Allocation trades (ML) | Entitlement trades (ML) | Number of allocation trades | Number of entitlement trades |
|------|------------------------|-------------------------|-----------------------------|------------------------------|
| 2004 | 1898                   | 0                       | 4                           | 0                            |
| 2005 | 980                    | 0                       | 1                           | 0                            |
| 2006 | 1256                   | 0                       | 38                          | 0                            |
| 2007 | 4279                   | 0                       | 76                          | 0                            |
| 2008 | 1090                   | 0                       | 17                          | 0                            |
| 2009 | 873878.133             | 449766.741              | 8119                        | 2895                         |
| 2010 | 3373516.237            | 1385914.681             | 18434                       | 6666                         |
| 2011 | 5527076.803            | 2261956.205             | 10070                       | 7509                         |
| 2012 | 5565003.714            | 1301803.735             | 15099                       | 7804                         |
| 2013 | 7288640.034            | 1915709.35              | 30058                       | 7636                         |
| 2014 | 2975364.894            | 827862.547              | 15160                       | 2316                         |

Note that I'm categorizing these by calendar year, not water year. "ML" stands for megaliter (1 million liters). The 2014 data only goes till September, so the apparent dropoff in trading might be mostly truncated data.

### Pictures!

This is the real reason I wrote this post: pictures! 

To get these to load in knitr code chunks, the script `water-eda.r` saves the cleaned data in a file called `water-eda-stuff.RData`. I'm going to focus on three quantities: volume traded (megaliters per month), trade volume (number of trades per month), and price per megaliter (Australian dollars).


{% highlight r %}
load("C:/Users/Akhil/Documents/akhilrao.github.io/public/code/au-water-trading/water-eda-stuff.RData")
library(ggplot2)
## drop everything before 2008
trades_m <- subset(trades_m,year>2008)
trades_m_melted <- subset(trades_m_melted,year>2008)

## make plots
### volume over time
trade_vols <- ggplot(trades_m_melted[c(which(trades_m_melted$variable=="v_ents"),which(trades_m_melted$variable=="v_alls")),], aes(x=MonthOfTrade,y=value,color=factor(mdb)))

trade_vols + geom_point() + geom_smooth(method="lm",fill=NA) + facet_wrap(~variable) + scale_colour_discrete(name="In MDB",labels=c("No","Yes")) + ggtitle("Water volume traded in and out of MDB") + ylab("Volume (ML) traded per month") + xlab("time")
{% endhighlight %}

![plot of chunk unnamed-chunk-1](/public/images/eda-water-1/unnamed-chunk-1-1.svg)

{% highlight r %}
### trades over time
trade_counts <- ggplot(trades_m_melted[c(which(trades_m_melted$variable=="n_ents"),which(trades_m_melted$variable=="n_alls")),], aes(x=MonthOfTrade,y=value,color=factor(mdb)))

trade_counts + geom_point() + geom_smooth(method="lm",fill=NA) + facet_wrap(~variable) + scale_colour_discrete(name="In MDB",labels=c("No","Yes")) + ggtitle("Trades in and out of MDB") + ylab("Number of trades per month") + xlab("time")
{% endhighlight %}

![plot of chunk unnamed-chunk-1](/public/images/eda-water-1/unnamed-chunk-1-2.svg)

{% highlight r %}
### prices over time
trade_prices <- ggplot(trades_m_melted[c(intersect(which(trades_m_melted$variable=="price_ents"),which(trades_m_melted$value!=0)),intersect(which(trades_m_melted$variable=="price_alls"),which(trades_m_melted$value!=0))),], aes(x=MonthOfTrade,y=value,color=factor(mdb)))  # only looking at observations with positive prices

trade_prices + geom_point() + geom_smooth(method="lm",se=TRUE,fill=NA) + facet_wrap(~variable) + scale_colour_discrete(name="In MDB",labels=c("No","Yes")) + ggtitle("Monthly average trade prices in and out of MDB") + ylab("AUD") + xlab("time")
{% endhighlight %}

![plot of chunk unnamed-chunk-1](/public/images/eda-water-1/unnamed-chunk-1-3.svg)

Three things I see here:

1. More trading of entitlements and allocations inside the MDB than outside, both in terms of volumes of water traded as well as number of trades.
2. Allocation trading inside the MDB has been increasing faster than allocation trading outside the MDB, while entitlement trading in both regions seem to follow similar trends.
3. Average monthly prices per megaliter seem about the same inside or outside the MDB. Entitlement prices seem to have been going up over time.

This makes sense; the Murray-Darling Basin accounts for most of Australia's water use, so I expected to see more activity inside the MDB than outside. 4 states sit inside the MDB: New South Wales, Victoria, Queensland, and South Australia. New South Wales and Victoria have the most area inside the Basin, so we might expect the action in the Basin to be driven by those two. Let's take a look:


{% highlight r %}
load("C:/Users/Akhil/Documents/akhilrao.github.io/public/code/au-water-trading/water-eda-stuff.RData")
library(ggplot2)
## drop everything before 2008
trades_m <- subset(trades_m,year>2008)
trades_m_melted <- subset(trades_m_melted,year>2008)

## make plots
### volumes over time
trade_vols_state <- ggplot(trades_m_melted[c(which(trades_m_melted$variable=="v_ents"),which(trades_m_melted$variable=="v_alls")),], aes(x=MonthOfTrade,y=value,color=factor(variable)))

trade_vols_state + geom_point() + geom_smooth(method="lm",fill=NA) + facet_wrap(~from_state) + scale_colour_discrete(name="Product type",labels=c("Allocations","Entitlements")) + ggtitle("Water volume traded in each state") + ylab("Volume (ML) traded per month") + xlab("time")
{% endhighlight %}

![plot of chunk unnamed-chunk-2](/public/images/eda-water-1/unnamed-chunk-2-1.svg)

{% highlight r %}
### counts over time
trade_counts_state <- ggplot(trades_m_melted[c(which(trades_m_melted$variable=="n_ents"),which(trades_m_melted$variable=="n_alls")),], aes(x=MonthOfTrade,y=value,color=factor(variable)))

trade_counts_state + geom_point() + geom_smooth(method="lm",fill=NA) + facet_wrap(~from_state) + scale_colour_discrete(name="Product type",labels=c("Allocations","Entitlements")) + ggtitle("Trades in each state") + ylab("Number of trades per month") + xlab("time")
{% endhighlight %}

![plot of chunk unnamed-chunk-2](/public/images/eda-water-1/unnamed-chunk-2-2.svg)

{% highlight r %}
### prices over time
trade_prices_state <- ggplot(trades_m_melted[c(intersect(which(trades_m_melted$variable=="price_ents"),which(trades_m_melted$value!=0)),intersect(which(trades_m_melted$variable=="price_alls"),which(trades_m_melted$value!=0))),], aes(x=MonthOfTrade,y=value,color=factor(variable))) 

trade_prices_state + geom_point() + geom_smooth(method="lm",fill=NA) + facet_wrap(~from_state) + scale_colour_discrete(name="Product type",labels=c("Allocations","Entitlements")) + ggtitle("Monthly average trade prices in each state") + ylab("AUD") + xlab("time")
{% endhighlight %}

![plot of chunk unnamed-chunk-2](/public/images/eda-water-1/unnamed-chunk-2-3.svg)

(*Northern Territory seems to be missing from my data. Might be a coding error on my part.*)

1. It looks like the increase in volume traded and trade volume for the allocations is driven by Victoria and New South Wales, with New South Wales having some bigger months in terms of both amount traded and frequency of trades.
2. Overall prices per megaliter seem fairly flat, with the exception of entitlements in New South Wales, which seem to be increasing.
3.  Not a lot of trades with positive prices in Queensland, I don't think any in Tasmania.

I'll look at more cuts of this data in a future post.