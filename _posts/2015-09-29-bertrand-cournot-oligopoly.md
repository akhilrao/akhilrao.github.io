---
layout: post
title: Oligopoly - Bertrand and Cournot
category: micro theory
tags: micro-theory oligopoly bertrand cournot
year: 2015
month: 9
day: 29
published: true
summary: A comparison of Bertrand and Cournot models of oligopoly.
---

Models of perfect competition are kinda dull. Firms price at marginal cost, no firm makes any profits, and there's just not a whole lot to be said there. Imperfect competition is much more interesting. There can be markups, firms can do cool things . In this post, we're going to look at some simple models of oligopoly (imperfect competition where there are a few firms). I'm going to start with 2 firms, then n firms, and then a couple variations.

There are two popular models of oligopoly: [Cournot](https://en.wikipedia.org/wiki/Cournot_competition) (firms choose quantities) and [Bertrand](https://en.wikipedia.org/wiki/Bertrand_competition) (firms choose prices). Although the firms' objective functions are the same (to maximize profits), the two models produce very different outcomes and require different solution techniques.

Cournot models give us a degree of competition, becoming perfectly competitive as the number of firms goes to \\(\infty\\), and can usually be solved with standard optimization techniques. Bertrand models become perfectly competitive when there is more than one firm involved (!! 2 firms is perfectly competitive??!), and because of discontinuities induced by assumptions on demand, cannot usually be solved by standard optimization techniques. We'll use game theory to solve both.

Although both of these models pre-date Nash's solution concept, their equilibria are still Nash equilibria (NE or NEs - in equilibrium, no one can increase their payoff by unilaterally deviating from the equilibrium strategy profile). This is interesting to me because I learned to solve Bertrand models by looking for NEs. I think it would be harder to see this solution without that equilibrium concept specifically in mind, but maybe not.

### Cournot competition 

Cournot models are nice because we can use a pretty simple optimization program - set up profit, take first order conditions, solve for best-response (BR) functions, and get quantity. The firm's profit maximization problem is usually unconstrained\\(^1\\), which makes it even nicer.

In a Cournot model, each firm chooses a quantity to produce and then they play that quantity at the same time. Because they move simultaneously, they have to guess what the other will do. This gives us their best-response functions. Best-response functions are what they sound like: functions which tell you your best response to your opponent's move ("If he does this, I should do that"). They are sometimes correspondences instead of functions. We find the optimal quantity by plugging one firm's best-response into the other's. The resulting intersection gives us the quantities that the firms will play in equilibrium.

#### 2 symmetric firms

Let the inverse demand function be linear as \\(P = a - bQ\\), where \\(Q = q_i + q_j\\), and the common constant marginal cost is \\(c\\). \\(a\\), \\(b\\), and \\(c\\) are all strictly greater than 0 and \\(a>c\\). Firm \\(i\\) solves:

$$ \max_{q_i}  (p - c)q_i $$

The FOC is:

$$ a - 2bq_i - bq_j^\* - c = 0 $$

Firm \\(i\\)'s best-response function is:

$$ q_i^\* = \frac{a - bq_j^\* - c}{2b} $$

Since the firms are symmetric, \\(q_i = q_j\\), giving us firm i's equilibrium quantity:

$$ q_i = \frac{a - c}{3b} $$

Again by symmetry of the firms, we don't need to solve firm \\(j\\)'s problem: it's identical to firm \\(i\\)'s.

The equilibrium is: \\( (P, q_i, q_j, \pi_i, \pi_j) = (a-\frac{2}{3}(a-c), \frac{a - c}{3b}, \frac{a - c}{3b}, \frac{(a-c)^2}{9} , \frac{(a-c)^2}{9})  \\)

#### \\(n\\) symmetric firms

The conditions and results are similar for \\(n\\) symmetric firms. Inverse demand is now \\(P = a - b\sum_{i=1}^n q_i\\). Firm \\(i\\) solves:

$$ \begin{align}
& \max_{q_i}  (p - c)q_i \cr
\text{FOC:} &  a - 2bq_i - b\sum_{j \neq i}^n q_j^\* - c = 0 \cr
\text{BR:} &  q_i^\* = \frac{a - (n-1)bq_j - c}{2b} \cr
\implies & q_i = \frac{a-c}{(n+1)b}, \cr
 & P = \frac{a}{n+1} + \frac{n}{n+1}c, \cr
 & \pi = \frac{(a-c)^2}{(n+1)^2} \cr
\end{align} $$

We can see that the 2 firm example was a special case of the \\(n\\) firm example. As \\(n \to \infty\\), \\(P \to c\\) and \\(\pi \to 0\\). When \\(n = 1\\), we get the monopoly outcome, \\(q = \frac{a-c}{2b}\\), \\( P = \frac{a + c}{2}\\), and \\(\pi = \frac{(a-c)^2}{4}\\).

### Bertrand competition 

In Bertrand models, we assume that the firm with the lower price captures all of the market and that firms split the market evenly when they charge the same price. This creates a discontinuity in profits as a function of price, which means we can't apply a regular optimization program. 

Instead, we have to consider the optimal price in cases, looking for NEs. This means asking the question: assuming the strategy profile we're considering is an equilibrium, can any player improve their payoff by unilaterally deviating? If yes, then that strategy profile isn't a Nash equilibrium.

#### 2 symmetric firms

Suppose prices are \\(p_i = p_j > c\\). Firm \\(j\\) can deviate to a \\(p_j \in (c,p_i)\\) \\(\forall p_i > c \\) and capture all of the demand and increase profits. So \\(p_i > c\\) can't be an equilibrium.

We can rule out any case where \\(p_i < c \\) \\(\forall i \\), since the firm would then make negative profits and could improve its payoff by deviating to \\(p_i = c \\) to make 0 profits.

So we're left with \\(p_i = c\\). If both firms charge \\(c\\), neither can improve their payoff by deviating unilaterally. So the equilibrium is that they charge marginal cost and make 0 profits. Deviating can only lead to losses or vicious price competition.

#### \\(n\\) symmetric firms

The same argument from the 2 firm case holds for 2 of the \\(n\\) firms. As a result, all of the other \\(n-2\\) firms are indifferent between charging \\(p_i = c\\) and \\(p_i > c\\). They either split the demand evenly at 0 margin (0 profits), or have a margin and no demand (0 profits).

### A couple variations

Now that we know the standard results, let's look at some variations on the 2-firm models: Cournot competition with asymmetric firms, and Bertrand competition with integer pricing.


#### Cournot competition: 2 firms with different marginal costs

Same as the earlier 2-firm setup, except now \\(c_i > c_j\\).


$$ \begin{align}
BR_i : & q_i^\* = \frac{a - bq_{j}^\* - c_i}{2b} \cr
BR_j : & q_j^\* = \frac{a - bq_{i}^\* - c_j}{2b} \cr
\implies & q_i = \frac{a- 2c_i + c_j}{3b} \cr
 & q_j = \frac{a- 2c_j + c_i}{3b} \cr
\implies & q_i < q_j \cr
\end{align} $$

If \\(c_i = c_j\\), we would be back in the symmetric 2 firm case. Without calculating the profits, we can argue by revealed preference that \\( \pi_i < \pi_j\\). The argument is straightforward: firm \\(j\\) could have chosen \\(q_i\\), but didn't. Since firms are profit-maximizers, this means \\(j\\) must make higher profits selling the higher quantity.

Another neat thing we can do here is look at the derivatives of the equilibrium quantities with respect to costs and quantities. This tells us how each firm's optimal quantity will change with respect to their own and their competitor's marginal costs. We get:

$$\begin{align}
\frac{\partial q_i}{\partial c_i} & = -\frac{2}{3b} < 0 \cr
\frac{\partial q_i}{\partial c_j} & = \frac{1}{3b} > 0
\end{align}$$

Firms will produce less as their own costs increase, and more as their competitor's costs increase. Seems intuitive.
 

#### Bertrand competition: 2 symmetric firms with integer pricing

The setup is the same as the earlier 2 firm case, except now firms can only charge prices that are integers.

As before, we can rule out any prices below marginal cost, since 0 profits are better than negative profits.

If both firms price at marginal cost, neither firm can deviate an increase their payoff. So \\(p_i = p_j = c)\\ is one Nash equilibrium.

Is there an equilibrium with positive profits? Let \\(d>c\\) be the smallest integer greater than \\(c\\). Suppose both firms price at \\(d\\). Then deviating downward to \\(c\\) would yield 0 profits (all demand, no margin), as would deviating upward (some margin, no demand). So there is another Nash equilibrium at \\(p_i=p_j=d\\).

We could simplify that argument by saying \\(d=c+1\\), which it is in this case. Doing it this way, we can see that this equilibrium exists whenever prices are discrete. Say prices are discretized into intervals of \\(\delta\\), replace "smallest integer greater than \\(c\\)" with "smallest discrete price greater than \\(c\\)", and the result follows.

### In conclusion

Cournot models may seem less realistic in most settings at face value because it's more natural (for me at least) to assume firms choose prices rather than quantities. But the results are more plausible: with only a few firms, each firm has some market power and uses it to get profits. As the number of firms increases, each firm's market power decreases and in the limit we get perfect competition.

Bertrand models, though they accord with my initial ideas of how firms compete, produce less realistic results: only 2 firms is enough to create a perfectly competitive outcome (prices at marginal cost, zero profits). Competition is brutal in Bertrand models: firms force each other to the lowest price possible, only making profits (in the examples we considered) when the space of prices has discontinuities that prevent continuous undercutting.

I find Cournot models easier to think about and solve, since it's pretty much algorithmic. Bertrand models require a little more thought, but can often be condensed into pretty compact and elegant arguments.


####Variations to explore:

* Bertrand competition with asymmetric firms

* Cournot competition with capacity constraints

* Stackelberg (sequential Cournot) competition

* Cournot competition with fixed costs




\\(^1\\)There's an interesting problem I'll do in a future post with a cash-constrained revenue-maximizing firm. The firm's problem ends up having the same setup as a utility-maximizing budget constrained consumer, which is pretty neat.