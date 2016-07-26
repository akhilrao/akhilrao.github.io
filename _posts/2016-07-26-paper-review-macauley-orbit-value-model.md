---
layout: post
title: Paper review - "Allocation of Orbit and Spectrum Resources for Regional Communications - What's at Stake?"
category: micro theory
tags: micro theory, resource economics, law and economics
year: 2016
month: 07
day: 26
published: true
summary: I review Molly Macauley's (1998) paper about GEO and spectrum allocation.
---

Here I review Molly Macauley's 1998 paper, ["Allocation of Orbit and Spectrum Resources for Regional Communications: What's at Stake?"](http://www.journals.uchicago.edu/doi/10.1086/467411), published in *The Journal of Law and Economics*.

Molly Macauley [recently died](https://www.washingtonpost.com/local/obituaries/molly-k-macauley-researcher-on-economics-and-space-science-dies-at-59/2016/07/20/b3d309c4-4dd9-11e6-aa14-e0c1087f7583_story.html) in Baltimore. It seems like Dr. Macauley has written something insightful and policy-relevant on most, if not all, of the important issues in space economics today. I have found her work to be tremendously inspirational and a useful practical guide in thinking about questions in space economics. I didn't know her personally, and I am sad that I never will. Here is a tribute page, [*Remembering Molly*](http://www.rff.org/blog/2016/remembering-molly).

## What's this paper about?

This paper is about the values of slots in geostationary orbits (GEO) and the potential gains from improving GEO slot use regulations. The paper has two main goals:

1. Develop and estimate an economic model of orbits with locational attributes. The point of this is to calculate the savings of using satellites to meet telecom demand vs. using the "best terrestrial alternative" to meet the same telecome demand. Caveat: The values derived here are not equilibrium values, rather upper bounds on the maximum willingness-to-pay of countries for having satellites in preferred orbital locations.

2. Model and estimate the effects of technological substitution possibilities which would allow orbit users to "economize on the amount of orbit used at any given location", for example by giving satellites more complex antennae to use allocated spectrum bandwidths more intensively at "prime" orbital locations. Macauley's argument is that allocating orbits administratively shields users from facing the true costs of that orbit (the value to other users), which reduces the incentive to use orbits more intensively.

In writing the model, Macauley is drawing on urban economics models of spatial location. A quote from the paper illustrates the argument:

>> "...just as land values increase with proximity to a central business district as commuting and other transportation costs fall, orbit values might be expected to increase at locations that afford the best communications-demand-related coverage...just as an increase in land values leads to substitution toward capital and away from land...so too might an increase in orbit values lead to more capital intensive use of the orbit at preferred locations."

So in the same way that urban land users in downtown areas use land more intensively (taller buildings) than users in the suburbs (flatter buildings and more sprawl), orbit users have incentives to use prime orbits more intensively (more spectrum use per unit of orbit) than users in non-prime locations. 

If spectrum congestion weren't an issue, GEO spacing could be minimum physical safe distance (40 miles or so). To guard against spectrum congestion, regulators mandate separations of 800-1600+ miles. If satellites were closer together, they could
1. communicate at different frequencies, or
2. be situated at noninterfering distances from other satellites communicating at the same frequency, or
3. coordinate the timing of their signal emissions to not interfere (this is apparently practiced by terrestrial spectrum users)

Regulators are concerned with spectrum congestion, but the regulations in place reduce orbit users' need to use orbit more intensively with these types of spectrum use techniques.

It's worth noting that there aren't well-defined property rights for electromagnetic spectrum in orbit. Macauley cites a number of studies on the problems this causes, including [Jackson (1978)](http://www.sciencedirect.com/science/article/pii/0308596178900228), [Levin (1981)](http://www.sciencedirect.com/science/article/pii/0308596181900525), [Levin (1985)](http://www.sciencedirect.com/science/article/pii/0308596185900369), [Levin (1990)](http://www.sciencedirect.com/science/article/pii/030859619090043Q). Some googling turns up other helpful writings on the issue of property rights in space, like this [AEI article by Macauley and Paul R. Portney](https://www.aei.org/publication/slicing-the-geostationary-pie-property-rights-in-orbit/print/) and this [ITU report on economic aspects of spectrum management](https://www.itu.int/dms_pub/itu-r/opb/rep/R-REP-SM.2012-4-2014-PDF-E.pdf). [Macauley (1986)](http://www.jstor.org/stable/1818780) also discusses the issue of spectrum regulation as it relates to communications satellites.

There is a substantial economic literature on spectrum allocation in general which I won't discuss here. [This paper review](http://www.acma.gov.au/~/media/mediacomms/Research%20library%20reports%20old/pdf/Economics%20of%20spectrum%20management%20pdf.pdf) seems like a good place to start thinking about potential contributions. In general GEO and spectrum use for telecom purposes had been studied quite a bit by economists when Macauley wrote this paper.

GEO slot use is tightly linked to electromagnetic spectrum use in orbit. Satellite use thus suffers from at least two market failures: one caused by misallocation of orbital slots, and one caused by misallocation of spectrum. These issues are fundamentally tied to the common-pool resource nature of orbital slots and spectrum.

## Models and data

> The market for satellite-related services ultimately determines the derived demand for a location in the orbit.

Macauley builds two related models in this paper, the second a generalization of the first. The first assumes that orbits and spectrum are used in fixed proportions. I understand this to mean "spectrum use must be the same at any location in GEO". The second relaxes this assumption by allowing orbit and spectrum to be substitutable inputs in a Cobb-Douglas production function for satellite services. The first case corresponds to a Cobb-Douglas production function with equal exponents for orbit and spectrum.

In both models, the telecom service provider has a choice between using satellite or terrestrial technologies to meet the exogenous telecom service demand between country pairs $$jk$$. The advantage of using satellites is that they can cheaply connect any two countries $$j$$ and $$k$$ within the satellite's Field of View (FOV). Terrestrial technologies are affected by the distance between $$j$$ and $$k$$ and require signal repeaters.

Macauley describes how FOV is determined at each location in the beginning of the paper. I will not discuss it here.

### Fixed proportions

This model provides the foundation for the analysis in this paper. It is a simulation model of a cost-minimizing telecom service producer's choice of service provision technology. The equations which define the model are

*Terrestrial technologies*
$$\begin{align}
Q_i &= Q(H_i) \cr
C_{ijk} &= C_i(Q_{jk},Z_{jk}, \delta_i(\bar{Q}_i))
\end{align}$$

where $$Q()$$ represents the output of communications services, and $$C()$$ represents the cost of the technology in use. 

$$i = 1, \dots, m$$ indexes the potential terrestrial technologies which could connect country pairs $$jk$$; $$H_i$$ represents the hardware which forms the connection and associated costs (e.g. coastal landing rights for undersea cable, overland rights of way for terrestrial cable); $$Z_{jk}$$ represents the distance between countries $$j$$ and $$k$$.

*Satellites*
$$\begin{align}
Q_s &= Q(A, S, H_s) \cr
C_{sjk} &= C_s(Q_{jk}, \delta_s(\bar{Q}_s); L_1, \dots, L_{\tau}) \text{ for } (j,k) \in FOV
\end{align}$$

where $$A$$ represents an orbital slot, $$S$$ represents spectrum, and $$H_s$$ represents the satellite hardware and associated costs (including launch costs); $$L_1, \dots, L_{\tau}$$ represent the exogenously-given possible orbital locations indexed $$1 - \tau$$.

*Demand and indivisibilities*
$$\begin{align}
\delta(\bar{Q}) &= \sum_{j=1}^{n-1} \sum_{k=j+1}^{n} Q_{jk}, ~~0< \delta \leq 1 \cr
Q_{jk}^D \leq \bar{Q}_{jk}
\end{align}$$

$$bar{Q}$$ represents the exogenously-given total quantity of communications demand for the set of $$n$$ countries that want to be connected. $$\delta(\bar{Q})$$ reflects individibilities in the various technologies when they operate as a system; I interpret this as meaning that these capacity investments are discrete and not continuous in nature, so that the system's installed capacity will typically exceed demand on a single country-pair route.  I am not sure what "$$0< \delta \leq 1 $$" refers to - maybe there's a typo where a $$\delta$$ exponent is missing?
$$Q_{jk}^D$$ measures the "busy hour" traffic between $$j$$ and $$k$$, and implies a constraint on the facilities - they must be able to serve this demand at an acceptable degree of service (i.e. low probability of receiving a busy signal).

This setup lets Macauley calculate the cost savings from using satellites over terrestrial technology as

$$\begin{align}
min TC(L_i) &= \sum_{j=1}^{n-1} \sum_{k=j+1}^{n} C_{jk} (Q; \delta, z, L_i) \cr
R(L_i) &= TC(L_i) - TC(L_x)
\end{align}$$

where $$TC()$$ represents the total cost to serve $$n$$ countries that want to be connected using a satellite located at location $$L_i$$. $$L_x$$ represents the next-best available orbital slot that could connect those $$n$$ countries. $$R(L_i)$$ represents the cost savings of using the most-preferred orbital slot for a set of countries in a region. The outside option of not using satellite technology to connect $$n$$ countries is represented by $$R(L_i) = R(L_i) - R(L_i) = 0$$.

The phrase "prime orbit location" refers to the orbit location with a maximum value for a specific nation. I am thinking about it as the GEO location above a country which puts the most important countries it communicates with in the satellite's FOV, i.e. a satellite in prime location for country $$j$$ maximizes the value of communications between $$j$$ and the countries it wishes to communicate with, $$\{k\}$$. In South America, this definition maps "prime locations" to "locations which cover the most other countries $$k$$". In North America, population density and communications patterns break this mapping. For example, site values in the Pacific Rim are high when just Canada and the US are in view, excluding many of the other PacRim countries.

### Variable proportions

The supply and demand equations for the variable proportions model are
$$\begin{align}
X_s(u) &= DA(u)^{\alpha}S(u)^{1-\alpha} \cr
X_d(u) &= \beta y^{\theta_1} p(u)^{\theta_2}
\end{align}$$

where $$D$$ is a scale parameter, $$A$$ and $$S$$ are quantities of orbit and spectrum, $$\alpha \in (0,1)$$ is the Cobb-Douglas exponent; $$\beta$$ is a scale parameter, $$y$$ is income, $$p$$ is price, and $$\theta_1$$ and $$\theta_2$$ are the income and price elasticities respectively. $$u$$ measures the satellite location relative to prime locations.

This model also has an equation for locational equilibrium, as
$$ p'(u) X_d(u) = -t(u) $$

where $$t(u)$$ represents the marginal cost of connecting cities outside the view of a satellite at location $$u$$, i.e. the extra costs incurred to get to the edge of the satellite's FOV.
Macauley estimates $$t(u)$$ using Mathematica to fit a polynomial of the form
$$ t(u) = \gamma \frac{e^{(u - \bar{u})/\sigma}}{1 + e^{(u - \bar{u})/\sigma}} $$

where $$ u - \bar{u}$$ measures distance in longitudinal degrees at $$u$$ from the prime orbit location, $$\bar{u}$$.

These equations allow Macauley to derive an equation for orbital slot value (derivation in Appendix B). It's a complicated equation which I won't describe here.

### Data

The models are estimated using data obtained from engineering estimates (for the technology) and trade publications (for volume and value of calls). Macauley states that demand estimates are an order-of-magnitude proxy only. The data are described in Appendix A.

## Discussion

Macauley's stated purpose in writing this paper was to figure out the potential gains from allowing more flexible orbit/spectrum use patterns. This is not what my current space economics project is about; I am looking at a general model of orbit choice and debris production. This model is specifically designed for telecommunications satellites in GEO, while the model I am writing is valid for any type of satellite in any not-too-elliptical orbital regime (with a focus on LEO).

However, I had not thought seriously about spectrum use prior to reading this paper. Now it seems obvious to me that most satellite applications require not only an orbital slot (or path) but also some electromagnetic spectrum. An imaging satellite which requires images to be physically retrieved from it is not very useful. I suppose tourist shuttles that take people to LEO and back down have less need for spectrum, but they would still need to be able to coordinate with ground-based observers and other satellites to ensure a safe trip.

The question before me now is, how relevant is spectrum use to my applications? I think it's probably of second-order importance to modeling debris production from satellite operations outside GEO (say, in LEO), but might be of first-order importance in GEO. I was on the fence about incorporating locational attributes of orbital slots/paths in a general sort of way, but now I think those attributes are an important feature.

Back to this paper: Macauley points out that the Cobb-Douglas form is restrictive, and defends the use of this functional form in two ways:

1. by appealing to some anecdotal engineering about the use of orbit and spectrum. The Cobb-Douglas form's restrictions implies that the ratio of input use be proportional to the ratio of factor prices. On the basis of published operating parameters, satellites in prime locations use a unit of orbit 7-10 times more intensively than in non-prime locations, through techniques like spectrum re-use. The orbit values she estimates with the first model imply values of prime locations that are approximately 10 times larger than in non-prime locations. So the Cobb-Douglas form may not be too bad an approximation in this setting.
2. by pointing out that data are unavailable to estimate all the parameters of a more flexible functional form.

The satellite spacing policy seems pretty bad in an "unintended consequences" way: policy intended to minimize spectrum congestion ends up obstructing the development of policies and technologies that could mitigate congestion. It's possible this spacing leads to more congestion in this equilibrium than there would be if the spacing regulations were relaxed, but I don't know if that's the case. Regardless, Macauley's argument for deadweight loss from the current intensity-limiting policy seems solid.

I'd like to write a paper about GEO use specifically; estimating this model with more data, or extending this model, might be good places to start. 

Overall I really liked this paper. I thought it was insightful, well researched and thought through, and very helpful for someone getting started in this area.