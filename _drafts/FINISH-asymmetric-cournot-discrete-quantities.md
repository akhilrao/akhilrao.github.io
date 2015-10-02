---
layout: post
title: Asymmetric Cournot with discrete quantities
category: micro theory
tags: micro-theory duopoly asymmetric cournot discrete quantity
year: 2015
month: 10
day: 01
published: true
summary: Two firms with different marginal costs in Cournot competition naming integer quantities.
---

In standard Cournot models, firms are symmetric and choose continuous quantities (\\(q_i \in \mathbb{R_+}\\)). Here we consider a model of Cournot duopoly with asymmetric firms limited to discrete quantities (\\(q_i \in \mathbb{Z_+}\\)). Because the set we are optimizing over is no longer continuous, we can't use the Kuhn-Tucker approach used in Cournot models with continuous quantities. Instead, we set up the problem as a game in [normal form](https://en.wikipedia.org/wiki/Normal-form_game) and find the pure- and mixed-strategy Nash equilibria by using [iterated elimination of dominated strategies](https://en.wikipedia.org/wiki/Strategic_dominance).

### The setting

Let firm 1 have marginal cost \\(c_1 = 4\\) and firm 2 have marginal cost \\(c_2 = 5\\). Let the inverse demand function be given by 
$$ \begin{align}
P(Q)=\begin{cases} 10 - Q \ \ & if \ \ Q \le 10 \cr 
0 \ \ & if \ \ Q \gt 10 \end{cases} 
\end{align} $$

and \\( Q = q_1 + q_2\\).

To start, we can eliminate any quantities greater than the firm's monopoly quantities. That's what the firm would do if it wasn't constrained by its competitor, so it can't be profit-maximizing to play anything above those quantities. To find the monopoly quantities, we can take the standard Cournot duopoly best-response function, \\(q_i^\* = \frac{a - bq_j^\* - c_i}{2b}\\), and plug in \\( q_j^\* = 0\\). This gives us that firm 1's monopoly quantity is 3, and firm 2's is 2.5. We can eliminate any quantity choice greater than 3 for both firms, since they are strictly dominated.

How do we handle 2.5? Firm 2 has to choose 2 or 3, not 2.5. We can see that \\(\pi_2(q_1=0,q_2=3) = 6\\) and \\(\pi_2(q_1=0,q_2=2) = 6 \\), so we can't eliminate 3 from firm 2's choices by strict domination.

MATRIX GAME