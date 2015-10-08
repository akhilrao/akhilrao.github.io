---
layout: post
title: When is it optimal to search for a used car?
category: micro theory
tags: micro-theory imperfect information search lemons
year: 2015
month: 10
day: 07
published: true
summary: If you have to search randomly across sellers of varying quality, when is it worth your time to search?
---


Suppose you are considering purchasing a used car. There are \\(N \ge 1\\) sellers. The value of seller \\(i\\)'s car is \\(v_i\\), given by

$$v_i =
\begin{cases}
1 ~~ \text{with probability} ~~ \beta_i \cr
0 ~~ \text{with probability} ~~ 1- \beta_i \cr
\end{cases}$$

where \\(\beta_i = \beta^i, i=1,...,N\\). So as the number of sellers increases, we only add sellers worse than the current ones. Since we search in a random order, for a given N this just tells us the distribution of sellers. A seller's \\(\beta_i\\) is their private information. This is sort of like Craigslist or some other internet search; you search randomly over sellers of uncertain quality. 

You're a savvy shopper though, and before you buy the car you're going to get it inspected, which costs \\(c\\). You could also think about this as a search cost, to avoid confusion over inspection-less visits to sellers. Suppose the price of a car is \\(1/2\\) from every seller, for simplicity. You can inspect as many sellers as you want, but only one at a time.

Based on \\(\beta\\), \\(N\\), and \\(c\\), when will it be optimal for you to search at least once?

#### Benchmark case: Expected-utility maximizer

An expected utility maximizer would start by figuring out the expected value of a search,

$$\begin{align}
\hat{\beta} &= \frac{1}{N} \sum_{i=1}^{N} \beta^i \cr
&= \frac{\beta}{N} \left( \frac{1- \beta^N}{1- \beta } \right)
\end{align}$$

We assume we're starting from no prior searches so that we don't have to condition on information and update beliefs, which any optimizing agent ought to be doing. We want the expected value of a search, net of inspection costs, to be positive, or

$$\begin{align}
\hat{\beta}(v-p) - c &\ge 0 \cr
 \implies \hat{\beta}(1/2) - c &\ge 0 \cr
 \implies c &\le \frac{1}{2}\hat{\beta} \cr
\end{align}$$

We use \\(\hat{\beta}(v-p)\\) instead of \\(\hat{\beta}-p\\) because our value from the car is \\(1\\) for sure - the uncertainty is in whether or not we see it, not in the value itself.

This gives us a bound on whether or not it is optimal to search - an expected-utility maximizer will search if the expected value of the car is greater than the inspection cost.

This makes sense, but there's another way we can approach this question.

#### A worst-case utility maximizer

I guess another way to put this is a "minimum-utility maximizer". I've never heard that term before. I think worst-case bounds are more popular in computer science than economics, which is probably why I haven't heard it called that. 

The worst case we could encounter on our first search is to visit seller \\(N\\) first. A minimum-utility maximizer only wants to search if even in this bad draw is worth their time, or

$$\begin{align}
\beta^N(v-p) - c &\ge 0 \cr
\implies c &\le \frac{1}{2}\beta^N \cr
\end{align}$$

which looks pretty similar to the expected-utility maximizer's solution, but with \\(\beta^N\\) instead of \\(\hat{\beta}\\). This implies a more "conservative" decision rule than the benchmark solution.

#### Summary

This is a pretty cool problem. I disagreed with my professor about the solution - I used the worst-case bound, while he used the expected-utility bound. He pointed out that in this case, the worst-case bound is a subset of the expectation-bound (I think that must be true generally), so the worst-case bound ignored a large area where an expected-utility maximizer would find it optimal to search. I agree with his argument, but I still prefer the worst-case bound to the expectation-bound. In writing this post, I've been trying to understand why.

I think the worst-case bound is a more general solution to the problem (or a solution to a more general problem) than the expectation-bound. In this problem, we're assuming we know a lot about the distribution of values - we know pretty much exactly what it looks like always, and so we use the expectation to figure out what to do. If we relax that assumption to only knowing the supports of the distribution of values, then we can't take an expectation to maximize expected utility. But we can still find a worst-case bound and maximize a minimum utility. That said, if we have the information about the distribution, why would we ignore it?

While the minimum-utility maximizer may ignore opportunities that the expected-utility maximizer would take, the minimum-utility maximizer can consistently apply their decision rule in more situations than the expected-utility maximizer can. 

I'm not sure whether I maximize expected-utility or minimum-utility, but I like this problem a lot.