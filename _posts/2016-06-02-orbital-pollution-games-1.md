---
layout: post
title: Orbital Pollution Games 1
category: micro theory
tags: micro-theory, environmental economics, pollution, externalities, common resource, game theory
year: 2016
month: 6
day: 2
published: false
summary: A model of a satellite orbit choice game with a debris externality.
---

This post is a model I wrote some time ago. It's a special case of a more general model I'm currently working on. Hopefully, the more general model will feature as a chapter of my dissertation, and this might be a subsection of that chapter. I think it's a sort of interesting model in its own right, even apart from the setting, since the debris accumulation gives it some neat transition dynamics.

The basic motivation is the "orbital debris" problem: as satellites are launched into orbit, there are some debris that accumulate and pose a threat to other objects in the orbital environment. There's a pretty big literature on this in the aerospace engineering and astrophyics communities, and the popular press has written about this as well. I hadn't seen much in economics on the subject, but evidently there is some work already done. [This](http://papers.ssrn.com/sol3/papers.cfm?abstract_id=2264915) paper looks at an optimal Pigouvian tax; [here](http://www.thespacereview.com/article/2093/1) is a good article on the setting; this reviews . 

The basic intuition is pretty straightforward and well-known in economics: pollution is a classic case of a negative externality; firms don't face the full cost of polluting the environment, and so they overproduce pollution relative to the socially optimum level. I'm not going to present the planner's solution here, but in the stylized* model I consider here, firms can coordinate to reduce the amount of debris produced.

*"stylized" here means "the physics are blatantly unrealistic, but let's go with it because it keeps things simple and tractable". The more general case I'm developing includes more realistic debris dynamics, but it's a complicated problem even for the engineers and physicists so I don't feel bad about my oversimplifications.

### Assumptions and notation

Consider an orbital environment with two orbits, high (H) and low (L). We can think of these as being orbital regions defined by spherical altitude shells, similar to the approach described in [Rossi et. al (1998)](http://www.sciencedirect.com/science/article/pii/S0032063398000701).