---
layout: post
title: A principal-agent problem between an owner and a manager
category: micro theory
tags: micro-theory principal-agent problem owner manager
year: 2015
month: 10
day: 15
published: true
summary: A firm's profit is a random variable. A manager can exert effort to influence it. An equilibrium is described given some conditions on the conditional density of profit and the manager's utility from effort.
---

Suppose a firm's owner contracts a manager to run the firm. The firm's profit is a random variable \\(\pi \in [\pi_a , \pi_b]\\\)  which the manager can influence through some effort. For simplicity, assume effort is discrete: \\(e \in \\{e_l,e_h\\}\\), with \\(e_h \gt e_l \ge 0 \\).  The manager's efforts are such that profits with \\(e_h\\) first-order stochastically dominate profits with \\(e_l\\), i.e. \\(E \ [\pi|e_h] \gt E \ [\pi|e_l]\\) and \\( f(\pi|e) \gt 0 ~~ \forall \pi\\). The manager's utility is \\(u(w,e) = v(w) - g(e)\\) with \\(g(e_h) \gt g(e_l) \\) and \\(v'(w) \gt 0, v''(w) \lt 0\\). The manager's utility strictly concave, so they are risk-averse. Let's assume the manager's reservation utility is \\(\bar{u} \ge 0 \\).

The idea is that the manager would prefer to exert less effort to more, but that more effort is likely to produce higher profits than less effort. No manager can control everything - profit is still a random variable and low realizations can occur when the manager exerts more effort, it's just less likely. The manager's reservaton utility is their outside offer or what they could produce at home. For clarity, let's call the owner she and the manager he.

#### Benchmark case: effort is publicly observable

If the manager's efforts are publicly observable, then the owner solves

$$ \begin{align}
\max_{e \in \\{e_l, e_h \\}, w( \pi )} ~~& \int_{\pi_a}^{\pi_b} [\pi - w( \pi )] f(\pi | e) ~ d \pi \cr
\text{s.t.} ~~& \int_{\pi_a}^{\pi_b} v(w(\pi )) f(\pi | e) ~ d \pi - g(e) \ge \bar{u}
\end{align} $$

We can think of this as a two-stage decision process: given some level of effort from the manager, the owner wants to pay him the profit-maximizing wage. The constraint is called an "individual rationality (IR) constraint" or a "participation constraint". It's a way to factor the manager's problem into the owner's decision-making - the owner is constrained to pay the manager a wage that is at least as good as the manager's outside offer. If the owner doesn't, the manager won't work for her. For a fixed level of effort \\(e\\), the owner's problem can be simplified to minimizing the manager's wage subject to the participation constraint, or maximizing the negative of the manager's wage.

$$ \begin{align}
\min_{w( \pi )} ~~& \int_{\pi_a}^{\pi_b} w( \pi ) f(\pi | e) ~ d \pi \cr
\text{s.t.} ~~& \int_{\pi_a}^{\pi_b} v(w(\pi )) f(\pi | e) ~ d \pi - g(e) \ge \bar{u}
\end{align} $$

A minimization problem can be made into a maximization problem by multiplying the objective by \\(-1\\). Economists seem to prefer maximization, while statisticians and computer scientists seem to prefer minimization. I'm not sure why this is the case, or if it even is the case beyond my limited sample. 

Since we integrated over \\(\pi\\) this wage holds for all realizations of profit. We can solve this as a constrained maximization

$$ \begin{align}
\mathcal{L} = & - \int_{\pi_a}^{\pi_b} w( \pi ) f(\pi | e) ~ d \pi + \lambda [\int_{\pi_a}^{\pi_b} v(w(\pi )) f(\pi | e) ~ d \pi - g(e) - \bar{u}] \cr
\text{FOC:} ~~ & - \int_{\pi_a}^{\pi_b} f(\pi | e) ~ d \pi + \lambda \int_{\pi_a}^{\pi_b} v'(w(\pi )) f(\pi | e) ~ d \pi = 0 \cr
\implies ~~ & \frac{1}{v'(w(\pi ))} = \lambda
\end{align} $$

From this we see that for a given level of effort, the optimal wage must be a constant. The optimal wage profile for any level of effort is to pay the manager the inverse wage-utility of the sum of their reservation utility and their marginal cost of effort, or \\(w^\*_e = v^{-1}(\bar{u} + g(e)) \\). We can think of this as insurance against profit risk: the optimal contract will insure the risk-averse manager against any realization of profit, since the manager's effort doesn't guarantee high profits, just makes it more likely.

The lagrange multiplier \\( \lambda\\) on the participation constraint is the owner's [shadow price](https://en.wikipedia.org/wiki/Shadow_price) of the manager's participation: it's the owner's (maximum) willingness-to-pay to marginally reduce the manager's reservation utility. More generally, the lagrange multiplier on a constraint is the improvement to the objective function from marginally relaxing that constraint.

The IR constraint must bind in this problem if the manager works for the owner. Any excess utility the owner gives the manager reduces the owner's profit, so the owner can always do better by reducing the manager's wage until the constraint binds.

#### Information problem: effort is manager's private information

Now suppose the manager's effort level is not publicly observable anymore, it's the manager's private information. Now the owner solves

$$ \begin{align}
\min_{w( \pi )} ~~& \int_{\pi_a}^{\pi_b} w( \pi ) f(\pi | e) ~ d \pi \cr
\text{s.t.} ~~& \int_{\pi_a}^{\pi_b} v(w(\pi )) f(\pi | e) ~ d \pi - g(e) \ge \bar{u} \cr
& e = \text{argmax} ~~ \int_{\pi_a}^{\pi_b} v(w(\pi )) f(\pi | e) ~ d \pi - g(e) \cr
\end{align} $$

The second constraint is called an "incentive compatibility" (IC) constraint. It says that the effort level the owner wants to implement has to be solve the manager's problem. I think of this as a refinement on the IR constraint - not only should it make sense for the manager to participate, it should be what they would most prefer to do. The manager should have no incentive to deviate. It's not quite the same as the IR constraint, since it's possible for the argmax of the manager's problem under effort is lower than the reservation utility.

Implementing \\(e_l\\) is easy - the owner just pays the manager the same wage as under observable effort. It satisfies the IR constraint, and at that wage the manager would put in low effort anyway (there is no profitable deviation). Implementing \\(e_h\\) is more interesting, since the IC constraint becomes important. For this problem, the IC implies

$$ \int_{\pi_a}^{\pi_b} v(w(\pi )) f(\pi | e_h ) ~ d \pi - g(e_h ) \ge \int_{\pi_a}^{\pi_b} v(w(\pi )) f(\pi | e_l ) ~ d \pi - g(e_l ) $$

So the manager's expected value of putting in high effort has to be greater than or equal to his expected value of putting in low effort. If not, the manager has an incentive to deviate and since effort is unobservable, he will.

As before, we put it into a lagrangian. From the first-order condition of the owner's problem,

$$\begin{align}
w(\pi) : ~~ & - \int_{\pi_a}^{\pi_b} f(\pi | e_h ) ~ d \pi + \lambda  \int_{\pi_a}^{\pi_b} v'(w(\pi )) f(\pi | e_h ) ~ d\pi \cr + \ & \gamma \int_{\pi_a}^{\pi_b} [f(\pi | e_h )-f(\pi | e_l )] \ v'(w(\pi)) = 0 \cr
\implies ~~ & \frac{1}{v'(w(\pi ))} = \lambda + \gamma \left[ 1 - \frac{f(\pi|e_l )}{f(\pi|e_h )} \right]
\end{align}$$

The condition on the wage has the same component of the IR constraint multiplier - the shadow price of the manager's participation - and a new component from the IC constraint based on the shadow price of the manager's cooperation. This component is not a constant - it depends on the realizations of profit through the ratio of conditional densities of profit given effort. In repeated play, this term is a likelihood ratio. 

By the same argument as earlier, the IR constraint must bind. By a similar argument, the IC constraint will also bind if high effort is implemented.

The cooperation shadow price is scaled based on the likelihood ratio of observed profits given effort, i.e. based on how likely the observed profits were given the efforts the manager could have exerted. I'm not sure how to do this if effort were continuous; maybe a conditional expectation? 

If the manager cooperates and doesn't shirk, the second component can be nearly as large as the owner's shadow price on cooperation (because the densities are strictly positive on the support, the likelihood ratio can be small but not 0). However, profits are random, and low realizations will affect the manager's pay - low realizations are just less likely when the manager is cooperating. I see the way the likelihood ratio enters as an "information penalty". Without further restrictions, the penalty may cause the wage to be negative. I think this is unrealistic, but my guess is that adding a wage nonnegativity constraint will penalize the manager's wage, since the owner can't optimally punish the manager for bad profit realizations. I should try that.

My guess is that there is some connection between this information penalty and how much information is contained in the conditional distributions, or how sensitive profits are to efforts. I think that in the limiting case of the conditional distribution of profits being uniform for any effort level, the second term in the optimal wage would disappear. In that case, the owner would only pay the manager enough to participate, but since the owner has no information to check on the manager's effort levels, the owner won't pay the manager anything for exerting effort. In that case, I don't think an equilibrium where the manager exerts high effort can be sustained.

In the other direction, if the conditional distributions are highly informative about effort levels, then the penalties will be applied much more swiftly and harshly but also much less often if the manager is cooperating.

The information penalty also seems related to the [Price of Anarchy](https://en.wikipedia.org/wiki/Price_of_anarchy), like maybe a "likelihood-PoA" or something. I wonder if that's a thing.

It would be interesting to see a critical discount rate for the manager's cooperation in a dynamic version of this, given that he may be penalized even if he cooperates.

#### Conclusion

This model is like my earlier attempt to model an owner-manager problem combined with the labor market signaling problem. Unlike the earlier problem, here the manager's behavior is embedded in the owner's problem as a constraint. This problem also abstracts away from the actual generation of profits - the owner in this problem only sees profits as a random variable, not as actual revenues and costs. This lets us get effort into the problem, which lets us drive a wedge between the owner and the manager. Given the manager's incentive compatibility constraint, it seems like low realizations of profits could cause the manager to shirk, but I'm not sure if that's true.

The initial assumptions are somewhat strict, and it makes sense to change them based on the specific question at hand. One example I've been thinking of is a mutual fund manager principal-agent problem. The owner would be the investor (the manager's client), the profits would be the mutual fund's returns, and effort would be trading activity. Many mutual funds charge commissions for "active management", but generally portfolio returns are higher under "passive management". This would require reversing our earlier assumptions about effort and the conditional distribution of profits given effort. In the benchmark case, we can imagine the investor is choosing between an actively managed fund versus a passively managed one. When the trading activity is hidden information, then there would probably be a condition very similar to the incentive compatibility constraint here that would scale the manager's pay based on observed portfolio returns, with a penalty for excess trading. 

What if the principal doesn't know the conditional distribution of payoffs given the agent's actions? One way to model that could be as a Bayesian game - the principal has some beliefs over the distribution, and learns from repeated play.

I like this model a lot. The problems aren't hard to solve, but the way they go together makes the model do interesting things. The initial assumptions are important, but it is reasonable to change them and try things. I think these features make a model fun to play with. I wonder how well its predictions have held up if/when they've been put to the data.