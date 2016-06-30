---
layout: post
title: A representative agent's variable capacity utilization problem
category: macro theory
tags: macro-theory representative agent variable capacity
year: 2015
month: 10
day: 18
published: true
summary: A planner solves a representative agent's problem when capital can be used at a varying utilization rate, which in turn affects the depreciation rate.
---

Suppose a planner is solving a representative agent's problem. The agent can use capital at a varying rate $$\mu \in [0,1] $$ and the depreciation rate $$ \delta $$ is affected by capital utilization, specifically $$ \delta( \mu ) = \delta \mu^{\alpha} $$ with $$ 1 \lt \alpha \lt \infty $$. The planner solves

$$ \begin{align}
\max_{\\{c_t\\},\\{x_t\\},\\{k_{t+1}\\},\\{\mu_t\\}} ~~ & \sum_{t=0}^{\infty} \beta^t u(c_t) \cr
\text{s.t.}~~ & c_t + x_t \le f( \mu_t k_t ) \cr
& k_{t+1} \le (1-\delta(\mu_t))k_t + x_t \cr
& c \ge 0,~ x_t \ge 0,~ k_{t+1} \ge 0,~ \mu_t \in [0,1] ~~ \forall t \cr
\end{align} $$

where $$ \beta \in (0,1) $$, $$k_0 \gt 0 $$, and $$ \delta \in (0,1) $$. The utility function $$u$$ and production function $$f$$ are strictly concave, strictly increasing, and twice continuously differentiable, with $$f(0) = 0 $$.

The planner's lagrangian is

$$\begin{align}
\mathcal{L} = & u(c_t) + \lambda_{1,t}[f(\mu_t k_t) - c_t - x_t] + \lambda_{2,t}[(1-\delta\mu^{\alpha})k_t + x_t - k_{t+1}] \cr & + \gamma_{1,t} c_t + \gamma_{2,t} x_t + \gamma_{3,t} k_{t+1} + \gamma_{4,t} \mu_t + \gamma_{5,t}(1- \mu_t) \cr 
\end{align}$$


### Saddle Point Conditions

We can rule out 4 corners: $$c_t =0 ~~\forall t$$,$$k_{t+1} =0 ~~\forall t$$,$$x_t =0 ~~\forall t$$,$$\mu_t =0 ~~\forall t$$. The contradictions come from $$u$$ being strictly concave and strictly increasing, so $$c_t$$ can't be 0. Assuming the choice variables are all greater than 0, we get the following saddle point conditions:

$$ \begin{align}
u'(c_t ) = & \lambda_{1,t} \cr
\lambda_{1,t} = & \lambda_{2,t} \cr
\lambda_{1,t} = & \beta \lambda_{1,t+1} (\mu_{t+1} f^{k} (\mu_{t+1} k_{t+1}) + (1- \delta \mu^{\alpha})) \cr
\gamma_{5,t} = & \lambda_{1,t} k_t (f^{\mu} (\mu_t k_t) - \delta \alpha \mu^{\alpha-1}) \cr
\end{align}$$

$$\begin{align}
\lambda_{1,t}(f(\mu_t k_t) - c_t - x_t) & = 0 \cr
\lambda_{2,t}((1- \delta \mu^{\alpha})k_t + c_t - k_{t+1}) & = 0 \cr
\gamma_{5,t} (1- \mu_t) & = 0 \cr
\end{align} $$

where $$ f^{\mu} (\mu k) $$ and $$ f^k (\mu k) $$ are the partial derivatives of $$ f $$ with respect to the superscripted arguments. 

Since this is an infinite-horizon problem, we need something to rule out an unbounded solution for the asset. One way to do this is with a [transversality condition (TVC)](http://www.rieb.kobe-u.ac.jp/academic/ra/dp/English/dp180.pdf). I think we need a TVC for each asset variable in the economy to rule out bubbles in those assets.

We can derive the TVC for capital as follows: 
Suppose $$T$$ is the final period. Then $$ \gamma_{3,T}k_{T+1} = 0$$. In the final period, all $$T+1$$ multipliers must be 0. So $$ \gamma_{3,T} = \lambda_{1,T} $$. Discounting back to $$t=0$$, $$ \beta^T \lambda_{1,T} K_{T+1} = 0 $$, and in the limit, $$ \lim_{T \to \infty} \beta^T \lambda_{1,T} K_{T+1} = 0 $$. 

Full capacity utilization may be optimal.

### The Steady State

The steady state is when the choice variables of the model are stationary. Here, $$ c_t = c^*, k_t = k_{t+1} = k^* , x_t = x^*, \mu_t = \mu^* ~~ \forall t$$.

In the steady state, the saddle point conditions become

$$ \begin{align}
& \beta ( \mu^* f^k (\mu^* k^*) + (1-\delta \mu^{* \alpha})) = 1 \cr
& \gamma_{5}^* = \lambda_{1}^* k^* (f^{\mu} (\mu^* k^*) - \delta \alpha \mu ^{* \alpha - 1}) \cr
& \gamma_{5}^* (1- \mu^*) = 0 \cr
& f(\mu^* k^*) = c^* + k^* \delta \mu^{* \alpha} \cr
\end{align}$$

The first condition there is the [Euler-Ramsey Condition (ERC)](http://www.dictionaryofeconomics.com/article?id=pde2008_E000287) for this problem. 

### Existence and Uniqueness

Under what conditions would the steady state exist and be unique? We can consider this in two cases: full capacity utilization and partial capacity utilization.

**Full capacity utilization**

In this case, $$ \mu^* = 1 , \gamma_5^* \ge 0 $$. From the ERC, we get that

$$ f^k ( k^*) = \beta^{-1} + \delta - 1 $$

If we assume that $$ f^k ( k^*) $$ is such that

$$\begin{align}
\lim_{k \to 0} \beta ( f^k ( k^*) - \delta + 1 ) \gt & 1 \cr  
\lim_{k \to \infty} \beta ( f^k ( k^*) - \delta + 1 ) \lt & 1 \cr  
\end{align}$$

then strict concavity and twice continuous differentiability of $$ f $$ guarantee existence and uniqueness of the steady state. I think this would be considered a corner solution of the model.

What is consumption in this case? The fourth steady state condition tells us that $$ c^* = f(k^* ) - k^* \delta $$, and the ERC tells us that $$ f(k^* ) - \delta = \beta^{-1} - 1 \gt 0 $$. So consumption is something strictly positive whenever it is optimal to utilize capacity fully.

**Partial capacity utilization**

In this case, $$ \mu^* \lt 1 , \gamma_5^* = 0 $$. This is a fully interior solution, and at the steady state $$ f^{\mu} = f^k $$ (equal marginal utility of inputs). From the ERC, we get that

$$ \mu^* = \left[ \left( \frac{1- \beta}{\beta} \right) \left( \frac{1}{\delta (\alpha - 1)} \right) \right]^{\frac{1}{\alpha}} $$

$$ \mu^* $$ exists as long as 

$$ \left( \frac{1- \beta}{\beta} \right) \left( \frac{1}{\delta (\alpha - 1)} \right) \lt 1 $$

The second steady state condition pins down the marginal utility of capacity utilization through the depreciation rate. Formally, $$ f^{\mu} ( \mu^* k^*) = \delta \alpha \mu^{* \alpha - 1} $$. If we further assume

$$ \lim_{k \to 0} f^k ( \mu k ) = \infty $$

then we get that $$ k^* $$ exists $$ \forall \mu \lt 1 $$.

What is consumption in this case? The fourth steady state condition tells us that $$ c^* = f( \mu^* k^* ) - k^* \delta \mu^\{* \alpha} $$. At the steady state, we know that $$ f( \mu^* k^* ) \gt k^* \delta \mu^\{* \alpha} $$ - the optimal solution is such that the level of output is greater than the amount of depreciated utilized capital in each period. So consumption is also strictly positive when it is optimal to partially utilize capacity.

