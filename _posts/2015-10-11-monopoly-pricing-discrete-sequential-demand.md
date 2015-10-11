---
layout: post
title: Monopoly pricing for sequential discrete demand
category: micro theory
tags: micro-theory monopoly pricing discrete demand 
year: 2015
month: 10
day: 04
published: true
summary: How should you optimally price a piece of used furniture when you're moving and have two buyers lined up?
---

Today's post is a variation on [monopoly pricing for discrete demand](http://akhilrao.github.io/micro%20theory/2015/10/04/monopoly-pricing-discrete-demand/).

Suppose you're moving, and you have a piece of used furniture that you need to sell. You've got two potential buyers, \\(B_1\\) and \\(B_2\\), lined up to buy it. They arrive sequentially, so \\(B_2\\) won't have anything to look at if \\(B_1\\) buys. Assume \\(B_i\\) is willing to pay \\(v_i\\) for the furniture, where \\(v_i\\) is an independent draw from a uniform CDF \\(F(v_i) = \frac{v_i - a}{b - a}\\) for \\(v_i \in [a,b]\\). The furniture has no value to you if it isn't sold - you can't take it with you - and there is no discounting. There's no bargaining, either - you get to make a take-it-or-leave-it offer to each buyer.

Let's start at the end of this game. Suppose \\(B_1\\) rejected your offer. Let's also use some numbers: \\(a=40, b\=40\\).

#### Pricing for the second buyer

The game ends if this buyer rejects, so this round is basically the same as the example from our previous post. Your price solves

$$ \max_{p_2} ~ (p_2-c)(1-F(p_2)) $$

Giving us

$$ p_2 = c + \frac{1-F(p_2 )}{f(p_2 )} $$

In this example, the marginal cost would be the opportunity cost - the value of the furniture to you if you didn't sell it. We know that's 0 here because you're moving and can't take it with you. Plugging in for this uniform CDF and PDF, the optimal price becomes

$$\begin{align}
 p_2 &= \frac{b}{2} \cr
\implies p_2 &= 70 \cr
\end{align} $$

Your expected profits from this pricing scheme are

$$\begin{align}
\pi_2 &= (p_2-c)(1-F(p_2)) \cr
&= (70)(\frac{70}{100}) \cr
&= 49 \cr 
\end{align}$$

Note that there's no discounting here - if there was, we'd be hitting this expected profit with a discount rate, and it would be lower than 49.

#### Pricing for the first buyer

Now that we know the end of the game, we can go backwards to the first round. You're solving the same problem for the first buyer, but now you have to keep in mind that if the first person doesn't buy, you've still got the second person coming. The optimal price will solve

$$ \max_{p_1} ~ p_1(1-F(p_1)) + F(p_1) \pi_2 $$

Giving us

$$ p_1 = \frac{189}{2} \gt p_2 $$

This is nice and what we would expect: when you have multiple buyers lined up, your price should decrease over time as buyers reject, if only because there are fewer buyers coming later. The last buyer should receive the lowest price.

To round it off, your expected profits in the first stage would be 73.7975. Your expected profits decrease as you move through the buyers, since your price gets lower and you lose the expected value of the future buyers.

Adding discounting wouldn't change the key features of this problem. Adding bargaining would, since the buyers wouldn't have to accept your profit-maximizing price. Discounting plus bargaining would change things by giving the person with the higher discount rate (more patience) an advantage. This is what happens in Rubinstein bargaining games.
