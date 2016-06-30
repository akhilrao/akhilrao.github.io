---
layout: post
title: A symmetric Circle City Hotelling model
category: micro theory
tags: micro-theory oligopoly symmetric hotelling circle
year: 2015
month: 10
day: 05
published: true
summary: Symmetric firms compete for a uniform mass of consumers on a circle. Consumers face a constant travel cost.
---

This model is very similar to [Triangle City](https://akhilrao.github.io/micro%20theory/2015/09/28/hotelling-triangle-city/).

### Circle City

Let the circle be of circumference $$d\pi$$. There are $$n$$ symmetric firms facing marginal cost $$c$$ located equidistant from each other on the circle. Firm $$i$$ faces two marginal consumers: $$x_{i-1}$$ (the firm to its left) and $$x_i$$ (the firm to its right). The marginal consumers are identical, and firm $$i$$ and firm $$i+1$$ compete over consumer $$x_i$$. Consumers face a travel cost of t. $$x_i$$'s utility is given by:

$$\begin{align} 
v - p_i - tx_i &= v - p_{i+1} - t(\frac{td\pi}{n}-x_i) \cr
\implies x_i &= \frac{p_{i+1}-p_i+(td\pi/n)}{2t} \cr
\end{align}$$

Since the consumers are identical, this holds for every marginal consumer. Firm $$i$$ faces $$x_i + x_{i-1}$$, and solves

$$max_p (p_i-c)\left[\frac{p_{i+1}-p_i+(td\pi/n)}{2t} + \frac{p_{i-1}-p_i+(td\pi/n)}{2t} \right] $$

$$\begin{align} 
\text{FOC:} &~~~ \left[\frac{p_{i+1}-p_i+(td\pi/n)}{2t} + \frac{p_{i-1}-p_i+(td\pi/n)}{2t} \right] - (p_i-c)\frac{2}{2t} \cr
\implies & ~~~ \frac{td\pi}{n} - (p_i-c)\frac{1}{t} = 0 ~~~~~~ (\pi_i=\pi_j ~ \forall~i,j~\because \text{firms are symmetric})\cr
\implies & p_i^* = c + \frac{td\pi}{n}
\end{align}$$

So the markup is increasing in the diameter of the circle ($$\frac{\partial p}{\partial d} \gt 0$$) and the travel cost ($$\frac{\partial p}{\partial } \gt 0$$), and decreasing in the number of firms ($$n \to \infty$$, $$p \to c$$).

The fact that firm $$i$$ faces 2 (or $$k$$, I suppose) symmetric marginal customers doesn't affect the equilibrium prices $$p_i^*$$, only equilibrium profits $$\pi_i^*$$ (scaled by $$k$$).