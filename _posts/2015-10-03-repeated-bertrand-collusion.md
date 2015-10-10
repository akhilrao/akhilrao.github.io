---
layout: post
title: Repeated play and collusion in an N-firm Bertrand oligopoly 
category: micro theory
tags: micro-theory oligopoly Bertrand collusion repeated-game 
year: 2015
month: 10
day: 03
published: true
summary: N firms play a repeated Bertrand game. Conditions under which collusion is sustainable are explored.
---

So far, [we've seen](http://akhilrao.github.io/micro%20theory/2015/09/29/bertrand-cournot-oligopoly/) one-shot Bertrand games with up to \\(N\\) firms. What happens if the firms are playing a Bertrand game repeatedly for \\(T\\) periods?

Consider a repeated Bertrand oligopoly with \\(N \ge 2\\) firms, played for \\(T \lt \infty\\) periods. We know that the one-shot Nash equilibrium is \\(p_{i}=c \ \ \ \forall i \\). For \\(T\\) periods, we start at the last period and work backwards (backwards induction).

In the last period, the game is a one-shot Bertrand game. Thus the equilibrium price will be \\(p_{i,T}=c \ \ \ \forall i\\). Each firm knows that in period \\(T-1\\), and  since there's no possibility of colluding tomorrow they each play \\(p_{i,T-1}=c\\). We can extend the argument to see that \\(p_{i,t}=c \ \ \ \forall t,i\\).

What if \\(T = \infty\\)? If the game is infinitely repeated, we can't apply backwards induction since there is no last period. Instead, we define trigger strategies and look for parameter restrictions that would need to hold to make the strategy a [subgame-perfect Nash equilibrium](https://en.wikipedia.org/wiki/Subgame_perfect_equilibrium). 

Let's take the same example, and assume that play is history-dependent, i.e. players consider what happened before in deciding what to do today. We'll consider 3 cases: first when players compete in an infinitely repeated market like above, second when the market as an exogenous probability of ending after each period, and third when firms compete in both markets simultaneously.

### Case 1:
Suppose players are competing in a market with inverse demand \\(D(p)\\), call it market A, and have a discount factor \\(\delta \lt 1\\). The history at any period \\(T\\) is given by:

$$ H_{T-1} = \\{ (p_{i,t}); i=1,2,...,N; t=1,2,...,T-1 \\} $$

The [trigger strategy](https://en.wikipedia.org/wiki/Trigger_strategy) I define for each player \\(i\\) to collude is:

$$ p_{i,t} =
\begin{cases}
p_m \ \ \text{if all elements of} \ \ H_{t-1} = p_m, \ \ \text{or if} \ \ t=1 \cr
c \ \ \text{otherwise}
\end{cases} $$

where \\(p_m\\) is the monopoly price, and \\(\pi_m\\) is the monopoly profit. We assume that if the firms collude, they do so optimally - they set the price at the monopoly price and divide the profits equally. This is better than pricing at marginal cost and earning 0 profits. But in every period, there is an incentive for firms to deviate and slightly undercut everyone else, capturing the full monopoly profits for one period if they do. However, when they do this everyone goes into the punishment phase and plays \\(p=c\\), so nobody makes any profits after that. The decision to cooperate or deviate comes down to weighing a stream of discounted payoffs every period against one big payoff today. The discount factor, \\(\delta \in (0,1)\\) determines how heavily firms weigh future payoffs against present payoffs.

The firms' payoffs from cooperating and deviating optimally are:

$$\begin{align}
\text{Cooperate:} & \ \ \frac{\pi_m}{N} + \delta\frac{\pi_m}{N} + \delta^2\frac{\pi_m}{N} + ... \cr
& = \frac{\pi_m}{N}\frac{1}{1-\delta} \cr \cr
\text{Deviate:} & \ \ \pi_m + 0 + 0 + ... \cr
& = \pi_m \cr
\end{align}$$

To find the minimum \\(\delta\\) that can support collusion, we set the cooperation payoff to be greater than or equal to the deviation payoff and solve for \\(\delta\\). This gives us that the critical discount factor is

$$\delta_c \ge \frac{N-1}{N} $$

So as \\(N \to \infty\\), \\(\delta_c \to 1\\). When \\(N=2, \delta_c \ge \frac{1}{2}\\). Collusion becomes harder to sustain when there are more firms, as it requires each firm to weight future payoffs increasingly heavily against current payoffs.

### Case 2:
In this case, there is an exogenous probability \\(\alpha \in (0,1)\\) that the market will end after each period. Let's call this market B. The strategy we defined earlier can be applied here and the deviation payoff is the same, but the cooperation payoff is a little different:

$$\begin{align}
\text{Cooperate:} & \ \ \frac{\pi_m}{N} + \delta(1-\alpha)\frac{\pi_m}{N} + \delta^2(1-\alpha)^2\frac{\pi_m}{N} + ... \cr
& = \frac{\pi_m}{N}\frac{1}{1-\delta(1-\alpha)} \cr
\end{align} $$

Solving for the critical discount factor, we get

$$\delta_c \ge \frac{N-1}{N}\frac{1}{(1-\alpha)} $$

When \\(N=2\\): 

* \\(\alpha\to0 \implies \delta_c \ge \frac{1}{2}\\)
* \\(\alpha=\frac{1}{2} \implies \delta_c \ge 1\\)
* \\(\alpha\to1 \implies \delta_c \ge \infty\\)

If the market will survive with probability 1, they are as likely to cooperate as in case 1. If the market is 50% or more likely to end tomorrow, they will not cooperate.

### Case 3:
Finally, what if the firms compete in markets A and B simultaneously? Is collusion more or less likely then? The strategies and payoffs are a bit different here.

The history at time T is: 

$$ H_{T-1} = \\{ (p_{i,t,A},p_{i,t,B}); i=1,2,...,N; t=1,2,...,T-1\\} $$

The trigger strategy I define is:

$$ (p_{i,t,A},p_{i,t,B}) =
\begin{cases}
(p_m,p_m) \ \ \text{if all elements of} \ \ H_{t-1} = (p_m,p_m), \text{or if} \ \ t=1 \cr
c \ \ \text{otherwise}
\end{cases} $$

The payoffs from cooperating and deviating are:

$$\begin{align}
\text{Cooperate:} & \ \ (\frac{\pi_m}{N} + \frac{\pi_m}{N}) + (\delta\frac{\pi_m}{N} + \delta(1-\alpha)\frac{\pi_m}{N}) + (\delta^2\frac{\pi_m}{N} + \delta^2(1-\alpha)^2\frac{\pi_m}{N}) + ... \cr
& = 2\frac{\pi_m}{N} + \frac{\pi_m}{N}\frac{\delta(1+(1-\alpha))}{1-\delta(1+(1-\alpha))} \cr \cr
\text{Deviate:} & \ \ 2\pi_m + 0 + 0 + ... \cr
& = 2\pi_m \cr
\end{align}$$

I'm defining this as simply as I can: firms collude if other firms cooperate in both markets. Any firm who deviates is going to deviate in both markets at the same time. If firms see another firm deviate in either market, all firms go into the punishment phase and play \\(p=c\\) forever after. This way of defining it makes sense to me because deviating in both markets is better than deviating in one market, given the trigger strategy. I think this trigger strategy also prevents a firm from repeatedly defecting in only one market at a time, which could happen if a double-defection was needed to initiate the punishment phase.

Solving like before, we get

$$\delta_c \ge \frac{2(N-1)}{1+2(N-1)}\frac{1}{(2-\alpha)} $$

As \\(N \to \infty\\), \\(\delta_c \to 1 ~~~ \forall \alpha\\). When \\(N=2\\): 

* \\(\alpha\to0 \implies \delta_c \ge \frac{1}{3}\\)
* \\(\alpha=\frac{1}{2} \implies \delta_c \ge 1\\)
* \\(\alpha\to1 \implies \delta_c \ge \frac{2}{3}\\)


As I understand it, \\(\alpha=\frac{1}{2}\\) represents a state of total uncertainty - market B is equally likely to exist or not exist tomorrow. Any non-uniform distribution over the state of market B tomorrow gives the players more information about what is likely to happen than when \\(\alpha=\frac{1}{2}\\). When players are completely uncertain about whether or not market B will exist tomorrow, they need to weigh tomorrow at least as heavily as today in order to cooperate (given our assumptions on \\(\delta\\), they can't do that). When market B survives with probability 1, they are most likely to cooperate (\\(\delta \ge \frac{1}{3}\\)). When market B survives with probability 0, they need a discount factor of at least \\(\frac{2}{3}\\) to cooperate.


Collusion can be more or less likely in case 3 than case 2 or case 1. Depending on how likely it is that market B will exist tomorrow the firms' payoffs from cooperating can be more than doubled, but their payoffs from deviating are doubled no matter what happens to market B tomorrow.

### Summary

The one-shot and finitely-repeated Bertrand games have very vicious competition, but as we see here the infinitely-repeated Bertrand game can support collusion if firms value the future highly enough. As the number of firms increases, collusion gets harder to support. When the market might end at any time, collusion gets harder to support. One way to make collusion more feasible when a market could end at any time is to have the firms compete simultaneously in another market that won't end. Depending on the probability of the second market ending, the two-market case may be more collusive than a single unending market. Repeated-play makes things interesting.

#### Variations to explore

* Infinitely-repeated Cournot oligopoly

* Infinitely-repeated matrix game with correlated equilibria. The Folk Theorem can be used here.

* Finitely-repeated and infinitely-repeated Rubinstein bargaining. Not really a variation of this - the only similarity is that they're both dynamic games - but still an interesting model.