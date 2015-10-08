---
layout: post
title: A two period planner's problem with heterogeneous time preferences
category: macro theory
tags: macro-theory two period heterogeneous time preferences social planner
year: 2015
month: 10
day: 07
published: true
summary: A two-period economy is populated by two types of agents with different time preferences. It is ruled by a benevolent social planner. How do the optimal allocations change when a storage technology is introduced?
---

Two period models are nice because they're usually easy to solve and can get at some good intuition. Two period models and most dynamic economic models use a discount rate, often \\(\beta\\) or \\(\delta\\), which is how much the agent values future payoffs in relation to present payoffs.

In this model there are \\(n\\) agents in total, \\(k\\) of whom have discount rate \\(\beta\in [0,1]\\) (impatient), and the remaining \\(n-k\\) with discount rate \\(\beta =1\\) (patient). The agents live for two periods, \\(t=1,2\\), and receive a consumption endowment of 1 in the period 1 and \\(e\gt 0\\) in period 2. They have preferences over per-period consumption given by \\(\log c_t\\). Their lifetime utilities are

$$\begin{align}
 \text{k impatient:} ~~ V(c_1,c_2) &= \log c_1 + \beta \log c_2 \cr
 \text{n-k patient:} ~~ U(c_1,c_2) &= \log c_1 + \log c_2 \cr
\end{align}$$

They want to choose consumption plans that maximize their utilities. The benevolent dictator/social planner wants to maximize the social welfare function

$$\begin{align}
 W &= kV + (n-k)U \cr
 &= k( \log c_{1}^{v} + \beta \log c_{2}^{v}) + (n-k)( \log c_{1}^{u} + \beta \log c_{2}^{u}) \cr
\end{align}$$

Assume the planner has to choose the same consumption plan for every agent of the same type, but can choose different consumption plans for the patient and impatient agents.

#### Benchmark case: No storage technology

Suppose there are no refrigerators or other storage technologies, so that the consumption good can't be carried across time. The dictator's problem is

$$\begin{align} 
\max_p & ~~W ~~ \text{s.t.}~~ c_1^u + c_1^v \le n ~ , ~ c_2^u + c_2^v \le ne \cr
\implies L & = W + \lambda_1 (n-c_1^u - c_1^v) + \lambda_2 (ne-c_2^u - c_2^v) \cr
\end{align}$$

Since the utility functions are log, all the variables must be strictly greater than 0 and we can ignore non-negativity constraints in the lagrangian.

From saddle point conditions, we get that the optimal consumption plans will satisfy

$$\begin{align}
c_1^u + c_1^v &= n \cr
c_2^u + c_2^v &= ne \cr
kc_1^u &= (n-k)c_1^v \cr
\beta kc_1^u &= (n-k)c_1^v \cr
\end{align}$$

Without a use for savings, the optimal plan is to just consume all resources in the period they're received: \\(c_1^v = k\\), \\(c_1^u = (n-k)\\), and \\(c_1^v=\frac{k \beta ne}{n-k(1-\beta )}, c_1^u=ne-\frac{k \beta ne}{n-k(1- \beta )}\\). The lack of savings technology means \\(\beta\\) only affects the second period allocation, not the first. When \\(\beta \lt 1\\), the impatient agents receive less consumption good because they care less about this period. When \\(\beta=1\\) each group of agents just consumes their period endowment.

#### With a storage technology

Now suppose a storage technology is developed, so that endowments can be carried across periods. The technology has a transformation rate \\(R\gt 0\\) so that 1 unit of the good stored in period 1 becomes \\(R\\) units of the good in period 2. The dictator's problem is now

$$\begin{align} 
\max_p & ~~W ~~ \text{s.t.}~~ R(c_1^u + c_1^v) + c_2^u + c_2^v \le ne + Rn \cr
\implies L & = W + \lambda_1 (n-c_1^u - c_1^v) + \lambda_2 (ne-c_2^u - c_2^v) \cr
\end{align}$$

From saddle point conditions, we get that the optimal consumption plans will be

$$\begin{align}
c_1^u &=k \cr
c_1^v &=n-k \cr
c_2^u &=ne-\frac{k \beta ne}{n-k(1- \beta )} \cr
c_2^v &=\frac{k \beta ne}{n-k(1-\beta )} ne \cr
\end{align}$$

The welfare effects of the technology depends on \\(\beta\\) and \\(R\\), the rates of time preference and transformation. If the transformation rate is equal to the agent's discount rate, then the agent will be better off because they smooth their consumption by saving in the first period.

If \\(\beta = R^{-1}\\), the impatient type will be better off from the technology, but the patient type's welfare change is ambiguous. If \\(\beta = R^{-1} = 1\\), both types will be better off from the technology. 

If \\(\beta \neq R^{-1} \\), the impatient type will not necessarily be better off. If \\(\beta \neq R^{-1} \\), but \\(R^{-1}=1\\), the patient type will be better off.

As long as \\(\beta \lt 1\\), the savings technology cannot make them both better off.