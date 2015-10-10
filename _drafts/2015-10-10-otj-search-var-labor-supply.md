---
layout: post
title: On-the-job search with dynamic programming
category: macro theory
tags: macro-theory on-the-job labor search bellman dynamic programming
year: 2015
month: 10
day: 10
published: true
summary: An agent tries to maximize utility while searching over a distribution of job offers. What can we say about the agent's problem and its solution?
---

Consider a worker trying to maximize lifetime consumption and leisure. She needs a job to get stuff to consume, which eats into her leisure time, and gives us an interesting tradeoff to study.

The total time available is normalized to 1 and everything is measured in terms of the consumption good. For any wage \\(w_t\\), the worker needs to decide how much time to work, \\(1-l_t\\). Her labor income is \\(w_t (1-l_t)\\). If she's unemployed, she gets to spend all her time on leisure, but she gets no income and therefore no consumption. Formally, the worker solves

$$\begin{align}
\max_{c_t,l_t} &~ E_0 \sum_{t=0}^{\infty} \beta^t[\log c_t + \phi \log l_t] \cr
\text{s.t.} &~ 0 \le l \le 1 \cr
&~ c_t \le w_t (1-l_t)
\end{align}$$

where \\(\beta \in (0,1)\\) and \\(\phi \gt 0\\).

In the beginning of each period, the unemployed worker receives an offer \\(w \in [0,B]\\) drawn randomly from the continuous distribution function \\(F(w)\\). If the worker accepts the offer, she begins receiving labor income in the same period.

The employed worker can pay a search cost \\(z \gt 0\\) to receive another offer randomly drawn from the same distribution, \\(F(w)\\) - she can keep searching on the job. If she accepts the offer, she begins working at the new job in the following period.

To keep things simple, let's assume there is no exogenous job destruction; once an offer is accepted, the job survives with probability 1. There is no saving or borrowing.

The utility function is log in consumption and leisure, so we can rule out 0 and \\(\infty\\) as solutions. The unemployed worker will always accept their first job offer. The action is in the employed worker searching.

#### The Bellman equations

To solve this problem, we break the consumer's infinite period down into a series of smaller one-period decisions and find an optimal solution to that one equation ([dynamic programming](https://en.wikipedia.org/wiki/Dynamic_programming)). In each period, the workers face the following decisions:

$$\begin{align}
\text{Unemployed:} ~~ V^u (w) & = \max_l \\{accept , ~ reject \\} \cr
& = \max_l \\{ u(w(1-l),l) + \beta V^e (w), u(0,1)\\} \cr
\end{align}$$

Clearly, the unemployed will always accept any offer \\(w \gt 0\\).

$$\begin{align}
\text{Employed:} ~~ V^e (w) & = \max_l \\{don't~search , ~ search \\} \cr
& = \max_l \left\\{ \frac{u(w(1-l),l)}{1-\beta}, \frac{u(w(1-l),l)}{1-\beta} + \frac{\beta}{1-\beta} \int_w^B (V^e (w') - V^e (w)) \ dF(w') \right\\} \cr
\end{align}$$

\\(w'\\) is the next period's offer. The search integral is a [Lebesgue integral](https://en.wikipedia.org/wiki/Lebesgue_integration). We can see if there's a reservation wage for the worker to 