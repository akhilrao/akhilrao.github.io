---
layout: post
title: When a manager can reduce fixed costs in exchange for profits
category: micro theory
tags: micro-theory monopoly fixed cost manager profit-sharing incentives
year: 2015
month: 9
day: 30
published: true
summary: A model I thought sounded fun.
---

In most consumer-firm problems, we assume the consumer owns the firm, but doesn't manage it. Who does? It's not quite clear. I like to imagine that the firm is a robot that the consumer programmed to produce stuff and *whirr* MAXIMIZE PROFITS *whirr*. This model came from thinking about scenarios where a profit-maximizing owner who is perfectly capable of maximizing profits might want to hire a manager in exchange for a share of profits. Why would they do this? When would there be agency problems?

### The setting

The underlying problem is a profit-maximizing monopolist facing linear inverse demand $$p=a-bx$$ and some positive fixed cost $$F$$. That is,

$$\max_{x}  (p - c)x - F $$

I'm framing it as a Cournot problem, but we could do it as a Bertrand problem and we'd get the same result because there's only one firm. The fixed cost goes away and we get the familiar $$x^*=\frac{a-c}{2b}$$ and $$p^*=\frac{a+c}{2}$$.

The twist is that the fixed cost is $$F(k) = d - k$$, where $$d$$ is some positive number and $$k\in[0,1]$$ is the share of profits the owner will give to a manager who can reduce the fixed costs. (The point wasn't to be super realistic, I just wanted something simple and decreasing in $$k$$.)

The new problems are

$$ \begin{align}
\text{Manager:}& \ \max_{x}  k[(p(x) - c)x - F] \cr
\text{Owner:} & \  \max_{k} k[(p^* - c)x^* - F(k)] \cr
 & s.t. \ k \ge 0 , 1-k \ge 0
\end{align} $$

The owner first decides how much to pay the manager. The more the owner pays the manager, the lower the fixed costs (I was going for "more pay => better manager"). Once this is decided, the manager steps in to maximize profits. I assume that reducing the fixed costs comes naturally to the manager  - it is costless to them - so $$F$$ will drop out of the manager's first-order conditions just like it does for a regular problem with fixed costs.

### The solution

The manager's problem is a standard Cournot monopolist's problem. The profit-share, $$k$$, is irrelevant to the optimal quantity choice because it enters the manager's problem as a constant scaling the profits.

$$ \begin{align}
\text{Manager's FOC:} \ & k[p(x) + x\frac{\partial p}{\partial x} - c] = 0 \cr
\implies & x^* = \frac{a-c}{2b}, \cr
& p^* = \frac{a+c}{2}
\end{align} $$

The owner's problem is a little trickier because of the restrictions on $$k$$. We need to set up the following Lagrangian:

$$ L = (1-k)[(p^* - c)x^* - d + k] + \lambda_1(k) + \lambda_2(1-k)$$

Which yields the following saddle-point conditions:

$$ \begin{align}
\mathsf{k:} & \ -[(p^* - c)x^* - d + 2k] + \lambda_1 - \lambda_2 = 0 \cr
\mathsf{\lambda_1 :} & \ \lambda_1(k) = 0 \cr
\mathsf{\lambda_2 :} & \ \lambda_2(1-k) = 0 \cr
\end{align} $$

This gives us 3 cases which fully characterize the parameter space.

##### Case 1: k = 0

If we assume $$k=0$$, we get the following saddle point:

$$ (k,\lambda_1,\lambda_2) = (0,\frac{(a-c)^2}{4b} - d,0) $$

The owner gives the manager nothing. The lagrange multipliers have to be non-negative, which gives us the parameter restriction: $$ d \le \frac{(a-c)^2}{4b} $$.

##### Case 2: k $$\in$$ (0,1)

If we assume $$k \in (0,1)$$, we get the following saddle point:

$$ (k,\lambda_1,\lambda_2) = (\frac{1}{2}(d - \frac{(a-c)^2}{4b}),0,0) $$

The owner gives the manager some positive share and the lagrange multipliers are 0. $$k \gt 0$$ gives us the following parameter restriction: $$ d \gt \frac{(a-c)^2}{4b} $$.

##### Case 3: k = 1

If we assume $$k=1$$, we get the following saddle point:

$$ (k,\lambda_1,\lambda_2) = (0,0,d - \frac{(a-c)^2 + 8b}{4b}) $$

The owner gives the manager full control of the company. $$\lambda_2 \ge 0$$ gives us the following parameter restriction: $$ d \ge \frac{(a-c)^2 + 8b}{4b} $$.


### Summary

The owner and manager both will implement monopoly pricing - there's only one firm, so this is optimal. If the fixed cost without a manager is greater than the monopoly profit, then the owner will hire the manager to reduce the fixed cost. The owner will pay the manager half the difference between the original fixed cost and the monopoly profit - this is the owner's profit-maximizing wage for the manager. If the fixed cost is high enough, the owner will give the manager the company because the business isn't worth it.

Given the relationship between the wage paid to the manager and the fixed cost in this model, we can think of $$k$$ not only as the profit-maximizing wage paid to the manager, but also as the optimal level of managerial ability that the owner will choose when it costs profit share.

What could this be a model of? I don't know. There's a manager who can make it worthwhile to get into a market where you'll be a monopolist if you can cross the high fixed cost to entry. Maybe a manager who has connections or knowledge that would reduce the fixed costs?

I think the agency problem involved in non-owners running a firm (so any professional management) is interesting. Eventually, I'd like to construct a model where rational actors cause an agency problem. In this model, the manager does their job (picking the profit-maximizing business decision) perfectly. There is no agency problem because the manager is paid a fraction of profits, so the manager's wage-maximizing outcome is aligned with the owner's profit-maximizing desires. The manager is a price-taker in the sense that they simply take the share they are offered as given. This is reasonable if the market for managers is perfectly competitive.

####Variations to explore:

* What if the manager was paid a share of sales or revenue instead of profits? I'd expect agency problems to be possible here, since the objective functions don't necessarily align.

* What if the manager could reduce marginal costs instead of fixed costs? I think of this as a manager who brings persistent efficiencies, whereas this one brings one-time efficiencies. I'd expect qualitatively similar results to this model.

* What if the firm was taxed (increasing in output) and the manager could reduce the tax? Again I'd expect qualitatively similar results to this model, but it seems like a more plausible model for hiring managers with government connections.

* O.E. Williamson, in his paper "A Model of Rational Managerial Behavior", describes a pretty cool model with staffing and reported profits. I may blog about it at some point.