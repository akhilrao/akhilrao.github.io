---
layout: post
title: Triangle City - A Hotelling Model
category: micro theory
tags: micro-theory hotelling differentiation
year: 2015
month: 9
day: 28
published: true
summary: A Hotelling model with fixed firms on the ends of a line. An extension to a triangle.
---

[Hotelling models](https://en.wikipedia.org/wiki/Location_model) are a nice way to think about questions about differentiated products and monopolistic pricing. The idea is that firms are located a certain distance apart, and that consumers face a travel cost. The products themselves are homogeneous but the cost of distance "differentiates" them. One version of the model, with fixed firm locations, is as follows:


### Linear City

Suppose you have a city that's on a line normalized to length 1. A mass of consumers (also normalized to 1) is uniformly distributed along this line. There is a firm located at each end of the line (assume 2 for now, you could have \\(n)\\). Consumers value the firms' homogeneous products at \\(v\\). Let \\(p_i\\) be the price of the \\(i\\)th firm's product and \\(c\\) be the common constant marginal cost. Assume that each consumer will necessarily buy 1 unit of the good, and that consumers face a linear travel cost to the firm.

[![](/public/images/hotelling/linear_city.svg "Linear City")](/public/images/hotelling/linear_city.svg "Linear City")

We can analyze this problem by considering the indifferent consumer, call her \\(\tilde{x}\\). Let her be a distance of \\(t\\) away from one firm and \\(1-t\\) away from the other. The indifferent consumer's decision looks like this:

$$ v - p - t\tilde{x} = v - p -(1-t)\tilde{x}$$

That is, the indifferent consumer is the one whose utility from buying from firm 1 is equal to her utility from buying from firm 2. From this expression, we get that

$$ \tilde{x} = \frac{1}{2} + \frac{p_2 - p_1}{2t} $$

Cool, now we can go to the firms' problems and see how they deal with this. Since the firms are symmetric, we only need to consider one firm. Let's consider firm 1. The firm wants to maximize its profits (\\(\pi_{i}\\)), i.e.


$$ \max_{p_1} (p_1 - c)\tilde{x} $$


which gives us the following first-order condition:


\begin{align} 
 \frac{1}{2} + \frac{p_2^\*}{2t} - \frac{2p_1}{2t} + \frac{c}{2t} & = 0 \cr
 \implies t + p_2^\* - p_1 & = p_1 - c 
\end{align}


The "\*" in "\\( p_2^\* \\)" is to indicate that firm 1 is taking firm 2's pricing decision as given. Because the firms are symmetric, \\(p_2 = p_1\\), which gives us:


$$ p_1 = t + c $$


This is a nice expression. When we plug things back into \\(\tilde{x}\\), we get that the indifferent consumer is located at exactly \\( \frac{1}{2} \\) on our linear city of length 1, which is intuitive in the case of symmetric firms. When we plug things into the firm's profits, we get that \\( \pi_1 = \pi_2 = \frac{t}{2} \\\).


So the more the firm differentiates, the more profits it makes. The degree of differentiation lets it add some markup to its marginal cost when pricing. Although it's hard to see here, as the number of firms goes to \\( \infty \\), the markup goes to 0 and the price goes to marginal cost, just as we'd expect in the perfectly competitive case.


Now that we have some background, let's consider a slightly more complicated version of this model: Triangle City.


### Triangle City

Everything is the same as before, except that there are 3 firms and they are located at the vertices of an equilateral triangle:

[![Figure 2](/public/images/hotelling/triangle_city.svg "Triangle City")](/public/images/hotelling/triangle_city.svg "Triangle City")


Let's normalize the sides to length 1. The firms are symmetric with respect to costs, and the consumers are distributed uniformly along the edges of the triangle. Once again, we look at the indifferent consumer, \\(\tilde{x}\\). Without loss of generality, let's consider the indifferent consumer between firm 1 and firm 2. As before, we have


$$ \begin{align} 
v - p - t\tilde{x} & = v - p -(1-t)\tilde{x} \cr
\implies \tilde{x} & = \frac{1}{2} + \frac{p_2 - p_1}{2t}
\end{align} $$


Under what condition(s) will the consumers only shop at their local store? The utility from shopping at a local store must be strictly greater than the utility from going to the far store, i.e.

$$ U(firm 1) = U(firm 2) > U(firm 3) $$ or
$$ v - p_1 - t\tilde{x} > v - p_3 - (1+\tilde{x})t $$


Ok, cool. So how do we solve this? Since the firms are symmetric and the competition between two firms on any edge implies that the shop-local condition holds, we can make our lives easier and consider only a single edge of the triangle (any edge) to get the prices and profits. But then we are back in linear city along each edge. So triangle city has the same solution as linear city!

The equilibrium is: \\( (p_1,p_2,p_3,\pi_1,\pi_2,\pi_2) = (t+c,t+c,t+c,\frac{t}{2},\frac{t}{2},\frac{t}{2}) \\)


Variations to explore: 

*  Triangle city case with asymmetric firms

*  Triangle city case with different side lengths

*  Circle city case with \\(n\\) symmetric firms

*  Polygon city case with \\(n\\) symmetric firms