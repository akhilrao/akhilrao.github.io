---
layout: post
comments: true
title: Paper Review - "Earth Orbit Debris - An Economic Model"
category: micro theory
tags: micro-theory, environmental economics, pollution, externalities, common resource, game theory, salop circle, differentiated product, hotelling
year: 2016
month: 6
day: 21
published: true
summary: Review of a paper describing an economic model of orbital debris
---

Here I review Adilov, Alexander, and Cunningham's (hereafter AAC) 2013 paper, ["Earth Orbit Debris: An Economic Model"](http://papers.ssrn.com/sol3/papers.cfm?abstract_id=2264915). The paper was published in *Environmental and Resource Economics* in 2014 as ["An Economic Analysis of Earth Orbit Pollution"](http://link.springer.com/article/10.1007/s10640-013-9758-4). The published version seems very similar to the SSRN version, which is the version I read and what I describe here. At some point I intend to write a literature review for my own space debris project; hopefully this writeup will help me with that.

This is the first explicitly mathematical economic analysis of orbital debris production, at least as far as I am aware. Two other, earlier, papers that consider the economics of orbital debris are Weeden and Chow's ["Taking a common-pool resources approach to space sustainability: A framework and potential policies"](http://www.sciencedirect.com/science/article/pii/S0265964612000604) and Bradley and Wein's [Space debris: Assessing risk and responsibility](http://www.sciencedirect.com/science/article/pii/S0273117709001240). Both were published in space journals (Weeden and Chow in *Space Policy*, Bradley and Wein in *Advances in Space Research*). While both consider economic aspects of the space debris problem, neither takes a full-on "mathematical economics" approach to modeling the problem. Weeden and Chow focus more on the economics, drawing heavily on Ostrom's framework for managing CPR resources, while Bradley and Wein focus more on the physics, using their physical model to estimate the net present value of a debris-related collision. I'll write about both of these papers separately at a later date.

This paper has two main conclusions:

1. The decentralized equilibrium has firms launching too many satellites relative to what the central planner would launch, and under-investing in debris-mitigation technologies relative to what the central planner would invest. This is because firms don't internalize the costs of debris to other firms, resulting in a higher launch rate and a lower level of debris mitigation.
2. Firms can be made to internalize the costs of their actions with a Pigouvian tax on launches, which will bring the decentralized launch rate to the "optimal centralized launch rate".

Because this paper is fully theoretical with no calibration, the conclusions are qualitative in nature.

## The Model

AAC's model is a Salop circle (I've written about this as [Circle City](http://akhilrao.github.io/micro%20theory/2015/10/05/hotelling-circle-city.html)) with two periods. In the first period the orbital environment has no debris and firms simultaneously decide whether or not to launch a satellite. In the second period there is debris generated from the first period launches. Some satellites are destroyed by debris, but firms do not launch any new satellites in period 2; the ones with surviving satellites just choose a price and collect revenues.

The Salop framework lets AAC to capture product differentiation in the satellite market - e.g. GEO satellites for communications, LEO constellations for imaging, etc. Within this framework, they assume that firms are identical, and must pay a marginal cost per-satellite, a fixed launch cost, and a fixed per-period "maintenance cost". As an aside, the Circle City model is apparently not analytically solvable with heterogeneous firms.

The Circle City setup gives them a symmetric Bertrand-Nash equilibrium where firms price "satellite services" with a markup over marginal cost, even when they use free entry to get the zero-profit condition which gives them the number of firms per-period. Because AAC assume 1 firm per satellite, the number of firms entering the market gives them the launch rate.

The satellites are also homogeneous and generate the same amount of debris. AAC assume that each satellite has an equal probability of a catastrophic collision with debris, and that the destroyed satellites disappear.

In section 2.3, AAC consider the social planner's problem. To do this, they assume a consumer surplus function, and have the social planner maximize the discounted sum of expected profits and consumer surplus.

In section 2.5, AAC allow the firms to choose the debris creation rate \\( \phi \in [0, \phi_H] \\). The debris creation rate directly impacts the firm's launch cost \\(r = h(\phi)\\), where \\( h'(\phi) < 0\\) for \\(\phi<\phi_H, h'(\phi_H)=0, h''(\phi)>0\\) and \\(h(\phi_H)>0\\). In words, the launch cost is decreasing in the amount of debris produced at an increasing rate. The assumption of cost-minimizing behavior implies that firms will choose the highest rate of debris creation, \\(\phi_H\\), since they don't see an individual benefit from reducing debris creation rates.

## Discussion

The planner's solution gives AAC an optimum to compare the decentralized outcomes to, which lets them derive the Pigouvian tax on entry (launches) which would result in the socially optimal level of launches and debris creation. The decentralized outcome is suboptimal in the sense that it diverges from the planner's solution. Bradley and Wein take a different approach to estimating a fee on debris generation, by calculating the discounted expected value of a catastrophic collision and suggesting a fee that would be equal to that damage. This would not serve the same deterrent function as AAC's tax, but it isn't intended to - it's intended to give an estimate of the damage that debris could cause.

The firms in AAC's model are individually maximizing objective functions which have no allowance for consumer surplus generated by the lost satellites, so it doesn't surprise me that the firms will behave differently from how the planner would have them behave. More theoretically, I think the setup of the problem violates the First Welfare Theorem: since debris is not priced in any way even though it affects consumer welfare, it is natural that firms should produce "too much" debris.

The assumption of product differentiation through a Salop circle with homogeneous firms seemed clever to me at first, but now it seems weird. It seems to imply that satellite services are only differentiated in terms of consumer taste through the "travel cost" parameter \\(t\\). This is not true - imaging constellations in LEO provide a fundamentally different service than communications satellites in GEO. *Ceteris paribus* more telecom satellites in GEO shouldn't affect the price of images from LEO constellations, and vice versa. 

The assumption of a common probability of catastrophic collision with debris seems like a big simplification of the underlying orbital mechanics. In truth, orbital debris seems more like a directional externality to me - it only falls down to Earth, so a satellite already in GEO isn't affected by debris in LEO, though debris falling to Earth may pose a risk to constellations in LEO. Launching a satellite to GEO could be made more complicated by debris in LEO as well, though these are things I expect the engineers and physicists would work reduce as much as possible; as far as I'm aware this is what [conjunction analysis](http://ntrs.nasa.gov/archive/nasa/casi.ntrs.nasa.gov/20100005139.pdf) is about.

Additionally, a satellite's probability of collision depends on its size, which is a parameter firms have some control over. The recent move towards cubesats suggests to me that firms are able to reduce the probability that their satellite will get hit.
 
Bradley and Wein discuss the directional aspect of debris generation in their paper, where they consider debris generation in a single "spherical altitude shell" (the "Shell of Interest", or SOI). This mirrors the modeling approach taken in [Rossi et al.](http://www.sciencedirect.com/science/article/pii/S0032063398000701). Bradley and Wein argue that ignoring debris entering a SOI from a higher shell doesn't significantly affect the model results, though Rossi et al. include it in their paper and I think Liou et al. include this in their [three-dimensional LEO-to-GEO debris evolutionary model](http://www.sciencedirect.com/science/article/pii/S0273117704000705) as well. These papers also include end-of-life satellites as sources of debris, and allow destroyed satellites to generate debris. Both of these features are absent from AAC's model, but would probably not change the qualitative conclusions drawn.

In any case, the result of these two assumptions - homogenous satellite services differentiated through travel cost on the circle, and common probabilities of collisions with debris - seems to be a strong simplification of the satellite industry and orbital environment. The complexities introduced by weakening these assumptions might be distractions that don't change anything, or they might not. I think the orbital debris problem is interesting enough to warrant a paper or two that relax these assumptions. In particular, I would like to see how firms respond to specific orbital shells in LEO filling with debris. My guess is that the firms would either try to go to higher shells (above the debris + more coverage area) or lower shells (maybe they can't penetrate the debris in a higher shell/debris decays faster at lower altitudes and they decide to play nicer). Higher shells would result in increasingly bad pollution, while lower shells would result in some self-cleaning as the debris decayed.

I think AAC's general conclusion that there will be too many launches and too much debris relative to the social optimum may hold as presented for LEO, where many firms are looking to enter and firms are clustered in a relatively narrow altitude band (I think most LEO satellites are in between 800-1200 km, or thereabouts). I am skeptical that it will hold in the same way for GEO, where the congestibility of the resource is more apparent and the market mechanisms in place for spectrum allocation have led to a [slot allocation mechanism](http://space.stackexchange.com/questions/5943/who-what-is-the-international-authority-to-assign-refuse-orbit-to-a-satellite-sp). [Macauley 1994](http://www.rff.org/files/sharepoint/WorkImages/Download/RFF-DP-98-10.pdf) looks at the efficiency of this mechanism; this paper is on my reading list. 

In GEO, I expect the result to take the form of too little effort expended on end-of-life graveyard orbit policies. Indeed, though the Inter-Agency Space Debris Coordination Committee (IADC) laid out guidelines on acceptable re-orbiting altitude, it appears that [only a third of the GEO satellites that reached end-of-life complied](http://arc.aiaa.org/doi/abs/10.2514/6.IAC-04-IAA.5.12.4.05). My guess is that this is because of three reasons:

1. Some firms don't expect to launch another satellite to the same or a nearby slot, and so don't care if they leave a mess (myopic behavior)
2. Some firms would find it too costly to reduce the fuel allocated for stationkeeping (i.e., the lifetime of the satellite and the expected revenues from it) by allocating more fuel to end-of-life disposal (compliance too costly)
3. Some firms' satellites may have been non-responsive to the disposal command due to damage, or the firms did not anticipate the disposal requirement and were unable to send such a signal (error/nothing they could do)

I expect that policy could be effective at targeting 1 and 2, but not 3 (error). The possibility of 3 makes me think that some sort of active debris removal will be necessary even if firms and nations all act to minimize future debris and all existing debris magically disappeared.

Weeden and Chow anticipated the Pigouvian approach AAC espouse, and discuss the significant legal difficulties associated with implementing a Pigouvian tax like AAC describe. Basically, it's really unlikely that such a tax would be implemented globally, and if it was implemented only in a few countries firms would have an incentive to launch from countries without the tax. Weeden and Chow also suggest the possibility of cooperative orbital management arising, which I think would be really interesting to see formalized in a cooperative game theoretic framework. This possibility is absent from AAC's discussion of the problem and potential solutions.

The 2-period setting is probably fine for general conclusions, but I wonder how (or if) anything would change if the firms chose to launch each period for \\(T\\) periods, or whenever their satellites broke down. My guess is that it would depend on whether or not the firms have rational expectations. In general, I think that repeated games allow for better outcomes than one-shot games. Reputational incentives, coordination, things of that nature. I think a repeated game framework is a more realistic economic setting for this problem than a one-shot game.

I think the assumptions on \\(h(\phi)\\) may be a good approximation, but are probably not uniformly true. It might be cheaper for a firm to avoid some sources of debris, like paint on a satellite. In that case, asking firms to reduce those activities of debris might get good compliance. Other sources of debris, like launching a satellite into an orbit too high for debris to naturally decay quickly, might be harder to get compliance with since higher orbits have more coverage area over the Earth. 
I think firms might underinvest in debris mitigation technologies in general, but I'm skeptical that they would choose the highest level of debris creation or lowest level of mitigation. Proposition 3 derives this for profit-maximizing firms, but under a specific assumption about the cost of mitigation in a 2-period setting where firms only launch once. Rational expectations with launches over multiple periods in a longer horizon might change things.

In closing, I think that AAC's paper is a good contribution to the field of space debris. It brings environmental and mathematical economics firmly into the discussion of orbital debris management, though I didn't find the conclusions or intuitions it presented to be very novel. I also thought some of the assumptions were too strong, and glossed over interesting particulars of the problem. It seems to have published pretty decently and attracted some good attention, though, so there might be a market for more papers on the subject. I hope so.
