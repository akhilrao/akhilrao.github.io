---
layout: post
title: Deriving pass-through for an N-firm Cournot oligopoly
category: micro theory
tags: micro-theory oligopoly cournot passthrough 
year: 2015
month: 10
day: 02
published: true
summary: A derivation of the pass-through rate for an N-firm Cournot Oligopoly.
---

In the [previous post](http://akhilrao.github.io/micro%20theory/2015/10/01/asymmetric-hotelling/), I mentioned the concept of pass-through. Pass-through is the partial derivative of price with respect to marginal cost; it tells us how the equilibrium price will change in response to a change in marginal cost. As we will see here, it is closely related to the curvature of the inverse demand function.

Consider a homogeneous product market with $$N \ge 2$$ firms which are Cournot competitors with the same constant marginal cost $$ c$$. The inverse demand function is $$P(Q)$$, and it satisfies $$2P'(Q) + QP''(Q) \lt 0$$. The first order condition for firm $$i$$ when every firm produces positive output is given by $$ P(Q) + q_{i}P'(Q) - c = 0 $$. Because the firms are symmetric, $$q_i = \frac{Q}{N}$$, making firm $$i$$'s first order condition $$P(Q) + \frac{Q}{N}P'(Q) - c = 0$$. Call this FOC as $$F$$.

Define $$ \sigma(Q) = -\frac{QP''(Q)}{P'(Q)} $$, the curvature of the inverse demand function.

By the [implicit function theorem](https://en.wikipedia.org/wiki/Implicit_function_theorem), we can find $$\frac{\partial Q}{\partial c}$$, the quantity pass-through, as

$$ \begin{align}
 \frac{\partial Q}{\partial c} & = - \frac{\frac{\partial F}{\partial c}}{\frac{\partial F}{\partial Q}} \cr
 & = \frac{N}{(N+1)P'(Q) + QP''(Q)} \cr
\end{align} $$


Then, by the chain rule,

$$ \begin{align}
\frac{\partial P(Q)}{\partial c} & = \frac{\partial P}{\partial Q}\frac{\partial Q}{\partial c} \cr
\implies \frac{\partial P(Q)}{\partial c} & = \frac{\partial P}{\partial Q} \frac{N}{(N+1)P'(Q) + QP''(Q)} \cr
\end{align} $$

Dividing by $$\frac{\partial P}{\partial Q}$$ on top and bottom, we get

$$ \begin{align} 
\frac{\partial P}{\partial c} & =  \frac{N}{(N+1) + Q\frac{P''(Q)}{P'(Q)}} \cr
& = \frac{N}{(N+1) - \sigma(Q)} \cr
\end{align} $$

Thus, we see that the pass-through rate is indeed a function of the curvature of the inverse demand function. If we assume inverse demand is linear, we get

$$P'(c) = \frac{N}{N+1}$$

As $$ N \to \infty$$, $$P'(c) \to 1$$. This makes sense, given that we know as $$ N \to \infty$$, $$P \to c$$.

Pass-through is a pretty useful concept, and it seems to be a popular tool these days in analyses of oligopoly and market power.