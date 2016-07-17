---
layout: post
comments: true
title: Australian water trading data, part 2 - zero price transactions
category: eda
tags: eda, visualization, R, ggplot2, water trading, markets, data, empirics
year: 2016
month: 7
day: 02
published: true
summary: A look at some Australian water trading data
---

In a [previous post](https://akhilrao.github.io/eda/2016/06/29/au-water-trading-1-look-at-data/) I looked at some water trading data from the Australian Bureau of Meteorology. In this post I focus on the zero price transactions.

As mentioned last time, trades can have a zero price for three reasons:

1. As a rule, water trades between environmental water holders are listed at $0
2. A single private user may transfer water they own from one area to another, recording a price of $0
3. Some transactions between two private users may be listed as occuring at $0 because entering the price isn't/wasn't always mandatory (if I recall correctly, the person said this was more likely in more remote areas)

## Why do I care about zero price transactions? 

It has to do with reason 1. Towards the end of the [Millennium Drought](https://en.wikipedia.org/wiki/2000s_Australian_drought), most states had implemented unbundling schemes to separate water access entitlements from land titles. At face value I thought this would be a good thing, since it would lower transactions costs. But there is some discussion that it led to higher prices for environmental water, resulting in more government expenditure than would have occurred without unbundling. 

This "world of the second-best" story seems really interesting to me from a policy perspective. Intuitively, it makes sense to me if water is used to produce public goods whose marginal benefits don't enter into the market - basically a market incompleteness story. I don't know whether this is actually what happened or not, but it seems at least possible in theory.

## Doing stuff with the data

I used the same scripts as last time, [`prep-trading-data.r`](https://github.com/akhilrao/akhilrao.github.io/tree/master/public/code/au-water-trading/prep-trading-data.r) and [`water-eda-stuff.r`](https://github.com/akhilrao/akhilrao.github.io/tree/master/public/code/au-water-trading/water-eda-stuff.r), with some small modifications. I uncommented four lines in `prep-trading-data.r` to created an indicator variable `zerop` in `ents` and `alls`. `zerop` is 1 if the transaction had a price of $0, and 0 if the price was positive. For example,

```r
ent_data$zerop <- rep(0,length=dim(ent_data)[1])
ent_data$zerop[which(ent_data$netPrice==0)] <- 1
```

and similarly for the allocation trades.

In `water-eda-stuff.r`, I updated the `ddply()`, `join()`, and `melt()` calls to include `zerop` as a variable to sort and merge on.

```r
## monthly trading
ents_m <- ddply(ents,.(year,MonthOfTrade,mdb,from_state,interstate,zerop),summarize,v_ents=sum(quantityTraded),price_ents=mean(PricePerML[PricePerML!=0]),n_ents=length(quantityTraded),np_ents=length(PricePerML[PricePerML!=0]))

alls_m <- ddply(alls,.(year,MonthOfTrade,mdb,from_state,interstate,zerop),summarize,v_alls=sum(quantityTraded),price_alls=mean(PricePerML[PricePerML!=0]),n_alls=length(quantityTraded),np_alls=length(PricePerML[PricePerML!=0]))

### merge alls and ents
trades_m <- join(alls_m,ents_m,by=c("MonthOfTrade","mdb","from_state","interstate","zerop"),type="full",match="first")
trades_m[(is.na(trades_m))] <- 0 # replace NaN and NA with 0

### melt trades_m
trades_m_melted <- melt(trades_m[,c(1,2,3,4,5,6,7,8,9,10,11,12,13,14)],id=c("year","MonthOfTrade","mdb","from_state","interstate","zerop")) # useful for plots later
```

From here the dataset is ready to make the plots I want. 

## Pictures

Let's look at the priced/unpriced transactions by state.


{% highlight r %}
library(ggplot2)
load("C:/Users/Akhil/Documents/akhilrao.github.io/public/code/au-water-trading/water-eda-stuff.RData") # load workspace

## drop everything before 2008
trades_m <- subset(trades_m,year>2008)
trades_m_melted <- subset(trades_m_melted,year>2008)

### facet by state, color by zero price/not
#### volumes over time - allocations
trade_vols_state <- ggplot(trades_m_melted[which(trades_m_melted$variable=="v_alls"),], aes(x=MonthOfTrade,y=value,color=factor(zerop)))

trade_vols_state + geom_point() + geom_smooth(method="lm",fill=NA) + facet_wrap(~from_state) + ggtitle("Allocation trading by state") + ylab("Volume (ML) traded per month") + xlab("time") + scale_colour_discrete(name="Price",labels=c("positive","zero"))
{% endhighlight %}

![plot of chunk unnamed-chunk-1](/public/images/eda-water-2/unnamed-chunk-1-1.svg)

{% highlight r %}
#### volumes over time - entitlements
trade_vols_state <- ggplot(trades_m_melted[which(trades_m_melted$variable=="v_ents"),], aes(x=MonthOfTrade,y=value,color=factor(zerop)))

trade_vols_state + geom_point() + geom_smooth(method="lm",fill=NA) + facet_wrap(~from_state) + ggtitle("Entitlement trading by state") + ylab("Volume (ML) traded per month") + xlab("time") + scale_colour_discrete(name="Price",labels=c("positive","zero"))
{% endhighlight %}

![plot of chunk unnamed-chunk-1](/public/images/eda-water-2/unnamed-chunk-1-2.svg)

{% highlight r %}
#### counts over time - allocations
trade_counts_state <- ggplot(trades_m_melted[which(trades_m_melted$variable=="n_alls"),], aes(x=MonthOfTrade,y=value,color=factor(zerop)))

trade_counts_state + geom_point() + geom_point() + geom_smooth(method="lm",fill=NA) + facet_wrap(~from_state) + ggtitle("Allocation trading by state") + ylab("Number of trades per month") + xlab("time") + scale_colour_discrete(name="Price",labels=c("positive","zero"))
{% endhighlight %}

![plot of chunk unnamed-chunk-1](/public/images/eda-water-2/unnamed-chunk-1-3.svg)

{% highlight r %}
#### counts over time - entitlements
trade_counts_state <- ggplot(trades_m_melted[which(trades_m_melted$variable=="n_ents"),], aes(x=MonthOfTrade,y=value,color=factor(zerop)))

trade_counts_state + geom_point() + geom_point() + geom_smooth(method="lm",fill=NA) + facet_wrap(~from_state) + ggtitle("Entitlement trading by state") + ylab("Number of trades per month") + xlab("time") + scale_colour_discrete(name="Price",labels=c("positive","zero"))
{% endhighlight %}

![plot of chunk unnamed-chunk-1](/public/images/eda-water-2/unnamed-chunk-1-4.svg)

(*Still no Northern Territory or Australian Capital Territory. I haven't audited my code yet to see where I might be dropping them, or looked to see if they're in the data at all. It's on my to-do list.*)

Takeaways:

1. There are very few transactions with a positive price outside of New South Wales and Victoria, and few high-volume transactions. One story might be that these states are more arid, with fewer private players and less liquid water markets. NSW and Victoria account for most of the Murray-Darling Basin, so it makes sense to me that they'd have more positive price transactions. Queensland and Tasmania in particular don't seem to have very liquid water markets, at least as measured by trades with a positive price.

2. Not a lot of difference between positive price and zero price entitlement transactions overall. The exception is victoria, where the number of positive price entitlement trades seems to have fallen over time, while the number of zero price transactions has increased.

3. New South Wales seems to have seen the biggest increase in zero price allocation trades over this period, both in terms of volume traded and number of trades per month. Victoria also saw similar increases, but they seem to be of smaller magnitude.

4. There's more activity in allocation trades than entitlement trades.

At a first approximation it seems like these data may offer some support for the second-best story of unbundling.

Unfortunately, zero price transactions are not a perfect indicator of environmental water trades - reasons 2 and 3 are still candidate explanations. What I need is a way to check the annual levels of environmental water trading implied by zero price trades against some "ground truth" measure of environmental water trades. The Australian Water Markets Reports may offer a way to do that. 

I have a copy of the AWMR tables for 2013-14 hosted [here](https://github.com/akhilrao/akhilrao.github.io/tree/master/public/code/au-water-trading/awmr2013-14_dataTables_v1.0.0.xlsx), or you can get them from the Department of Agriculture and Water Resources [here](http://www.agriculture.gov.au/abares/publications/display?url=http://143.188.17.20/anrdl/DAFFService/display.php?fid=pb_awmr_d9aawr20151211.xml). Table 21 lists "Environmental allocation trade among southern Murray-Darling Basin water systems, 2013-14", so I can check the zero price trades in those water systems* against these. I'll do that in the next post on this subject. If it checks out, that's a good sign and I can look at the AWMRs for other years to see if I can do something similar.

*("water systems" is a finer level of aggregation than "state", so I'll have to modify `water-eda-stuff.r`. `prep-trading-data.r` should be fine.)

Ideally I'd like to use the monthly data to run some regressions to see the effect of unbundling on environmental transactions, but this may not be possible. One problem is the difficulty of defining environmental transactions at the monthly level. 

Another problem is the variation in policy implementation - I believe that South Australia implemented unbundling along the River Murray Prescribed Water Course starting July 1st, 2009, and that Victoria implemented unbundling on July 1st, 2007 (Northern Victoria) and July 1st, 2008 (Southern Victoria). I don't yet know when New South Wales implemented unbundling, but my guess is around when Victoria did or sooner.

These dates are all really early in my sample, or for regions that may not have good counterfactuals. In the case of Victorian unbundling, I don't have any entitlement trade data before 2009. In the case of South Australia, the RMPWC is where most of the trading activity occurs, so any control region would probably have to be located in Victoria or NSW. This makes a credibly identified setup to get at the effects of unbundling a bit more challenging, but possibly still doable. In a future post I'll describe what one such setup might look like.