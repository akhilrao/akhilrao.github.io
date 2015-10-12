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
\max_{c_t,l_t} &~ E_0 \sum_{t=0}^{\infty} \beta^t[\ln c_t + \phi \ln l_t] \cr
\text{s.t.} &~ 0 \le l \le 1 \cr
&~ c_t \le w_t (1-l_t)
\end{align}$$

where \\(\beta \in (0,1)\\) and \\(\phi \gt 0\\).

In the beginning of each period, the unemployed worker receives an offer \\(w \in [0,B],~B \lt \infty\\), drawn randomly from the continuous distribution function \\(F(w)\\). If the worker accepts the offer, she begins receiving labor income in the same period.

The employed worker can pay a search cost \\(z \gt 0\\) to receive another offer randomly drawn from the same distribution, \\(F(w)\\) - she can keep searching on the job. If she accepts the offer, she begins working at the new job in the following period.

To keep things simple, let's assume there is no exogenous job destruction; once an offer is accepted, the job survives with probability 1. There is no saving or borrowing.

The utility function is natural log in consumption and leisure, so we can rule out 0 and \\(\infty\\) as solutions. The unemployed worker will always accept their first job offer. The action is in the employed worker searching.

#### The Bellman equations

To solve this problem, we break the consumer's decision over infinite periods down into a series of smaller one-period decisions and find an optimal solution to that one equation ([dynamic programming](https://en.wikipedia.org/wiki/Dynamic_programming)). In each period, the workers face the following decisions:

$$\begin{align}
\text{Unemployed:} ~~ V^u (w) & = \max_l \\{accept , ~ reject \\} \cr
& = \max_l \\{ u(w(1-l),l) + \beta V^e (w), u(0,1)\\} \cr
\end{align}$$

Clearly, the unemployed will always accept any offer \\(w \gt 0\\).

$$\begin{align}
\text{Employed:} ~~ V^e (w) & = \max_l \\{don't~search , ~ search \\} \cr
& = \max_l \left\\{ \frac{u(w(1-l),l)}{1-\beta}, \frac{u(w(1-l)-z,l)}{1-\beta} + \frac{\beta}{1-\beta} \int_w^B (V^e (w') - V^e (w)) \ dF(w') \right\\} \cr
\end{align}$$

\\(w'\\) is the next period's offer. The search integral is a [Lebesgue integral](https://en.wikipedia.org/wiki/Lebesgue_integration) over the wage distribution. The worker will obviously not accept an offer at a wage lower than the current one, so we only integrate over the current wage to the upper bound.

#### Is there a reservation wage?

In this context, "is there a wage \\(\bar{w}\\) such that the employed worker searches if and only if \\(w \le \bar{w}\\)"? The answer is yes. To find \\(\bar{w}\\), let's assume it exists, in which case it satisfies 

$$V^e (Don't~search) = V^e (Search)$$ 

Then we do some algebra and get that

$$\bar{w}:~ \ln(w(1-l)) - \ln(w(1-l)-z) = \beta \int_{\bar{w}}^B (V^e (w') - V^e (\bar{w})) \ dF(w') $$

The LHS is the search penalty to the marginal utility of consumption (marginal cost of searching), and the RHS is the discounted expected increase in wage from the search (marginal benefit of searching).

What else can we say about the worker's search behavior?

* As \\(w \to 0 \\), \\(V^e_s (w) \to -\infty\\) faster than \\(V^e_n (w) \to -\infty\\). So at a low enough wage, the search cost \\(z\\) has a large effect on the worker's utility and she won't search.

* At \\(w=B\\),
$$\\begin{align}
V^e_s (B) & = (1-\beta)^{-1} (\ln(B(1-l)-z) + \phi \ \ln(l)) \cr
V^e_n (B) & = (1-\beta)^{-1} (\ln(B(1-l)) + \phi \ \ln(l)) \cr
\implies V^e_n (B) & \gt V^e_s (B)
\end{align}$$
So the worker won't search when she's already earning the maximum wage, which is pretty intuitive.

So the worker won't search at a low enough wage, and she won't search at the highest wage... since the value of searching and not searching are both concave functions, this means they must touch twice if they cross. They could potentially touch only once if they don't cross. This makes things complicated, since now there are potentially three wages where the condition we used to find the reservation wage holds: in the case where they cross, there's the wage at which workers start searching and the wage at which the workers stop searching (what we found); in the case where they touch only once, there's the wage at which workers are indifferent between searching and not searching.  

To make life easier, let's assume \\(z\\) is small enough that \\(V^e_s (w) \lt V^e_n (w)\\) occurs on the lower end of the wage scale only at wages below 1 (so negative utilities), and the only place where our reservation wage condition holds that matters is the one we explored. Utility has a cardinal interpretation here, so we can rule out the case of the worker earning so little she can't afford to search. 

Anyway, with this behavior, in the long run we should expect every worker to end up with a wage above their reservation wage, since they'll keep searching for a better job otherwise.

In a future post, I'll relax the assumption that \\(z\\) is very small and sketch out all the cases of the reservation wage, and explore the worker's labor supply behavior in this model.

Dynamic programming is a powerful way to get a simple solution to an optimization problem. Without it, we would have had to set up and solve an infinite-period optimization. With it, we can just find a consistent decision rule for an arbitrary period. To use DP, we need some assumptions on the functions we're optimizing. When I revisit this model, maybe I'll talk about those assumptions as well.