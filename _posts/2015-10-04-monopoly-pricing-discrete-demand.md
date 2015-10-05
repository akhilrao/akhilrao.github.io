---
layout: post
title: Monopoly pricing for discrete demand
category: micro theory
tags: micro-theory monopoly pricing discrete demand 
year: 2015
month: 10
day: 04
published: true
summary: How should a monopoly price optimally when demand is discrete? A derivation and an example.
---

How should a monopoly price when demand is discrete? This situation arises whenever the consumer is choosing between "buy" or "not buy", as opposed to a choice of a continuous quantity.

Let the consumers' valuations of the good be given by \\(V \sim F(v)\\), where \\(F(v)\\) is the [CDF](https://en.wikipedia.org/wiki/Cumulative_distribution_function) of the valuations and \\(f(p)\\) is the associated density. The probability that a consumer chooses to buy the good is the probability that their valuation is greater than the price, i.e. \\(1-F(p)\\). The seller's expected payoff is then

$$ \pi(p) = (p-c)(1-F(p)) $$

This is the usual profit expression, but with \\(1-F(p)\\) as the demand. Maximizing this gives us

$$ \begin{align}
 \text{FOC:} \ \ & 1 - F(p) - pf(p) + cf(p) = 0 \cr
 \implies \ \ & p = c + \frac{1-F(p)}{f(p)} \cr
\end{align}$$

This is called "markup pricing"; the price is the marginal cost \\(c\\) plus a markup, \\( \frac{1-F(p)}{f(p)} \\). The markup is the inverse of the [hazard rate](https://en.wikipedia.org/wiki/Failure_rate#hazard_function) of the demand function. The hazard rate measures how likely an event (a "failure", or "hazard") is to happen given that it hasn't happened before. In the case of demand, the hazard rate is the probability that a consumer will buy the good at a certain price \\(p\\), conditional on having not bought the good before. So it makes some sense that the markup would be based on the hazard rate of demand.

### An example

Suppose \\( F(v) \sim U[a,b]\\) - the consumers are equally likely to be willing to pay anywhere from \\(a\\) to \\(b\\) for the product. Then \\(F(v) = \frac{v-a}{b-a} \\), and \\(f(v) = \frac{1}{b-a}\\). Plugging this into the pricing formula we derived above, we get

$$\begin{align}
p & = c + \frac{1- \frac{p-a}{b-a}}{\frac{1}{b-a}} \cr
\implies p & = \frac{c+b}{2} \cr
\end{align}$$

So, for uniformly distributed valuations of the product, the monopolist should optimally price their product at half of marginal cost plus the maximum valuation.

### More on the hazard rate

The hazard rate, \\(\lambda\\), turns out to be important to analyzing markets. We usually assume that \\(\lambda\\) is nondecreasing in \\(p\\). This is equivalent to assuming that the density of demand is log-concave. A proof of the statement follows.

##### Proof

$$\begin{align}
f'(x)[1-F(x)] & = \int_x^\infty f'(x)f(t)dt \cr
 & = \int_x^\infty \frac{f'(x)}{f(x)}f(t)f(x)dt \cr
 & \ge \int_x^\infty \frac{f'(t)}{f(t)}f(t)f(x)dt  ~~~~(\because t \ge x) \cr
 & = f(x)[f(\infty) - f(x)]
 & \ge - f(x)^2
\end{align}$$

So log-concave \\(f(x) \equiv \lambda\\) is nondecreasing. 