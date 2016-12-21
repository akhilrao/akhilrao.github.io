---
layout: post
comments: true
title: Looking at some helmet weights
category: eda
tags: eda, visualization, R, ggplot2, data
year: 2016
month: 12
day: 21
published: true
summary: Looking at some helmet weights
---

My cousin sent me some data on motorcycle helmet weights for a project he's working on. I thought it would be fun to slice it up and look at it a bit instead of working on things I should be working on.

## The data

The dataset is a spreadsheet with 4 columns and 135 rows. The columns are: a URL, a brand, a model name, and a weight.

## Some plots


{% highlight r %}
library(xlsx)
library(ggplot2)
library(stringr)

rm(list=ls())
setwd("C:/Users/Akhil/Documents/akhilrao.github.io/public/code/helmet_weights")

hels <- read.xlsx("helmet weights.xlsx",1)

# a histogram of weights
#win.graph()
ggplot(data=hels, aes(hels$Grams)) + geom_histogram(binwidth=50, breaks=seq(min(hels$Grams),max(hels$Grams),by=50),col="red") + labs(title="Histogram of helmet weights, 50 gram bins") + labs(x="Grams", y="Count")
{% endhighlight %}

![plot of chunk unnamed-chunk-1](/public/images/helmet_weightsunnamed-chunk-1-1.svg)

{% highlight r %}
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
{% endhighlight %}

![plot of chunk unnamed-chunk-1](/public/images/helmet_weightsunnamed-chunk-1-2.svg)

{% highlight r %}
# which brand has the lightest/heaviest helmets?
brands[which.min(brands[,2]),]
{% endhighlight %}



{% highlight text %}
##      brand weight
## 5 Biltwell 1227.5
{% endhighlight %}



{% highlight r %}
brands[which.max(brands[,2]),]
{% endhighlight %}



{% highlight text %}
##   brand weight
## 7  GMax   1966
{% endhighlight %}



{% highlight r %}
# how many models are there per brand?
models <- aggregate(data.frame(count = hels$Brand), list(value = hels$Brand), length)
mean(models$count) # average models per brand
{% endhighlight %}



{% highlight text %}
## [1] 5.4
{% endhighlight %}



{% highlight r %}
#win.graph()
ggplot(data=models, aes(x=value,y=count)) + geom_bar(stat="identity", col="blue") + labs(title="Number of models per brand")
{% endhighlight %}

![plot of chunk unnamed-chunk-1](/public/images/helmet_weightsunnamed-chunk-1-3.svg)

## What can we say?

It looks like most helmets cluster around the 1.6 kg range. Biltwell has the lightest helmets, with an average weight of 1227.5 grams, and Gmax the heaviest at a whopping 1966 grams - almost 2 kgs!

Of course, Gmax only has 1 helmet in this dataset. AGV and HJC are the kings of variety, with 14 models each in this dataset. Bell and LS2 are close runners up with 12 models each. Fly, GMax, Joe Rocket, Klim, and Vemar only have 1 model each in this dataset. In this dataset, brands have an average of 5.4 models.

The x axis labels on the histograms are messy. I don't feel like spending the time to pretty them up. I have no idea if this information is in any way useful to anyone, but it was a fun exercise.
