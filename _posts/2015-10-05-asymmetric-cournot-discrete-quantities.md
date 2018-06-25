---
layout: post
title: Asymmetric Cournot with discrete quantities
category: micro theory
tags: micro-theory duopoly asymmetric cournot discrete quantity
year: 2015
month: 10
day: 05
published: true
summary: Two firms with different marginal costs in Cournot competition naming integer quantities.
---

In standard Cournot models, firms are symmetric and choose continuous quantities ($$q_i \in \mathbb{R_+}$$). Here we consider a model of Cournot duopoly with asymmetric firms limited to discrete quantities ($$q_i \in \mathbb{Z_+}$$). Because the set we are optimizing over is no longer continuous, we can't use the Kuhn-Tucker approach used in Cournot models with continuous quantities. Instead, we set up the problem as a game in [normal form](https://en.wikipedia.org/wiki/Normal-form_game) and find the pure- and mixed-strategy Nash equilibria by using [iterated elimination of dominated strategies](https://en.wikipedia.org/wiki/Strategic_dominance).

### The setting

Let firm 1 have marginal cost $$c_1 = 4$$ and firm 2 have marginal cost $$c_2 = 5$$. Let the inverse demand function be given by 
$$ \begin{align}
P(Q)=\begin{cases} 10 - Q \ \ & if \ \ Q \le 10 \cr 
0 \ \ & if \ \ Q \gt 10 \end{cases} 
\end{align} $$

and $$ Q = q_1 + q_2$$.

To start, we can eliminate any quantities greater than the firm's monopoly quantities. That's what the firm would do if it wasn't constrained by its competitor, so it can't be profit-maximizing to play anything above those quantities. To find the monopoly quantities, we can take the standard Cournot duopoly best-response function, $$q_i^* = \frac{a - bq_j^* - c_i}{2b}$$, and plug in $$ q_j^* = 0$$. This gives us that firm 1's monopoly quantity is 3, and firm 2's is 2.5. We can eliminate any quantity choice greater than 3 for both firms, since they are strictly dominated.

How do we handle 2.5? Firm 2 has to choose 2 or 3, not 2.5. We can see that $$\pi_2(q_1=0,q_2=3) = 6$$ and $$\pi_2(q_1=0,q_2=2) = 6 $$, so we can't eliminate 3 from firm 2's choices by strict domination.

The game matrix below shows the firms' profits. Firm 1 is on the columns, and firm 2 is on the rows. The entries are "$$\pi_1, \pi_2$$".

$$\begin{array}{c|lcr}
 & 0 & 1 & 2 & 3 \cr
\hline
0 & 0,0 & 5,0 & 8,0 & 9,0 \cr
1 & 0,4 & 4,3 & 6,2 & 6,1 \cr
2 & 0,6 & 3,4 & 4,2 & 3,0 \cr
3 & 0,6 & 2,3 & 2,0 & 0,-3
\end{array}$$

Iterated elimination:

* Firm 1: 1 strictly dominates 0 $$\implies$$ remove 0-column
* Firm 2: 2 strictly dominates 3 $$\implies$$ remove 3-row
* Firm 1: 2 strictly dominates 1 $$\implies$$ remove 1-column
* Firm 2: 1 strictly dominates 0 $$\implies$$ remove 0-row

This leaves us with the following 2x2 game matrix:

$$\begin{array}{c|lr}
 & 2 & 3 \cr
\hline
1 & 6,2 & 6,1 \cr
2 & 4,2 & 3,0 \cr
\end{array}$$

There are 3 pure-strategy Nash equilibria, $$(q_1,q_2,\pi_1,\pi_2)$$:

1. $$(2,1,6,2)$$
2. $$(2,2,4,2)$$
3. $$(3,1,6,1)$$

Letting $$p_1 = Pr(q_2=1)$$, $$p_2 = Pr(q_2=2)$$, $$k_2=Pr(q_1=2)$$, $$k_3=Pr(q_1=3)$$, we can get their expected utilities:

$$\begin{align}
EU_{1}(2) & = p_1(6) + p_2(4) = 6p_1 + 4p_2 \cr
EU_{1}(3) & = p_1(6) + p_2(3) = 6p_1 + 3p_2 \cr
EU_{2}(1) & = k_2(2) + k_3(1) = 2k_2 + k_3 \cr
EU_{2}(2) & = k_2(2) + k_3(0) = 2k_2 \cr
\end{align}$$

By applying expected-utility indifference, we can construct a mixed NE.

$$\begin{align}
EU_1(2) & = EU_1(3) \cr
EU_2(1) & = EU_2(2) \cr
\implies p_2&=0,p_1=1 \cr
 k_3&=0,k_2=1 \cr 
\end{align}$$

This is odd: The mixed NE that's coming out is a degenerate one, pure NE #1. I think I remember something to the effect that the total number of pure + mixed NE in a matrix game is supposed to be odd, so this might imply that there are actually no mixed NE? I was told that this game actually has infinitely many mixed NE, but I don't see it.