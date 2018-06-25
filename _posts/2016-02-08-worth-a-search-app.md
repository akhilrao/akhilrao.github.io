---
layout: post
title: Is this worth a search?
category: shiny
tags: expected value, micro theory, r, shiny, app, rational belief
year: 2016
month: 2
day: 7
published: true
summary: My second Shiny app. Calculates the expected value of one search over a range of beliefs given wtp, average price, search cost, and number of sellers.
---

Another simple Shiny app, this time to answer the question, ["is this worth searching for?"](https://akhilrao.shinyapps.io/worthASearchApp/). 

The basic idea is taken from this [earlier post](http://akhilrao.github.io/micro%20theory/2015/10/08/imperfect-information-car-search.html) about searching for a used car.

For example: Suppose you are thinking about looking for a used car, and you want to see whether it's worth searching for. You plug in your willingness-to-pay for a car, the cost to you to find and inspect one car, the number of sellers in the region, and the average price they're asking for. Using the formulas from the post for the expected quality of the average seller and the expected value of one search, we have

$$\begin{align}
\hat{\beta} &= \frac{\beta}{N} \left( \frac{1- \beta^N}{1- \beta } \right) \cr
EV(\text{search}) &= \hat{\beta}(v-p) - c
\end{align}$$

where $$N$$ is the number of sellers, $$\beta$$ is the probability the average seller has what you want, $$p$$ is the average price, and $$c$$ is the search cost. If the expected value of a search is greater than 0, it's worth at least one search.

Using the app, I can see what the probability of a seller having what I want would need to be for a search to be worth it. I can interpret the point on the x axis where $$EV(\text{search})=0$$ as the minimum level of belief I would have to hold that the average seller has what I'm looking for for a search to be rational.
