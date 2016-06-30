---
layout: post
title: An example of a two-part tariff
category: micro theory
tags: micro-theory two part tariff hidden information
year: 2015
month: 11
day: 10
published: true
summary: An example of a two-part tariff for a monopolist.
---

What if a monopolist could design a pricing scheme to capture more consumer surplus when consumers have different valuations of the product? This is the idea behind price discrimination. A two-part tariff is a way to implement price discrimination when the seller is uncertain about the individual consumer's valuation.

In a two-part tariff, the seller prices the good as $$T(q) = A + pq $$. This creates a continuum of bundles, $$ \{T,q\} $$, located on a straight line. In choosing a quantity, the consumer chooses a bundle along this line, and in any bundle, the consumer pays at least $$A$$.

Two-part tariffs can only work if there is limited arbitrage. It doesn't work if a consumer can just acquire the good and re-sell it at $$A$$. An amusement park that charges an admission price and a price per ride (a time cost?) is an example. This pricing scheme is a de facto quantity discount, since the average cost goes down as the quantity purchased increases.

## An example

Suppose consumer preferences follow 

$$ \begin{align}
 U_i = \begin{cases}
    \theta_i V(q_i) - T(q_i) \ && \text{if} \ q_i \gt 0 \cr
    0 \ && \text{if} \ q_i = 0 \cr
\end{cases} 
\end{align}$$

where $$V : ~ V(0) = 0, V'(q_i) \gt 0, V''(q_i) \lt 0 $$. $$ \theta_i $$ is the "taste" parameter that varies across consumers.

Assume there are two groups of consumers: a proportion $$ \lambda $$ have $$ \theta = \theta_1 $$, and $$ 1- \lambda $$ have $$ \theta = \theta_2 $$, where $$ \theta_2 \gt \theta_1 \gt c $$, where $$ c $$ is the seller's marginal cost.

A convenient functional form that satisfies this is $$V(q) = \frac{1}{2}(1-(1-q)^2 ) $$, so that $$ V'(q) = 1-q $$. This lets us derive consumer demand, aggregate demand, and net consumer surplus. To get consumer demand, we solve

$$ \max_{q_i} \  \theta_i V(q_i) - T(q_i) $$

which gives us

$$ \begin{align}
q_i & = 1 - \frac{p}{ \theta_i } \cr
Q(p) & = 1 - p \hat{ \theta } \cr
CS_i & = \frac{1}{2 \theta_i } ( \theta_i - p)^2 \cr
\end{align} $$

where $$ \hat{ \theta } = \frac{\lambda}{\theta_1} + \frac{1- \lambda}{\theta_2} $$, the harmonic mean of the two groups' valuations.

### Fully observable $$ \theta_i $$

When the monopolist can fully observe $$ \theta_i $$, the best they can do is to set $$p=c$$ (maximize the size of the pie) and then charge each group their total surplus for the purchase, $$A_i=CS_i = \frac{1}{2 \theta_i } ( \theta_i - c)^2 $$ (perfect price discrimination). The personalized fixed fee will be higher for the type with the higher valuation.

The monopolist's profit under this pricing scheme is

$$ \pi^{pd} = \lambda \frac{1}{2 \theta_1}( \theta_1 - c)^2 + ( 1 - \lambda ) \frac{1}{2 \theta_2}( \theta_2 - c)^2 $$

If the monopolist couldn't observe $$ \theta_i $$, they couldn't implement this scheme, as $$ \theta_2 $$ would have an incentive to pretend to be $$ \theta_1 $$.

### Unobservable $$ \theta_i $$

When $$ \theta_i $$ is unobservable to the monopolist, the best they can do with a linear tariff is to charge the monopoly price.

An alternate interpretation is that the monopolist is still able to observe $$ \theta_i $$, but that consumers can fully arbitrage the good so that the monopolist is limited to linear tariffs.

Whatever the interpretation, in this case we solve the standard monopoly pricing problem with $$ Q(p) = 1 - p \hat{ \theta } $$. The price is $$ p^m = \frac{1}{2}( \hat{\theta } + c) $$ and the profits are $$ \pi^m = \frac{1}{4 \hat{\theta } }( \hat{\theta } - c )^2 $$.

We assume that $$ \theta_1 \gt \frac{1}{2}(c+ \theta_2 ) $$ , so that the monopolist finds it profitable to serve both populations.

### Linear two-part tariff

When $$ \theta_i $$ is unobservable to the seller, they can do better than monopoly pricing by using a linear two-part tariff that captures all of the lower-valuation-type's surplus.

Suppose that the marginal price is $$ p $$. The highest fixed fee under which $$ \theta_1 $$ will still purchase is $$ A = CS_1 (p) $$. $$ \theta_2 $$ will buy under this scheme, because $$ CS_2(p) \gt CS_1(p) = A $$. So the monopolist solves

$$ \begin{align} 
\max_p \ & CS_1(p) + (p-c)Q(p) \cr
  = & \frac{1}{2 \theta_1}(\theta_1 -p)^2 + (p-c)(\hat{\theta} -p) \cr
  \implies p = & \frac{ \hat{\theta} + c - 1 }{2- \theta_{1}^{-1}}
\end{align} $$

### Comparison

In the above pricing schemes,

$$ \begin{align}
c = & p^{pd} \lt p^{2t} \lt p^m \cr
 & \pi^{pd} \gt \pi^{2t} \gt \pi^m \cr  
\end{align} $$

Under perfect price discrimination, the monopolist charges a personalized fixed fee $$ A_i = \frac{1}{2 \theta_i } ( \theta_i - c)^2 $$ and captures all of the surplus. Thus, the profits in this case are the highest.

Under the linear two-part tariff, the monopolist charges a blanket fixed fee equal to the lower type's surplus, $$ A = \frac{1}{2 \theta_1 } ( \theta_1 - c)^2 $$. In a more general setting with a continuum of types, this would be the surplus of the lowest type the monopolist finds it worthwhile to go after.

Under the monopoly price, the monopolist doesn't try to capture any additional surplus based on consumer's valuations. Consequently, the profits are lowest, and the price is the highest. The higher price creates more deadweight loss, but since the monopolist doesn't have any instrument to capture the lost surplus this doesn't matter to them.

In terms of total welfare, surplus is maximized under perfect price discrimination, and is higher under the two-part tariff than under monopoly pricing. This increase in total surplus comes at a cost to the consumer, as the monopolist is able to capture all of the low type's surplus with the two-part tariff. This gives the monopolist an incentive to reduce the deadweight loss associated with monopoly pricing by reducing the marginal price. Under perfect price discrimination the total surplus is maximized, but all of it goes to the producer.

This suggests that price discrimination may be desirable in some markets to the extent that the benefits of the efficiency gains compensate consumers for their loss in surplus. I think it would be interesting to try to model this with a bargaining layer, where consumers could bargain with the firm over the surplus. I think it could be similar to the [Nash Bargaining example](http://akhilrao.github.io/micro%20theory/2015/11/01/nash-bargaining-example/).

In real life, I don't know if we often observe many examples of transfer payments from firms to consumers that would indicate some sort of bargaining over price discrimination. I think that the Second Welfare Theorem may imply it's possible, in which case the Coase Theorem would imply that if it's welfare-increasing for both parties we should see it happen. So there may be some examples out there.