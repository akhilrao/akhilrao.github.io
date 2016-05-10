---
layout: post
title: An app for Coase bargaining
category: micro theory
tags: micro-theory axiomatic nash bargaining solution cooperative game theory coase app
year: 2016
month: 5
day: 11
published: true
summary: What if there was an app to facilitate Coase bargaining?
---

I came across an article today about ["how you know you're on a plane with an economist"](http://www.economist.com/blogs/buttonwood/2016/05/airline-safety?fsrc=scn%2Ftw%2Fte%2Fbl%2Fed%2F?fsrc=scn/fb/te/bl/ed/airlinesafetytenwaystotellyoumightbesittingnexttoaneconomist). The article's supposed to be a take on another recent news piece, about an economist getting pulled off a plane for doing math. I have a long flight coming up, and the article got me thinking about the problem of people reclining.

The person sitting in front of me on a long (8+ hours) flight has the right to recline their seat back. Now, I'm not a very tall person and I'm used to sitting for long stretches, so I am not too physically uncomfortable if the person in front of me reclines all the way. But I do like to read, write, and occasionally eat, so the lack of space in front of me is not ideal.

(Some airlines get around this by having seats in a fixed bucket, so that instead of actually reclining you just kinda slide forward in the bucket. I really don't like these; I think they're the worst of both worlds. You no longer have much space, and you can't even meaningfully recline. I'm ignoring this case here.)

The situation with the reclining seat seems like something the Coase theorem ought to apply to: we have a well-defined property right (person in front has right to recline) and an externality (reclining reduces my personal space), so maybe we can bargain our way to a better solution. This is such a straightforward idea, I'm sure it's been discussed elsewhere at length.

What I would like is an app to facilitate this bargaining. I think the app would do something like this:

1. Given two participating users, allow the users to define the property right and the externality in question. For example, "<Person \\(A\\)> has <the right to recline>, <person \\(B\\)> is negatively affected by <reclining> and would like to see if a welfare-improving bargain can be struck." (Suppose \\(B\\) is "she" and \\(A\\) is "he" for exposition.)

2. Users privately enter their maximum willingness-to-pay and minimum willingness-to-accept to reduce the externality. In the seat example, \\(A\\) would enter his minimum willingness-to-accept to not recline, and \\(B\\) would enter her maximum willingness-to-pay for \\(A\\) to not recline.

3. If the maximum WTP is greater than or equal to the minimum WTA, the app would suggest a price for \\(B\\) to pay \\(A\\) to not recline. The specific price can be determined by some "fair" division, like the Nash Bargaining Solution.

In the example above, the Nash Bargaining Solution would be a payment \\(p_B\\) from \\(B\\) to \\(A\\) that solves

$$ \max_{p_B} \ (p_B - WTA_A)(WTP_B - p_B) $$

where \\( WTA_A \\) and \\( WTP_B \\) are \\(A\\) and \\(B\\)'s minimum willingness-to-accept and maximum willingness-to-pay, respectively. The solution is

$$ p_B = \frac{WTP_B + WTA_A}{2} $$

i.e., with the NBS, if \\( WTP_B \geq WTA_A \\), \\(B\\) would pay \\(A\\) his minimum willingness-to-accept to not recline, plus half of her excess willingness-to-pay for \\(A\\) to not recline. This results in the surplus, \\( WTP_B - WTA_A \\), being evenly divided between \\(A\\) and \\(B\\).

The usual problem people cite with the Coase theorem in practice is that it gets hard to implement with more than a few people. It seems to me like a phone app could really make these transactions easier to do. I've described the two-person case above, but I reckon this could be extended to the \\(n\\)-person case using the Shapley value. I would be willing to pay $5 for an app that did this, possibly more if it was widely used.