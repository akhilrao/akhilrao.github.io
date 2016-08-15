---
layout: post
title: Broadcasting in the Dark Forest
category: micro theory
tags: micro theory, space economics
year: 2016
month: 08
day: 15
published: true
summary: When should a species to announce its presence to the universe?
---

I read Cixin Liu's [*The Three-Body Problem*](http://www.goodreads.com/book/show/20518872-the-three-body-problem) and [*The Dark Forest*](http://www.goodreads.com/book/show/23168817-the-dark-forest) a while ago. If you like science fiction, I highly recommend both of them. I hear the English version of the third book in the series, *Death's End*, is coming out on September 20th. I'm looking forward to it.

Though I think *Three-Body Problem* is the better story of the two, *The Dark Forest* had some interesting ideas of its own. The most interesting to me came late in the plot: a game theoretic explanation of the [Fermi Paradox](https://en.wikipedia.org/wiki/Fermi_paradox). From [wikipedia's page about *TDF*](https://en.wikipedia.org/wiki/The_Dark_Forest),

> The universe is full of life. Life in the universe functions on two axioms: 1. Life's goal is to survive and 2. That matter (resources) are finite. Like hunters in a dark forest, life can never been sure of alien life's true intentions. The extreme distances between stars creates an insurmountable 'Chain of Suspicion' where the two civilizations cannot communicate fast enough to relieve mistrust, making conflict inevitable. Therefore, it is in every civilization's best interests to preemptively strike any developing civilization before it can become a threat.

These axioms really appealed to me; "utility maximization" and "scarcity" are foundational in economics, and I like seeing them applied in science fiction settings.

[This philosophy stackexchange thread](http://philosophy.stackexchange.com/questions/18127/dark-forest-postulate-used-to-explain-the-fermi-paradox) has a nice discussion of the "Dark Forest Postulate" (including a simple matrix game formalizing the intuition from OP) and its assumptions. TL,DR: the Dark Forest assumptions might not hold, and there are many possible explanations for the Fermi Paradox. 

Another assumption I don't recall being stated explicitly in the book (but I think is important to the DF postulate) is speed-of-light restrictions on communication and travel - otherwise, the cost of communication/travel could be low enough to support cooperative equilibria.

In any case, I liked the idea, and wanted to try writing down a formal model in that vein. The question I consider here is: when is it optimal for a species to broadcast its presence to the universe at large?

## The Model

Let species $$i$$ be a species deciding whether or not to broadcast its presence, $$B_i \in \{0,1\}$$. Any species is characterized by two parameters: its technology $$\theta$$ and its resources $$\rho $$. Resources are matter and energy, and can be measured in energy units. I'm not sure how technology is measured, but I don't think it's too unreasonable to assume we can at least rank levels of technological development. Maybe it's maximum energy consumption from a unit of resources, so then it's energy units as well.

Broadcasting ($$B_i=1$$) is costless, and reveals species $$i$$'s presence to some other species $$j$$ with probability $$D_i \in [0,1]$$. If $$i$$ does not broadcast its presence, it gets to hide without ever being discovered.

A more involved model might actually model $$D_i$$ as a function of the type of broadcast, density of stars in the local neighborhood of $$i$$, add a cost to broadcasting, maybe even add elements of $$i$$ faking its type. This is not that model. 

**Assumption 1:** $$\theta_i \sim IID [0,\infty)$$ and $$\rho_i \sim IID [0,r] $$, where $$F$$ and $$R$$ are their respective CDFs. $$\theta_i$$ and $$\rho_i$$ both also have PDFs, and expectations $$E(\theta_i) = \bar{\theta} < \infty$$, $$E(\rho_i) = \bar{\rho} < \infty $$.

*Corollary 1a:* With nothing else known about $$F$$ and $$R$$, by the [Principle of Maximum Entropy](https://en.wikipedia.org/wiki/Maximum_entropy_probability_distribution) $$ \theta \sim \exp(\lambda), \lambda \in (0,\infty)$$ and $$ \rho \sim U[0,r] $$. (I don't think matter and energy are really uniformly distributed throughout the universe, but I'm not sure what other tractable distribution would be reasonable here.)

Assumption 1 encodes the notions of finite resources and potentially unbounded technological advancement (handwaving at thermodynamic constraints), while Corollary 1a gives the maximum entropy probability distributions under those assumptions. I think maximum entropy is an appropriate principle here since functional forms are convenient but anything else would impose stronger assumptions.

**Assumption 2:** Any species $$i$$ attempts to maximize a concave utility function $$u(\cdot)$$, and receives utility from technology $$\theta_i$$ and resources $$\rho_i$$ as $$u(\theta_i \rho_i)$$.

**Assumption 2a:** $$u(\cdot)$$ satisfies Inada conditions, $$\lim_{x \to 0} u'(x) = \infty$$ and $$ \lim_{x \to \infty} u'(x) = 0 $$.

Assumption 2 captures the idea that a species is better off with higher levels of technology/resources subject to diminishing marginal utility, and tries to be as well off as it can. It could be made more general with $$u_i(\cdot)$$ instead of just $$u(\cdot)$$, but I don't think it's necessary for a simple model. Assumption 2a captures the notion that a species considers total destruction (no resources/no technology) the worst possible outcome, and has $$0$$ marginal utility at infinitely high levels of technology. I'm not sure if the latter really matters in this setting, but the former will be important and it seemed weird to have one without the other.

**Assumption 3:** When two species $$i$$ and $$j$$ interact and both survive the interaction, their resources after interacting are given by the solution to the Nash Bargaining problem 

$$\begin{align}
\max_{x_i, x_j} ~& x_i^{\frac{\theta_i}{\theta_i + \theta_j}} x_j^{\frac{\theta_j}{\theta_i + \theta_j}} \cr
\text{s.t.} ~& x_i + x_j = \rho_i + \rho_j
\end{align}$$

Species $$i$$'s resources after the interaction are $$ x^*_i = \left ( \frac{\theta_i}{\theta_i + \theta_j} \right ) (\rho_i + \rho_j) $$, and species $$j$$'s are $$ x^*_j = \left ( \frac{\theta_j}{\theta_i + \theta_j} \right ) (\rho_i + \rho_j) $$. Species $$i$$'s expectation of $$x^*_i$$ prior to the interaction is $$\hat{x}_i = E(x^*_i) = \left ( \frac{\theta_i}{\theta_i + \bar{\theta}} \right ) (\rho_i + \bar{\rho})$$.
For simplicity, I ignore potential technology transfers; each species still has technology $$\theta_i$$ and $$\theta_j$$ after the interaction.

I think Assumption 3 is strong, but maybe not unreasonable. [NBS is a convenient assumption](http://akhilrao.github.io/micro%20theory/2015/11/01/nash-bargaining-example/) for sure. The idea I wanted to get at was that they'll split the total resources between them in proportion to their levels of technological development. The form of $$\hat{x}_i$$ also implies that species $$i$$ knows its own level of technological development and resource stock, but not species $$j$$'s until they interact. I think ignoring technology transfers makes this a little more pessimistic/conservative, as well as more tractable. I don't think it affects the qualitative conclusions.

**Assumption 4:** When two species $$i$$ and $$j$$ interact, the probability that the one with the lower level of technology (say it's $$i$$) does not survive the interaction is given by $$Y_i = Pr(\theta_j - \theta_i \geq \bar{C}) = 1 - Pr(\theta_j \leq \theta_i + \bar{C}) = 1 - e^{-\lambda (\bar{C} + \theta_i)}$$. The more technologically advanced species $$j$$ has net resources $$ \rho_i + \rho_j$$ after the interaction. 

Assumption 4 is strong, but I don't know a weaker way to encode the probability that a species is destroyed by interacting with a technologically more advanced one. I calculated $$Y_i$$ assuming $$i$$ knows $$\theta_i$$, so the only unknown is $$\theta_j$$.

The net resources bit isn't to say that the more advanced species is going to try to steal the less advanced species' resources (though that's a possibility), just that the stuff's there for the taking after the less advanced species is wiped out and I assume species $$j$$ takes it. Whether $$j$$ takes the resources or not doesn't really matter to $$i$$'s decision to broadcast or not, since $$i$$ would be dead. I ignore the potential incentive of finding a weaker species aand killing them and taking their stuff in the analysis below.

### Analysis

Let assumptions 1, 2, 3, and 4 hold. Let $$D_i = 1$$. Species $$i$$'s value function is

$$\begin{align}
V_i(B_i;\theta_i,\rho_i,\hat{x}_i) &= \max \{ u(B_i = 0), E(u(B_i = 1))\} \cr
&= \max \{ u(\theta_i \rho_i), Y_i u(0) + (1 - Y_i) u(\theta_i \hat{x}))\} 
\end{align}$$

$$u(\theta_i \rho_i)$$ is $$i$$'s utility from not broadcasting ($$B_i = 0$$), and $$Y_i u(0) + (1 - Y_i) u(\theta_i \hat{x})$$ is $$i$$'s utility from broadcasting ($$ B_i = 1$$). It is optimal for $$i$$ to broadcast its existence to the galaxy at large if

$$\begin{align}
E(u(B_i=1)) &\geq u(B_i=0) \cr
\implies Y_i &\leq \frac{u(\theta_i \rho_i) - u(\theta_i \hat{x}_i)}{u(0) - u(\theta_i \hat{x}_i)} ~~~(1) \cr
\end{align}$$

The concavity of $$u(\cdot)$$ from assumption 2 tells us that the bound on $$Y_i$$ in $$(1)$$ is non-negative if $$ \rho_i \leq \hat{x}_i $$, which implies $$ \frac{\theta_i}{\rho_i} \geq \frac{\bar{\theta}}{\bar{\rho}}$$ . In words, $$i$$'s technology/resource ratio should be at least as high as the average technology/resource ratio for broadcasting to be worth the risk of extinction. This is coming from the Nash Bargaining mechanism, since $$i$$ wants to broadcast only if there are good odds it will come out ahead in the event of a peaceful interaction.

Corollary 1a lets us clean up the bound on $$Y_i$$ to say that it's non-negative if $$ \theta_i \geq \frac{r \rho_i}{\lambda} $$ . I suppose this is at least in principle computable, though the uniform distribution assumption is sketchy. We can also do some basic comparative statics to say that $$i$$ is more likely to broadcast if 

1. the maximum potential resources available to $$j$$ are larger
2. $$i$$ has more resources
3. the average level of technological development is lower 

Under corollary 1a, any species $$i$$ with no information about the distribution of $$\theta$$ except for its own technology should be cautious: the probability that they are below the universal average level of technological development is $$\int_0^{\frac{1}{\lambda}} \lambda e^{-\lambda x} dx = \frac{e - 1}{e} \approx 0.63$$. 

Assumption 2a makes the bound on $$Y_i$$ much more pessimistic. With 2a, no matter what $$i$$'s resource level is, $$ \lim_{x \to 0} = -\infty$$ means broadcasting is never worth the risk of getting destroyed (left with no technology/resources).

What can we say about the distribution of broadcasting species $$\theta_{B=1}$$ in the universe? If assumption 2a holds, it's a spike at $$0$$ since no one wants to broadcast and risk annihilation. Let's suppose 2a doesn't hold, and express $$(1)$$ as a lower bound on $$\theta_i$$:

$$\begin{align}
e^{-\lambda (\bar{C} + \theta_i)} &\geq 1 - \frac{u(\theta_i \rho_i) - u(\theta_i \hat{x}_i)}{u(0) - u(\theta_i \hat{x}_i)} \equiv d  \cr
\implies \theta_i &\geq - \frac{\log(d)}{\lambda} + \bar{C} \equiv b
\end{align}$$

The distribution of $$\theta_{B=1}$$ will follow an exponential distribution, truncated from below at $$b$$. The PDF for $$\theta_{B=1}$$ is

$$ f_{\theta_{B=1}}(\theta| \lambda, b) = 1 - \frac{\lambda e^{-\lambda \theta}}{1 - e^{-\lambda b}} $$

$$E(\theta_{B=1}) = \frac{1 + b \lambda}{\lambda(e^{\lambda b} - 1)} > \frac{1}{\lambda}$$ for [some (but not all) admissible values of $$\lambda$$ and $$b$$](http://www.wolframalpha.com/input/?i=(1%2Bb+L)%2F((-1%2Be%5E(b+L))+L)+-+1%2FL+%3E0). The probability that $$i$$ is below $$E(\theta_{B=1})$$ is 

$$ \int_0^{E(\theta_{B=1})} \lambda e^{-\lambda x} dx = 1 - e^{-E(\theta_{B=1})}$$

[If $$E(\theta_{B=1}) > 1$$, this is higher than $$E(\theta)$$](http://www.wolframalpha.com/input/?i=1+-+exp(-x)+%3E+0.63,+x%3E0).

## Moral of the Model

Be careful about broadcasting your species' presence to the universe. If there is nothing worse than annihilation, never broadcast. If you're willing to risk annihilation and you haven't found any evidence of a species other than your own... your technology is probably below average, so be careful anyway.