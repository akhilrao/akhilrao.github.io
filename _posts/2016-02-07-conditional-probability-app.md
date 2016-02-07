---
layout: post
title: A conditional probability app
category: web
tags: conditional probability, bayes rule, r, shiny, app
year: 2016
month: 2
day: 7
published: true
summary: My first Shiny app! Calculates the conditional probability of an event A given an event B and a population P for a range of assumed P(B|A).
---

I wrote my first-ever Shiny app! My first-ever app, too. It's a simple [conditional probability calculator](https://akhilrao.shinyapps.io/conditionalProbApp/). 

Say you have two events, \\(A\\) and \\(B\\), which occur over a population \\(N\\). Input the number of occurrences of \\(A\\) and \\(B\\) and the size of \\(N\\), and the app will apply Bayes' rule to show you \\(P(A|B)\\) for beliefs you may hold over \\(P(B|A)\\).

For example: Suppose you want to know the probability that someone who died in the USA in 2010 was 85+ years old. Event A is taken to be the number of deaths in the USA in 2010, event B is taken to be the population that was 85+ years old in the USA in 2010, and the population size is taken to be the average total population of the USA in 2010. Three Wolfram Alpha queries later we have

$$\begin{align}
P(A) &= \frac{2,550,000}{310,000,000} = 0.008 \cr
P(B) &= \frac{5,176,00}{310,000,000} = 0.017
\end{align}$$

By Bayes' rule, we have

$$ P(A|B) = P(B|A) \frac{P(A)}{P(B)} $$

I think \\( P(A)/P(B) \\) is called the base rate. Using the app, you can see how the probability someone died given they were 85 or older would change depending on the probability of being 85 or older given they died (in the USA in 2010), or \\(P(\text{died in USA in 2010|85 or older in USA in 2010})\\) as a function of your beliefs over \\(P(\text{85 or older in USA in 2010|died in USA in 2010})\\). I used this example as a "comparison event" for the app.

In the picture below, the red line is \\(P(\text{died in USA in 2010|85 or older in USA in 2010})\\), and the black line is \\(P(A|B)\\) for a hypothetical event where \\(P(A) = 15/100\\) and \\(P(B) = 50/100\\).

[![Example](/public/images/conditionalProbApp/stock.png "Example")](/public/images/conditionalProbApp/stock.png "Example")

It's very basic and kinda ugly right now. I'll update it periodically to make it more useful and prettier.

I wrote this app to help me think through conditional probabilities more clearly. Often I hold beliefs over some \\(P(B|A)\\) and use those beliefs to infer something about the corresponding \\(P(A|B)\\), not necessarily considering the base rate. Hopefully I'll neglect base rates a little less going forward.