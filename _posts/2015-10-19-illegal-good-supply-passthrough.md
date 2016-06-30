---
layout: post
title: Optimal supply of an illegal commodity in a symmetric Cournot market
category: micro theory
tags: micro-theory oligopoly cournot risk supply passthrough 
year: 2015
month: 10
day: 19
published: true
summary: Symmetric firms compete in a Cournot market for an illegal good with a probability of being removed from the market ("arrest"). The probability of removal depends on the aggregate quantity supplied. Pass-through is derived. 
---

This post is about a topic I've been thinking about a bit lately: illegal markets, or markets for illegal commodities. Consider a Cournot market with $$n$$ symmetric firms competing. Since the firms are symmetric, they will all supply the same quantity, $$\bar{x}$$. The firms face a generic inverse demand function, $$P(X)$$. The twist is that there is a risk of removal: with probability $$F(n \bar{x} ) $$ a firm will be removed from the market. The PDF of removal is $$ F'(X) = f(X) $$, which is thrice continuously differentiable.

I think this is a reasonable way to look at the probability of getting arrested when supplying some prohibited ("risky") commodity. The chance the seller ("the firm") gets arrested (removed from the market, 0 payoff) should depend on the number of sellers and the quantity supplied by the individual seller. In this version, it depends on both through aggregate supply. Aggregate quantity supplied is $$ X = n \bar{x} $$.

I'm not sure I like this; I would like to do it with the probability of removal as a generic function of number of sellers and individual seller's quantity supplied, $$F(x_i , n) $$. But this is a tractable start.

### Optimal supply and profits

Each firm solves

$$ \max_x~ F(X)(0) + (1-F(nx))(p(nx)-c)x $$

Their first-order condition is

$$\begin{align} 
& x[np'(X) - nf(X)p(X) - nF(X)p'(X) + cnf(X)] \cr 
& + (p(X)-c)(1-F(X)) = 0 \cr
\end{align}$$

Which gives us the optimal quantity supplied

$$ \bar{x} = \frac{-(p(X) - c)}{n[p'(X) + \frac{f(X)}{1-F(X)}(p(X)-c)]} $$

$$ \lambda(X) \equiv \frac{f(X)}{1-F(X)} $$ is the arrest hazard rate - the probability of a firm's arrest for a specific level of aggregate supply given the firm has not been arrested yet. The optimal quantity supplied is reduced from the usual optimal Cournot quantity. The reduction is increasing in the hazard rate (riskier at current $$X$$ means sell less to be safe) and the profit margin (more profit per unit means the firm can sell fewer units).

Individual firms' profits are given by

$$ \bar{\pi} = \frac{(p(X) - c)^2 }{n \ [ |p'(X)| + \lambda(X) (p(X)-c)]} $$

### Pass-through

How does having this risk in the picture change how cost affects price?

$$ \sigma(X) = -\frac{XP''(X)}{P'(X)} $$ is the curvature of the inverse demand function. Define $$ \gamma(X) = -\frac{XF''(X)}{F'(X)} $$, the curvature of the arrest likelihood. The pass-through depends on $$ \sigma(X)$$, $$ \gamma(X)$$, and $$ \lambda(X) $$.

Let the firms' first-order condition be $$R$$. $$R$$ defines the quantity supplied as an implicit function of cost. The quantity pass-through, $$\frac{\partial X}{\partial c}$$, is

$$ \begin{align}
 \frac{\partial X}{\partial c} & = - \frac{\partial R / \partial c}{\partial R / \partial X} \cr
\end{align} $$


Then

$$ \begin{align}
\frac{\partial P(X)}{\partial c} & = \frac{\partial P}{\partial X}\frac{\partial X}{\partial c} \cr
\implies \frac{\partial P(X)}{\partial c} & = \frac{Xf(X) + F(X)}{f(X)[2 \lambda^{-1} - 2x - 1 - \sigma \lambda^{-1} - p'^{-1}((p-c)(1- \gamma + ( \gamma / X) ) + p)]}  \cr
\end{align} $$

I'm not sure of my algebra, so I'll try again and update this. But the terms in the expression make some sense to me. I'm not sure what the derivative wrt the parameters are or if they make sense yet, but that would be an informative exercise.

### Summary

I say "arrest", but I guess it's really "zero payoff". Maybe arrest should be negative payoff or something. I think this could apply to any event, with the payoffs associated with $$F(x)$$ set up appropriately. I'm sure this has been done much more generally before.

I think it would be interesting to see the "risk pass-through", the change in price with respect to risk. The regular passthrough already incorporates the curvature of the risk likelihood, so maybe "risk pass-through" is unnecessary.

I haven't assumed a form for price here, but it would depend on the hazard rate through $$ \bar{x} $$. The direct effect of the number of sellers would cancel out of the price, but $$n$$ would still come in through the price and risk functions. As the hazard rate increases, I think the price should also increase if only because the quantity supplied will decrease. Without assuming a specific form, I can't go further in saying much about the price. I would like to see what the arrest risk premium looks like, if it is there.

At some point I may try to do some numerics on this model to see how stuff changes with different assumptions. One extension I've been thinking of is to include the illegal good manufacturer, and see how the organization of that side of the market affects the equilibrium.