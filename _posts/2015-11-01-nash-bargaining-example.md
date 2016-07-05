---
layout: post
title: The Nash Bargaining Solution with 2 players
category: micro theory
tags: micro-theory axiomatic nash bargaining solution cooperative game theory
year: 2015
month: 11
day: 01
published: true
summary: A brief discussion of the Nash Bargaining Solution for two players with an example.
---

The [Nash Bargaining Solution](https://en.wikipedia.org/wiki/Bargaining_problem#Nash_bargaining_solution) is an important solution concept in game theory. It describes a two-player cooperative bargaining situation where the players are trying to maximize a joint surplus. It has been generalized to $$n$$ players, but I've been told that the NBS is really unwieldy in that setting and that the Shapley value is used instead.

The NBS represents a particular example of an axiomatic bargaining system. These are solution concepts where the solution is characterized by defining the axioms it must satisfy. Such solution concepts are used in cooperative game theory, where players are trying to maximize some total pie conditional on some "disagreement outcome" if they fail to reach an agreement.

The division of the joint surplus should satisfy some individual rationality and collective rationality (pareto efficiency) constraints. This can still leave us with a whole set of equilibria all along the efficient frontier. So we impose some axioms on the solution based on how we think the cooperation should be, and that usually gives us a unique equilibrium. Axiomatic bargaining is sometimes called "equilibrium selection" because we choose the equilibrium by choosing the axioms.

A two-player bargaining problem is characterized by a pair $$ (F,v) $$, where $$F$$ is a closed and convex "feasible set" and $$v \in F$$ is a vector of disagreement outcomes. The set $$ F \cap \{ (x_1 , x_2) : x_1 \gt v_1, x_2 \gt v_2  \} $$ should be bounded and non-empty. This is the set of feasible outcomes that is strictly better than the outcome if they can't agree, $$ (v_1, v_2) $$.

## Axioms and Motivation

The NBS for two players is a mapping $$ \phi : F \to R^2 $$ which satisfies the following four axioms:

1. Symmetry (SYM): For every $$ (F,v) $$, if $$ (F,v) $$ is symmetric, then $$ \phi_1 (F,v) = \phi_2 (F,v)$$ (both players receive the same outcome). 

2. Weak Pareto Optimality (WPO): For every $$ (F,v) $$ we should have $$ \phi (F,v) \in W(T) $$, where for $$ T \subset R^2 $$, $$ W(T) := \{ x \in T: \not\exists \ y \in T \ \text{s.t.} \ y \gt x \} $$.

3. Scale Transformation Covariance (STC): For every $$ (F,v) $$ and all $$a,b \in R^2 $$ with $$a \gt 0 $$ and $$ (aF + b, av + b) \in F $$, we have $$ \phi(aF + b, av + b) = a \phi(F,v) + b $$.

4. Independence of Irrelevant Alternatives (IIA): $$\forall \ (F,v),(G,w) $$ with $$ v=w $$, $$ G \subset F $$, and $$ \phi(G,w) \in F $$, we have $$ \phi (F,v) = \phi (G,w) $$.

The motivations for these axioms are:

SYM: If there is no information that lets us distinguish between the players in a bargaining game's description, then that game's solution should also not distinguish between the players.

WPO: $$W(T) $$ is referred to as the "weakly Pareto optimal subset of $$T$$", where $$T$$ is any subset of $$ R^2$$. The idea of this axiom is that the players should not be able to improve upon the solution outcome without making the other player worse off. This axiom lets us use standard optimization techniques to find the NBS.

STC: Utility functions are uniquely determined only up to a positive affine transformation. The idea of this axiom is that our solution should not depend upon the particular representation we've chosen in this sense. I think this (unique up to affine transformation) is true of any utility function, ordinal or cardinal, but I know it's true of von Neumann-Morgenstern utilities, which is the utility concept we're using here. STC tells us that the NBS is a linear mapping.

IIA: IIA is apparently Nash's most-criticized axiom, as well as one of the most important for this solution concept. It says that letting the feasible set shrink while the solution outcome remains feasible souldn't change the solution. In plainer terms: if you prefer chocolate over vanilla, and vanilla over strawberry, and you were considering between chocolate and vanilla, allowing you to choose strawberry shouldn't change the outcome (you'll still choose chocolate).

## Computing the solution

With these four axioms, we can now define the NBS as a function we can maximize. For every $$ (F,v)$$, the symmetric NBS is obtained by solving

$$ \max_{x_1,x_2 \in F} \ (x_1 - v_1)(x_2 - v_2) $$

The NBS maximizes each player's gain over the disagreement outcome, $$ (v_1,v_2) $$. The term $$ (x_1 - v_1)(x_2 - v_2) $$ is referred to as the symmetric Nash product.

Basically, we're maximizing a Cobb-Douglas function of the players' gains over the disagreement outcome. In the symmetric case, we have that the Cobb-Douglas exponents are both equal to $$ 1/2$$ and sum to $$1$$ (normalized). We can add some asymmetry by letting the exponents be $$ \beta \in (0,1) $$ and $$ 1- \beta $$. Then the NBS solves

$$ \max_{x_1,x_2 \in F} \ (x_1 - v_1)^{\beta}(x_2 - v_2)^{1-\beta} $$

The exponents can be interpreted as each player's bargaining power; the higher $$ \beta $$ is, the more player 1 will receive in equilibrium, and vice versa.

## An example

This is a somewhat contrived example, but suppose a buyer and a seller are bargaining over an investment $$I$$ the buyer can make. The buyer values the good at $$v$$, and it costs $$c$$ to produce (or you can think of $$c$$ as the seller's opportunity cost of selling the good).
 
The buyer will demand 1 unit of the good with probability $$ Pr(v \gt c) = x $$ and 0 units with probability $$ Pr(v=0) = 1-x $$. The buyer will buy as long as they value the good above marginal cost, and the seller will charge the buyer their full value for the good. The buyer and the seller are going to bargain over the surplus created by the transaction. So instead of a price coordinating buyer and seller's actions, we have them directly coordinating over how to share the surplus. 

Let's assume that investment is related to the buyer's likelihood of buying as $$ I = x^2 /2 $$. If they fail to reach an agreement, there will be no surplus created and they'll each get 0 payoff.

### Benchmark: Buyer gets all surplus

In the benchmark case, let's suppose that the buyer is going to get all of the surplus, and is solving the problem as a planner (internalizing the seller's cost of the good). The buyer solves

$$ \max_x \ x(v-c) - \frac{x^2}{2} $$

This gives us the optimal demand and investment as

$$ \begin{align}
x = & \ v - c \cr
I = & \ \frac{(v-c)^2}{2} \cr
\end{align} $$

The optimal demand, $$x$$, is actually the optimal probability of purchase. It's a little weird that we're having the buyer choose a probability, but in this case I think it's easier than expressing $$x$$ as a function of $$I$$ and solving for the optimal investment directly.

So the buyer takes all the surplus, and chooses to invest the amount that solves the above optimization problem. Not much intuition to see yet.

### Nash Bargaining: Buyer and Seller split surplus

Now suppose the buyer and seller split the surplus, and use Nash Bargaining to determine how much to invest. The buyer's share of the surplus is $$x_b$$ and the seller's is $$x_s$$. We do this as a two-stage problem: first the buyer and seller negotiate a split of the surplus, and then the buyer chooses a level of investment. Their symmetric bargaining outcome solves

$$ \begin{align} 
\max_{S_s, S_b } & ~ (S_b - 0)( S_s - 0) \cr
\text{s.t} & ~ S_b + S_s = v - c \cr
\implies \max_{S_b } & \ S_b (v-c- S_b ) \cr
\end{align} $$

We can reformulate the constrained optimization as an unconstrained optimization as above. This gives us the optimal split for the buyer and seller:

$$\begin{align}
 S_b &= \frac{v-c}{2} \cr
 S_s &= \frac{v-c}{2} \cr
\end{align}$$

So the buyer and seller split the surplus equally. We got this by solving an optimization problem, but we could have also gotten this by making an argument from the axioms. Another way to say this is that the NBS axioms are such that the above maximization will find the unique solution.

Now the second stage: how much investment will the buyer choose? The buyer is going to solve a similar problem as in the benchmark,

$$ \max_x \ x(\frac{v-c}{2}) - \frac{x^2}{2} $$

Giving us an optimal investment of

$$ I = \frac{(v-c)^2}{8} $$

This is lower than the benchmark level of investment, which makes sense - the buyer is getting half instead of all of the surplus from the transaction, so their incentive to invest is lower.

This example is very stylized, but I think it's a rough first pass at some deeper dynamic model of learning to use a technology and the demand for that technology. Maybe some kind of software with a learning curve, like Photoshop or something, where the cost of investment is capturing for the learning curve of that technology. If we want to think about the split of the surplus as coming from a price instead of bargaining, then we see that consumers would invest more in learning the technology if the price was lower than higher.

## Summary

The NBS isn't super realistic, but it's a nice tool to use when you don't want to get too into the details of bargaining. Sometimes that's ok and it doesn't distort the final outcome too much, and sometimes it isn't and it does.

Apparently, "Nash's Program" is to formulate cooperative bargaining solutions in terms of non-cooperative strategic games. For example, the symmetric NBS is also the split that both players would receive if they were almost infinitely patient and completely identical and engaged in an infinitely repeated Rubinstein bargaining game, which is not cooperative. I think this is pretty cool, as it lets us think of a cooperative game's outcome as a result of an underlying non-cooperative game. There's probably a theorem somewhere about when that representation exists and when it doesn't.
