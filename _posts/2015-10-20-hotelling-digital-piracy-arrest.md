---
layout: post
title: Hotelling monopoly pricing for a digital good with piracy
category: micro theory
tags: micro theory, oligopoly, cournot, piracy
year: 2015
month: 10
day: 20
published: true
summary: A Hotelling monopolist producing a zero marginal cost good faces competition from a zero-price supply of the good ("piracy"). The zero-price supply is associated with a risk of no payoff for the consumer ("arrest"). 
---

This post and [previous post](https://akhilrao.github.io/micro%20theory/2015/10/19/illegal-good-supply-passthrough/) are about markets where illegal things happen. This one is about a digital good that can be pirated.

The basic idea is: consumers can buy 1 unit of the good from the firm at price $$p$$, or for free at some chance $$ \theta \in (0,1) $$ of 0 payoff ("piracy and arrest"). The good can be reproduced at 0 marginal cost.

The setting is a version of [Linear City](http://akhilrao.github.io/micro%20theory/2015/09/28/hotelling-triangle-city/). There are three refinements on the standard Hotelling-on-a-line-of-length-1 setup here:

1. Consumers choose between buying at the firm, F, or getting the good for free from an illegal source T (like torrent sites). Getting the good for free comes with a probability $$ \theta $$ of 0 payoff. This is the risk of getting sued or arrested for illegally consuming the content.
2. The marginal cost of producing the good is 0. This is reasonable for digital goods, where the marginal cost is some $$\epsilon$$ very small.
3. The travel cost is directional: $$t^F$$ to get to the firm, and $$t^T$$ to get to the torrent. This is a crude way to capture the different user experiences of consuming a digital good through the firm or the torrent. No assumptions on the ordering of travel costs; they can even be equal, though that would defeat the point.

I'm assuming that the good is identical whether it's consumed from the firm or the torrent, so the value is a common $$v$$. 

### The marginal consumer

The marginal consumer is indifferent between buying the item legally from the firm and taking a risk to get the item for free illegally. Formally,

$$ \begin{align}
u( consume \ legally ) &= u( consume \ illegally ) \cr
v - p - t^F x &= (1- \theta)(v-t^T (1-x)) \cr
\implies x & = \frac{\theta v - p + t^T (1- \theta) }{t^F + t^T (1- \theta)} \cr
\end{align} $$

The expression $$ t^T (1 - \theta) $$ is "expected cost of surviving piracy". 

### The firm

Since the marginal cost is 0, the firm just maximizes price times demand.

$$ \begin{align}
\max_p ~~& p~[\frac{\theta v - p + t^T (1- \theta) }{t^F + t^T (1- \theta)}]  \cr
\text{FOC:}~ & \frac{\theta v - 2p + t^T (1- \theta) }{t^F + t^T (1- \theta)} = 0 \cr
\implies p & = \frac{1}{2} (\theta v + t^T (1- \theta))
\end{align}$$

Plugging the price back into the objective function, we get the firm's profit:

$$ \pi = \frac{ ( \theta v + t^T (1- \theta) )^2 }{4( t^F + t^T (1- \theta) )} $$

### Equilibrium analysis

The equilibrium of this problem is a triple of demand, price, and profit,

$$\begin{align}
x & = \frac{\theta v + t^T (1- \theta)}{2( t^F + t^T (1- \theta) )} \cr
p & = \frac{1}{2} (\theta v + t^T (1- \theta)) \cr
\pi &= \frac{ ( \theta v + t^T (1- \theta) )^2 }{4( t^F + t^T (1- \theta) )} \cr
\end{align}$$

As $$ \theta \to 1 $$, the equilibrium approaches the regular Hotelling monopoly equilibrium with zero marginal cost,

$$ x_{(\theta = 1)} = \frac{ v }{2 t^F  } , ~~ p_{(\theta = 1)} = \frac{v}{2}, ~~ \pi_{(\theta = 1)} = \frac{ v^2 }{4 t^F } $$

The equilibrium price is a combination of the monopoly price and the expected cost of surviving piracy. If $$ t^T \lt v $$ (as it necessarily-but-not-sufficiently should be if there is piracy), then the price with piracy is lower than the price if piracy isn't an option. 

The equilibrium demand is a combination of monopoly and duopoly demand expressed in terms of the expected cost of surviving piracy. I think this is because even though it's not another firm, with consumer demand being uniformly distributed the torrents act as a competitive force against the firm. I think for reasonable values of travel cost, the indifferent consumer is closer to the firm than they would be without piracy, or under a uniform-value duopoly, implying that the piracy option reduces the firm's marketshare (which makes sense).

The equilibrium profits are similarly a combination of monopoly and duopoly profits, with the latter expressed in terms of expected cost of surviving piracy. This is smaller than the monopoly profit. I'm not sure if it's smaller than the duopoly profit as well; probably depends on the value of $$ t^T (1- \theta) $$.

From the demand, we can see how much piracy vs legal purchasing is happening:

$$ \begin{align}
\text{Firm's marketshare:}~~ & x  = \frac{\theta v + t^T (1- \theta)}{2( t^F + t^T (1- \theta) )} \cr
\text{Piracy marketshare:}~~ & 1-x  = \frac{ 2 t^F + t^T (1- \theta) - \theta v}{2( t^F + t^T (1- \theta) )} \cr
\end{align} $$



Finally, we can find a restriction on $$ \theta $$ such that $$ x \lt 1 $$ (consumers always pirate):

$$ \implies ~ \theta \lt \frac{2t^F + t^T }{v + t^T } $$

This always holds when $$ v \lt 2t^F $$, since $$ \theta \lt 1 $$. If consumers don't value the good enough relative to the travel cost of legal purchase, they would accept any chance of arrest and pirate the good ($$ \lim_{\theta \to 1} (x) \lt 1 $$ ) .

### Summary

I really like the simplicity and flexibility of the Hotelling framework. There aren't too many parameters and they have nice interpretations. Finding an indifferent consumer and solving a firm's problem are some algebra, and the amount of algebra scales pretty fast with the model's complexity, but it's doable. The consumer's choice boils down to choosing between two options, which saves us from having to solve a consumer's problem. My professor said Hotelling is a "workhorse" model of IO, and I can see why.

I like the directional travel cost. User experiences matter, and I think this would probably be well-captured empirically by something like "minimum number of actions (clicks/keystrokes/swipes/etc) to accomplish this activity". These may be small in comparison to travel costs for physical goods, but I think it's the relative differences in travel costs that matter, not the absolute levels.

I guess the true minimum number of actions is 1 - program a button to execute that specific arbitrarily complex sequence of actions. Or 0 - the system automatically executes that action on a loop. Low reuse value though. So maybe "given default OS settings".

Some possible refinements:

1. Allow the value of the legal/illegal good to vary, maybe making them functions of some level of investment from the firm. Related, allowing the firm to influence $$t^T $$ through investment in DRM technologies. Individually, probably not too hard.

2. Make the risk likelihood a function of the quantity of illegal consumption. Probably not hard.

3. Modeling the firm's ability to influence the risk likelihood. This is from the observation that organizations like the RIAA/MPAA are able to increase the level of enforcement at some (low) cost. Probably not too hard. The likelihood could be indexed by the firm's choice of some index variable, like "effort" in the owner-manager problem.

4. Add multiple goods. I'm not sure how to do this but I feel like it's probably been done before and is therefore doable.

5. Model the content distribution network. I'm not sure how to do this. Maybe with some sufficient statistics of the network size/structure for the firm to do some enforcement. Not sure what those statistics would be or how that would work. The incentives of the CDN and its platform [may matter](https://gigaom.com/2011/02/18/pirate-economics-101-who%E2%80%99s-making-money-from-torrents/). Probably hard.

6. All of the above, allowing the risk likelihood to vary across CDNs that may have incentives which conflict with the firms' incentives. As hard as 1-5 + hard.

Some cursory Googling turns up [this paper](http://archive.nyu.edu/bitstream/2451/27797/2/CeDER-PP-2004-02.pdf), so far the only directly related result I've found for theoretical economic models of digital piracy. The model in this paper seems more like a hidden-action model than what I did here, but I haven't gone through it in detail yet.