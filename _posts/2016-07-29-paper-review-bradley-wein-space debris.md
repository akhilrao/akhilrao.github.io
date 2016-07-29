---
layout: post
title: Paper Review - "Space debris - Assessing risk and responsibility"
category: reviews
tags: environmental economics, applied theory, space economics
year: 2016
month: 07
day: 29
published: true
summary: I review some aspects of Bradley and Wein's 2009 paper about space debris.
---

Here I discuss some aspects of [Bradley and Wein (2009)](http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.164.4466&rep=rep1&type=pdf), published in *Advances in Space Research*.

The authors (BW) consider a number of different simulations to get at the behavior of the debris system over time. My interest right now is more in the model and its assumptions than the simulations and their results, so that's where I'll focus this post.

## Notation

$$\begin{align}
S_n^o(t):& \text{ spacecraft which can't deorbit, are still operational}  \cr
S_n(t):& \text{ spacecraft which can't deorbit, not operational}  \cr 
S_d(t):& \text{ spacecraft which can deorbit, operational}  \cr
R(t):& \text{ upper stage rocket bodies lingering at separation altitude}  \cr
\lambda_o:& \text{ rate at which spacecraft are launched into SOI}  \cr
\lambda_R:& \text{ rate at which rocket bodies are launched into SOI}  \cr
\theta_d:& \text{ fraction of spacecraft with deorbit capability}  \cr
\mu^{-1}_o:& \text{ is the average operational lifetime} \cr
\mu_o:& \text{ rate at which } S_d \text{ deorbit,}  \cr
& \text{ also rate at which } S_n^o \text{ change to } S_n \cr
\mu_n:& \text{ rate at which } S_n \text{ deorbit naturally} \cr
\mu_R:& \text{ rate at which } R \text{ deorbit naturally} \cr
F^{\kappa}_{\tau}:& \text{ effective number of fragments} \cr
\kappa \in \{ h, b \}:& \text{ is fragment hazardous or benign to intacts} \cr
\tau \in \{ R, S \}:& \text{ source of fragment, rocket body or spacecraft } \cr
\mu_{F^{\kappa}}:& \text{ rate at which fragments deorbit} \cr
\beta_{\alpha \gamma}:& \text{ the number of collisions between satellites of type } \alpha \text{ and } \gamma \text{ per unit time per satellite of type } \alpha \text{ per satellite of type } \cr
& \gamma   \text{, where } \alpha, \gamma \in \{ S, R, F^{\kappa}_{\tau} \} \cr
\beta_{\alpha \gamma} \alpha(t) \gamma(t):& \text{ rate of collisions between satellites of types } \alpha \text{ and } \gamma \text{ at } t \cr
\delta_{\alpha \gamma}^{\tau \kappa}\alpha(t) \gamma(t):& \text{ rate at which fragments of type } F^{\kappa}_{\tau} \text{ are generated from } \cr
& \text{ collisions between satellites of types } \alpha \text{ and } \gamma \cr
S(t) \equiv& S_n^o(t) + S_n(t) + S_d(t) \cr
F^h(t) \equiv& F^h_R(t) + F^h_S(t) \cr
F^b(t) \equiv& F^b_R(t) + F^b_S(t) \cr
F^S(t) \equiv& F^h(t) + F^b(t) \cr
U \equiv& \{S, R, F^h_S, F^b_S, F^h_R, F^b_R \} (\text{the set of satellite types}) \cr
U^h \equiv& \{S, R, F^h_S, F^h_R\} (\text{the set of satellites hazardous to intacts}) \cr
U^F \equiv& \{F^h_S, F^b_S, F^h_R, F^b_R\} (\text{the set of fragment types}) \cr
U^I \equiv& \{S, R \} (\text{the set of intact types}) \cr
\end{align}$$

Notes about the notation:

1. I'm assuming that $$\lambda_R \in [0, \lambda_o]$$, since the rocket bodies are used to launch spacecraft.
2. The "effective" number of fragments refers to the fragments being weighted by the proportion of their time they spend in the SOI.
3. "A particular fragment is not simply hazardous or benign to intacts the uncertainty in collision velocity causes the properties of the fragment to determine the probability with which it is hazardous or benign in a particular collision." A particular fragment from source $$\tau \in \{ R, S \}$$ increases the effective numbers $$F^h_{\tau}$$ and $$F^b_{\tau}$$ by quantites that sum to 1.
4. The assumption on the rate of new fragment generation is because satellite cross-section (which determines likelihood of collision) and mass (which determines number of fragments) have a joint probability distribution. A collision between a rocket body and a spacecraft produces all four types of fragments: hazardous and benign from both the rocket body and the spacecraft.
5. "Hazardous" fragments can produce catastrophic collisions with intacts; "benign" fragments cannot.
6. "Intacts" refers to rocket bodies or spacecraft.

## Model

The full model is given by
$$\begin{align}
\dot{R}(t)=& \lambda_R - \sum_{\alpha \in U^h} \beta_{R \alpha} R(t) \alpha(t) - \mu_R R(t)  &(1) \cr
\dot{S}_n^o(t)=& (1 - \theta_d) \lambda_o - \sum_{\alpha \in U^h} \beta_{S \alpha} S_n^o(t) \alpha(t) - \mu_o S_n^o(t)  &(2) \cr
\dot{S}_n(t)=& \mu_o S_n^o(t) - \sum_{\alpha \in U^h} \beta_{S \alpha} S_n(t) \alpha(t) - \mu_n S_n(t)  &(3) \cr
\dot{S}_d(t)=& \theta_d \lambda_o - \sum_{\alpha \in U^h} \beta_{S \alpha} S_d(t) \alpha(t) - \mu_o S_d(t)  &(4) \cr
\dot{F}_{\tau}^{\kappa}(t)=& \frac{1}{2} \sum_{\alpha \in U} \sum_{\gamma \in U}\delta_{\alpha \gamma}^{\tau \kappa}\alpha(t) \gamma(t) - \mu_{F_{\tau}^{\kappa}}F_{\tau}^{\kappa}(t)  &(5) \cr   
\end{align}$$

for $$\tau \in U^I, \kappa \in \{ h, b \} $$.

For the equilibrium analysis, they define some new parameters in order to simplify system (1)-(5). The new parameters are
$$\begin{align}
\beta_{II} =& \max \beta_{\alpha \gamma} \cr
\beta_{IF} =& \max \beta_{\alpha \zeta} \cr
\mu_I =& \min \{ \{ \text{if } \lambda_R >0, \mu_R; \text{ else } \infty \}, \cr
&    \{ \text{if } \theta_d <1, \mu_n; \text{ else } \infty \},\mu_o \} \cr
\lambda_I =& \lambda_R + \lambda_o \cr
\frac{\delta_{II}}{\beta_{II}} =& \frac{\delta_{IF}}{\beta_{IF}} = \max \left { \max \frac{\delta_{\alpha \gamma}^{\tau \kappa}}{2\beta_{\alpha \gamma}} , \max \frac{\delta_{\alpha \zeta}^{\tau \kappa}}{\beta_{\alpha \zeta}} \right }
\mu_F =& \min_{\alpha \in U^F} \mu_{\alpha}
\end{align}$$

for $$\alpha, \gamma \in U^I$$, $$ \zeta, \eta \in U^F $$, $$\tau \in \{ R, S \} $$, $$\kappa \in \{ h,b \} $$.

The simplified system is
$$\begin{align}
\dot{I}(t)=& \lambda_R - \sum_{\alpha \in U^h} \beta_{R \alpha} R(t) \alpha(t) - \mu_R R(t)  &(6) \cr
\dot{F}(t)=& (1 - \theta_d) \lambda_o - \sum_{\alpha \in U^h} \beta_{S \alpha} S_n^o(t) \alpha(t) - \mu_o S_n^o(t)  &(7) \cr
\end{align}$$

As I'm understanding it, the simplified system involves using the highest rates of collision and decay from the full system, and imposing that the rates of fragment generation are proportional to the rates of collision for intacts and fragments. I think this is done so that the simulations run faster and BW can focus on the long-term equilibrium behavior of the system.

### Sustainability

One of the features of this paper I found really interesting was the system quality metric BW used, the "maximum (over all time) lifetime risk to an operational spacecraft". They describe this as a sustainability metric as opposed to an efficiency metric. The metric is defined as

$$\begin{align}
\max_{t \geq 0} r^0(t)& \cr
 r^0 &= 1 - \left ( 1 - \sum_{\alpha \in U^h} \beta_{S \alpha} \alpha(t) \right )^{\mu_o^{-1}}
\end{align}$$

This metric measures the system's hazard as the probability that a spacecraft launched at time $$t$$ will be destroyed, while it is still operational, by an intact-intact or intact-fragment catastrophic collision.

### Optimality of Deorbit Compliance

Let $$C_d$$ be the cost to deorbit, $$C_S$$ be the cost of a destroyed operational spacecraft, $$\theta_a$$ be the attempted compliance rate, $$s$$ be the probability that a deorbit attempt is successful (so that $$\theta_d = s \theta_a$$), and $$r^o_{\max}(\theta_d)$$ be the sustainable lifetime risk of an operational spacecraft when the successful compliance rate is $$\theta_d$$. Then the Space Board/social planner would solve

$$ \min_{\theta_a} \theta_a C_d + r^o_{\max}(s \theta_a) C_S $$

Using values from the literature, BW solve this problem and find that $$ \theta_a* = 1$$. They find that $$\theta_a* < 1$$ requires $$C_d =$$ $30 million, which is many times larger than the actual values and costs they find in the literature. Similarly, they find that 100% compliance with rocket body deorbiting is socially optimal.

### Assessing damage due to space activities

BW define the damage caused by a space activity to be the total number of destroyed operational spacecraft generated by said activity. Letting $$ S^o(t) = S_n^o(t) + S_d(t)$$ be the number of operational spacecraft at time $$t$$, the number of destroyed operational spacecraft up to time $$T$$ is

$$ n_d(T) = \int_0^T S^o(t) \sum_{\gamma \in U^h} \beta_{S \gamma} \gamma(t) dt $$

## Discussion

### On the contributions

It seems like the main contributions of this paper to the debris modeling literature are (1) it considers hazardous and benign fragments separately, and (2) it does so in a tractable ODE system.

It seems like the main contributions of this paper to the economics literature on orbital debris are (1) it considers the costs of orbital debris to satellite launchers, (2) it considers the optimality of deorbit compliance, and (3) it offers a more practical metric of the system's quality than economic efficiency, all within a realistic debris modeling framework.

### On the model and results

BW point out that this model is generic and can be used at any altitude, though the accuracy may suffer at altitudes where the SOI is just below a congested SOI. That they didn't find much effect from allowing debris from higher shells to enter the SOI tells me that I can probably ignore those drift effects in my own model.

Considering intacts and fragments, benign and hazardous objects, separately, and using sustainable lifetime risk as a performance metric, leads BW to different conclusions than Kessler, Liou and Johnson, and others in the debris modeling literature. BW find that the number of fragments is bounded, and that the sustainable lifetime risk remains below $$ 10^{-3} $$ as long as deorbit compliance is higher than 98%.

On the economic front, BW point out that fees to preserve the orbital environment should be designed to deter debris-generating activity. One way to do this is with differential launch fees which vary based on the deorbit capability of the spacecraft and its launch vehicle.

BW point out three reasons why rational profit-maximizing firms might not fully comply with deorbit requirements (as is currently the case):
1. they are behaving myopically and are discounting collisions that happen in the far future (perhaps having faith in a future technological solution to the problem, i.e. a "backstop technology");
2. they do not plan many launches in congested regions of space, and so don't care about the benefits of deorbiting or the costs of not deorbiting;
3. they have an inventory of old spacecraft which are too expensive to retrofit for deorbiting.

My guess is that it's a combination of all three, probably 1 and 3 the biggest contributors. From a policy standpoint, 1 and 2 can be addressed but I don't see what can be done about 3.

To the extent that deorbit costs are different or perceived to be, the noncompliance fee (or compliance subsidy) should be high enough to deter all players. If a single player can substantially alter $$\theta_d$$ by their deorbit policy, it may be efficient to use a Vickrey-type solution and charge each player the damage of their aggregate policy decision.

BW also raise the issue of moral hazard in noncompliance fees: propulsion systems fail (the literature estimates a 3.9% failure rate), and so a spacecraft owner who plans to deorbit may be unable to do so due to system failure. A spacecraft owner who doesn't plan to deorbit has an incentive to pretend to have suffered such a systems failure to avoid an intention-based deorbit fee. Charging on the basis of observed outcomes would penalize owners who suffer failures they couldn't prevent.

Apparently passivation techniques to minimize explosions from non-operational spacecraft that are not deorbited and deorbiting rocket bodies appears to be close to 100%.

### Other thoughts

I really like the focus on "sustainability" over "efficiency", mainly because I'm not sure how to define "efficiency" for this system. The practical problem with "efficiency" is the variety of uses for LEO. An attempt to actually measure the system quality through economic efficiency would have to go about quantifying the value of satellite imaging services, the research potential of the ISS and any future space stations, the value of potential space-based manufacturing, the value of LEO tourism, etc. I feel like this is difficult to do credibly. "Sustainability" as defined in this paper, on the other hand, can plausibly be credibly measured with enough telescopes, radars, and simulations.

I think the main drawback of this paper from an economic standpoint is its treatment of the launch rates of satellites and rocket bodies, i.e. how $$\lambda_o$$ and $$\lambda_R$$ are determined. In the paper, both of these values are treated as parameters to be set exogenously, rather than as endogenous responses by optimizing agents. 

BW's result from analyzing the social optimality of deorbit compliance (that full compliance is socially optimal) makes sense to me. However, I don't know if full compliance is also optimal for individual profit-maximizing firms. My priors are that individual firms would find $$\theta_a <1$$ optimal for smaller values of the cost parameters and higher values of the risk parameter than the Space Board would. I don't have priors on how high the relevant [price of anarchy](https://en.wikipedia.org/wiki/Price_of_anarchy) (in terms of lifetime sustainable risk) would be, but I do think it would be strictly greater than 1.

Endogenizing the launch rates, launch vehicle choices, and deorbit compliance is where I am focusing my model. While my current debris model is much simpler than this one (simple enough to be manageable in pencil and paper), I think I should work on marrying my model of launch decision-making to this model of orbital debris evolution. In terms of this model, I think this would mean that $$\lambda_o$$, $$\lambda_R$$, and $$\theta_d$$ would be $$\lambda_o*(t;U^I, U^F)$$, $$\lambda_R*(t;U^I, U^F)$$, and $$\theta_d*(t;U^I, U^F)$$ - best-response functions which change over time in response to the state of the fragment and intact stocks.
