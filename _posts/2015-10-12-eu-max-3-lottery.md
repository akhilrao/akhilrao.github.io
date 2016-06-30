---
layout: post
title: An expected-utility maximizer and 3 lotteries
category: micro theory
tags: micro-theory lottery risk preference eu-max
year: 2015
month: 10
day: 12
published: true
summary: An expected-utility maximizer faces three lotteries. What will the agent choose?
---

Consider an individual with preferences over lotteries that have an expected-utility representation. There are three lotteries this individual can choose from:

$$ L_1
\begin{cases}
\begin{align}
200 ~~~ &P(200) = 1 \cr
\end{align}
\end{cases}$$

$$ L_2
\begin{cases}
\begin{align}
0 ~~~ &P(0) = 2/3 \cr
200 ~~~ &P(200) = 1/6 \cr
1000 ~~~ &P(1000) = 1/6 \cr
\end{align}
\end{cases}$$

$$ L_3
\begin{cases}
\begin{align}
0 ~~~ &P(0) = 1/3 \cr
400 ~~~ &P(400) = 1/3 \cr
1000 ~~~ &P(1000) = 1/3 \cr
\end{align}
\end{cases}$$

The expected utilities of the lotteries are:

$$\begin{align}
EU_{L1} =& (200)(1) = 200 \cr
EU_{L2} =& (0)(1/3) + (100)(1/6) + (1000)(1/6) \cr
 =& 200 \cr
 EU_{L3} =& (0)(1/3) + (100)(1/3) + (1000)(1/3) \cr
 =& 1400/3 \cr
\end{align}$$

We can take a first pass at ordering the three lotteries by expected utility alone. This gives us that $$ L_3 \succ L_2 \sim L_1$$. To go further, we can use the concept of [stochastic dominance](https://en.wikipedia.org/wiki/Stochastic_dominance).

$$X \succ_{FSD} Y$$ (X first-order stochastically dominates Y) if $$F_x (t) \le F_y (t) ~ \forall t \in [a,b]$$, where $$[a,b]$$ is the support of $$F_x$$ and $$F_y$$. This is equivalent to saying $$X \succ_{FSD} Y$$ iff $$ E[u(x)] \ge E[u(y)] ~ \forall$$ nondecreasing, continuous functions $$u$$. We apply this concept when we order the lotteries by expected utility.

Second-order stochastic dominance is a refinement on this. We say $$X \succ_{SSD} Y$$ (X second-order stochastically dominates Y) if $$\int_a^w F_x (t) dt \le \int_a^w F_y (t) dt ~ \forall w \in [a,b]$$, where $$[a,b]$$ is the support of $$F_x$$ and $$F_y$$. This is equivalent to saying $$X \succ_{SSD} Y$$ iff $$ E[u(x)] \ge E[u(y)] ~ \forall$$ nondecreasing, continuous, and *concave* functions $$u$$. We apply this concept when we order the lotteries by expected utility.

If all we have is that the agent is an expected-utility maximizer then all we can do is apply first-order stochastic dominance and say that the agent will prefer $$L_3$$ over $$L_1$$ and $$L_2$$, and be indifferent between $$L_1$$ and $$L_2$$.

If we know or are willing to assume that the agent is risk-averse - that their utility function $$u$$ is concave - then we can apply second-order stochastic dominance and rank the lotteries $$L_3 \succ L_1 \succ L_2 $$. The risk-averse agent would rather take the safe 200-for-sure than the risky 200-on-average.