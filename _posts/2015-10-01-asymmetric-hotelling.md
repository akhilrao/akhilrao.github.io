---
layout: post
title: Hotelling duopoly with different valuations and a merger
category: micro theory
tags: micro-theory duopoly asymmetric hotelling linear city 
year: 2015
month: 10
day: 01
published: true
summary: Two firms are at opposite ends of a line in a Hotelling model, and customers value their products differently. A merger occurs.
---

Consider a Hotelling duopoly on opposite ends of a linear city of length 1. [We know](http://akhilrao.github.io/micro%20theory/2015/09/28/hotelling-triangle-city/) that if the firms and products are symmetric, the indifferent consumer is at the midpoint and the price is greater than marginal cost by the travel cost ($$\tilde{x}=\frac{1}{2}, p=t+c$$). Suppose the firms are symmetric with constant marginal cost $$c$$, but consumers value their products at $$v_1$$ and $$v_2$$, respectively. Assume that $$v_1$$ and $$v_2$$ are high enough that the market will be covered, and that the firms choose prices simultaneously. As before, we first find the indifferent consumer's demand and then plug it into the firms' profit-maximization problems.

The indifferent consumer's demand:

$$ \begin{align}
& v_1 - p_1 - t\tilde{x} = v_2 - p_2 - t(1-\tilde{x}) \cr
\cr
\implies & \tilde{x} = \frac{(v_1-v_2)-(p_1-p_2)}{2t} + \frac{1}{2} \cr
\end{align} $$

The firms' first-order conditions and optimal prices:

$$ \begin{align}
\text{Firm 1:} & \ \ \frac{1}{2}[1 + \frac{(v_1-v_2)-(2p_1-p_2)-c}{t}] = 0 \cr
\text{Firm 2:} & \ \ \frac{1}{2}[1 + \frac{(v_1-v_2)-(p_1-2p_2)-c}{t}] = 0 \cr \cr
p_1 & = \frac{1}{2}[v_1-v_2+p_2^* + \frac{t}{2} + c] \cr
p_2 & = \frac{1}{2}[v_2-v_1+p_1^* + \frac{t}{2} + c] \cr
\end{align} $$

As we'd expect, each firm's optimal price is increasing in consumers' valuations of their own product, decreasing in consumers' valuations of their competitor's product, and increasing in their marginal cost. Interestingly, their own optimal prices are increasing in their competitor's price. I think the correct terms are "strategic substitutes" and "strategic complements", but I could be mistaken.

In Cournot models, if the other firm increases their quantity, you want to decrease yours - we see this from the Cournot best-response, $$ q_i^* = \frac{-(p(Q) - c)}{\frac{\partial p}{\partial Q}} $$ (which is $$q_i^* = \frac{a - bq_j^* - c}{2b} $$ when inverse demand is linear), where $$\frac{\partial q_i}{\partial q_j} \lt 0$$. The quantities are "strategic substitutes". This linkage is through the inverse demand function, where one firm increasing its quantity results in a lower price for all firms.

In Hotelling models the opposite is true regarding prices - they are "strategic complements", or $$\frac{\partial p_i}{\partial p_j} \gt 0$$. My intuition for this is that the other firm raising its price gives you room to raise yours; as long as we assume the market is covered, there is a single indifferent consumer choosing between the two firms who links their prices in this way. If the market isn't covered, I think you would have two indifferent consumers, one for each firm, each consumer indifferent between buying from the nearer firm or not buying at all. Then the firms' problems would be decoupled, and $$\frac{\partial p_i}{\partial p_j}$$ would be 0.

How much would a change in cost affect the price? We can see this by looking at $$\frac{\partial p_i}{\partial c}$$ for any $$i$$. This is called the "pass-through rate", or just the "pass-through". In a [future post](http://akhilrao.github.io/micro%20theory/2015/10/02/passthrough-symmetric-cournot/), I'll derive the pass-through rate for a Cournot oligopolist and relate it to the curvature of the inverse demand function. Here, the pass-through is easy: $$\frac{\partial p_i}{\partial c} = \frac{1}{2}$$.

### A Merger

What if the firms merged and became a monopolist selling two differentiated products? In this case, the firm can capture all of the consumer surplus. The indifferent consumer's demand becomes:

$$ \begin{align}
& v_1 - p_1 - t\tilde{x} = v_2 - p_2 - t(1-\tilde{x}) = 0 \cr \cr
\implies & \tilde{x} = \frac{v_1-p_1}{t}, \cr
 & \tilde{x} = \frac{-v_2+p_2}{t} + 1 \cr
\end{align} $$

We can use the two expressions we have for $$\tilde{x}$$ to get a function that relates $$p_1$$ to $$p_2$$. I'm going to go with $$p_2 = v_2 + v_1 - p_1 - t $$. Now we solve the firm's problem and get the prices:

$$ \begin{align}
& \max_{p_1} \ [p_1 - c] \ \tilde{x}(p_1) + [p_2(p_1) - c] \ \tilde{x}(p_1) \cr
\implies & p_1 = \frac{1}{2}[v_1 + v_2 - t - 2c] \cr
\implies & p_2 = \frac{1}{2}[v_1 + v_2 - t + 2c] \cr
\end{align} $$

$$p_1$$ and $$p_2$$ look a little weird to me; I don't understand why the cost enters them like that. The effect of a marginal cost increase will be exactly offset by the prices, so maybe it doesn't matter?

Whereas before the firms' prices were increasing in the travel cost, the new monopoly's prices are decreasing in travel cost. I think the monopoly is fully internalizing the effect of the travel cost, in that an increase in $$t$$ reduces the amount of consumer surplus that the firm can take when it s the marginal consumer's utility to 0.

As either valuation increases, both prices increase.

I like the addition of the firms merging. I'd like to look at some more models with that.

Variations to explore:

* A merger between two firms in Triangle City

* A model of Circle City with $$n$$ firms

* A merger between two firms in an $$n$$-firm Circle City

* A Hotelling model on a not-fully-connected graph? Consumers and firms would be at the nodes, with the cost of reaching a firm increasing in the number of nodes between a consumer and the firm. I think it would be a lot harder to solve than a Hotelling model on a continuous space, but the linkages in price through demand would be interesting. Maybe a continuous city on a polygon with lines between vertices is an easier way to look at those linkages.