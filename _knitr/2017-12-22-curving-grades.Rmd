---
layout: post
title: A few ways to curve class grades
category: teaching
tags: grading, statistics, optimization
year: 2015
month: 11
day: 16
published: true
summary: Some ways I've used or considered using to curve grades in classes I teach
comments: True
---

I've been teaching an introductory math class for econ majors for the last two semesters. I curve the class scores so that the average is a B-, according to the university's recommended thresholds for letter grades. I like using those thresholds, but I have yet to write a test where the students get to a B- on their own. Maybe my tests are too hard; maybe I'm just inflating grades to reduce complaints. I'm working on writing tests that reveal abilities according to the letter grade thresholds (a subject for another post). In this post, I'd like to write down a few different curves I've used or seen used. 

I like curves that I can explain to students. Algebra and derivations are a big focus of my class, so I like it when I can have my students solve for the curve parameter(s) using just simple algebra and the class average. That way they can calculate their own post-curve grade before I post it. I'm not sure how many of them actually do, but they could...

### Notation

$x_i$ is an individual student's raw score, $\bar{x}$ is the average of the scores, the curved score is the output of a function $C(x_i,p)$, $p$ refers to a vector of parameters of the curve function. There are $n$ students, and the instructor wants the curved grades to be close to $\tau$. The maximum score achievable is normalized to $100$.

### A flat curve targeting a mean

A constant number of points added to each student's score is the simplest and most popular curve I've seen. Add $p$ points to each student's grade, until the class average is close to the desired level, $\tau$. Formally,
$$ C(x_i,p) = x_i + p ,$$
where $p$ is such that  
$$ \frac{1}{n} \sum_{i=1}^n C(x_i,p) = \tau .$$
Doing some algebra,
\begin{align}
\frac{1}{n} \sum_{i=1}^n (x_i + p) &= \tau \cr
\bar{x} + p &= \tau \cr
\implies p = \tau - \bar{x}
\end{align}

All the instructor needs to do with this curve is add the difference between the target and the class average to each student's score, and the average hits the target. Very easy to implement and communicate to students. Each student gets the same boost, and because the curve function is monotonic ranks aren't changed. One downside to this method is that students' scores can be pushed over $100$. If letter grades are awarded based on fixed thresholds, this means that some of the points may be ``wasted''. That is, some students at the top may get extra points that don't benefit them at the cost of students across the rest of the distribution who could have gotten a higher letter grade. In theory, an instructor who wanted to use a flat curve while avoiding wastage could do a round of curving, truncate the over-the-top scores to $100$, and repeat the curving until $p$ stops changing. I haven't seen anyone do the full process, just a single iteration.

I've received curves like this in my undergrad. I feel like my incentive to work hard was reduced in classes that curved like this. As long as I was above the average, I was usually sure I would get an A. As a teacher, I'd like it if my curve function distorted incentives as little as possible.

### A linear proportional curve targeting a mean

In this curve students are given back a proportion $p$ of the points they missed. I've been using this function lately. Formally,
$$ C(x_i,p) = x_i + (100-x_i)p .$$
If we're targeting the mean, $p$ is such that
\begin{align}
\frac{1}{n} \sum_{i=1}^n C(x_i,p)  &= \tau \cr
\frac{1}{n} \sum_{i=1}^n (x_i + (100-x_i)p)  &= \tau \cr
\frac{1}{n} \sum_{i=1}^n x_i + (100 -\frac{1}{n} \sum_{i=1}^n x_i )p  &= \tau \cr
\bar{x} + (100 - \bar{x} )p  &= \tau \cr
\implies p &= \frac{\tau - \bar{x}}{100 - \bar{x}}
\end{align}

This gives a more points back to students who did worse, but is still monotonic so ranks are preserved. It never goes over $100$, so no points are wasted. It's simple enough to implement and easy to communicate (``you get back a portion of what you missed''). 

I've never received this curve so I don't know how it feels on the receiving end. I think it preserves some incentives for students at the top to work hard, since they know their scores won't move much after the curve. By the same token, I can see it feeling unfair to students at the top. I do like not having to iterate or anything to avoid wastage.

### A least-squares curve that matches a mean and a median

In this curve the mean and median of the scores are brought as close as possible to some targets $\tau_{ave}$ and $\tau_{med}$.

This one came up recently in a conversation about a grading issue. My colleague was teaching a class with two TAs running recitation sections. At the end of the semester, the TA with the lower mean had the higher median (this is TA $1$, the other is TA $2$). My colleague wanted to find a way to match the recitation grades from the two TAs in some ``fair'' way. Using a flat curve to bring TA $1$'s mean up to TA $2$'s would have given an extra benefit to the students at the top of TA $2$'s class, while matching the medians seemed like it would end up boosting TA $2$'s average student that much higher.

I thought, ``why not use least squares to match both?'' Using the convention that TA $1$'s scores are being matched to TA $2$'s, denoting the $n_1$ students in TA $1$'s class by $x_{i1}$ and the $n_2$ students in TA $2$'s class by $x_{i2}$, and using a flat curve $$ C(x_i,p) = x_i + p$$, we define the sum of squared errors for the mean and median as
$$ \epsilon(\{x_i\},p) = \left(  \bar{C(x_{i1},p)} - \bar{x}_{i2} \right)^2 + \left( \hat{C(x_{i1},p)} - \hat{x}_{i2} \right)^2 $$

where $\bar{C(x_{i1},p)}$, $\hat{C(x_{i1},p)}$ are the mean and median of TA $1$'s curved scores, and $\bar{x_{i2}}$, $\hat{x_{i2}}$ are the mean and median of TA $2$'s raw scores (these are the $\tau_{ave}$ and $\tau_{med}$). The curve parameter $p$ minimizes the sum of squared errors,
$$ p = \text{argmin}_p \epsilon(\{x_i\},p) .$$

I've never done this in my own class, but I like the idea of matching more than one statistic of the distribution. If $p$ comes out negative, then the curve could be interpreted as points to add to TA $2$'s scores. If the instructor wants to emphasize the mean over the median (or vice versa), they could put weights in front of the squared error terms. I've heard of someone using GMM to set their mean and variance to some targets, but IIRC in that case the variance piece ended up not mattering. I didn't try to solve this one algebraically. Instead, I wrote a short R function (below) which uses `optim()` to solve for $p$ numerically. (I think J is TA 1, and N is TA 2, but it's been a while since I wrote this.)

```
curvefinder <- function(...){
  rawscores <- read.csv("rawscores.csv")
  
  # expects the first column to be J, second column to be N
  Jscores <- rawscores[,1]
  Nscores <- rawscores[,2]
  # removes NAs from N's column. NAs are created when read.csv() notices that J has more rows than N, and fills extra cells in N with NA so that both columns are the same length.  
  Nscores <- Nscores[!is.na(Nscores)]
  
  # calculates the curved mean for whichever column will be curved. x is the parameter vector.
  curvedmean <- function(x,scores) {
  	curved_scores <- scores+x # adds a flat curve - could try other functions, like score + (1-score)*x
  	newmean <- mean(curved_scores)
  	return(newmean)
  }
  
  # calculates the curved median for whichever column will be curved. x is the parameter vector.
  curvedmedian <- function(x,scores) {
  	curved_scores <- scores+x # flat curve
  	newmedian <- median(curved_scores)
  	return(newmedian)
  }
  
  # calculates the sum of squared errors between the curved column and the target column. x is the parameter vector.
  sse <- function(x,Jscores,Nscores) {
  	error <- (curvedmean(x,Jscores) - mean(Nscores))^2 + (curvedmedian(x,Jscores) - median(Nscores))^2
  	return(error)
  }
  
  # solves for a curve parameter (or parameter vector) by nonlinear least squares
  optim(0.001, sse, Jscores=Jscores, Nscores=Nscores, lower=0, method="L-BFGS-B")
}

```

I like that different curve functions could be used easily, and that the code can reduce to any other single-statistic-targeting curve I can think of. I suppose it'd be easy enough to explain this version's flat curve to students, but it might be harder to explain where $p$ comes from for any version.

### Conclusion

- There is always some arbitrariness in curving, if only in the selection of curve.
- Curving is useful when the test is poorly calibrated to student ability. I struggle with this calibration.
- "Fairness" seems like an intuitively desirable concept without a clear definition. Monotonicity seems fair, but beyond that... is wastage fair or unfair? I tend to think it is unfair, but I recognize that that's an opinion and not a result. The fairness of monotonicity seems less disputable, but I'm open to hearing arguments against it. This leads me to favor the linear proportional curve or the least-squares curves.
- Transparency seems important to me, if only from a "customer relations" standpoint. I want my students to be able to understand how the curve works and why it's being used, so that they can better assess their own abilities. This leads me to avoid the least-squares curves, at least for the class I teach where students are not as familiar with least-squares. Maybe transparency isn't the word - maybe it's better expressed as "explainability" or "intuitiveness". What is explainable or intuitive will depend on the audience, so there can't really be an eternal answer to "what is maximally explainable/intuitive?"
- I like the linear proportional curve targeting a mean, and usually use that. Since I usually teach a math class, I spend some time explaining the function and its properties. There are worksheet exercises to drive some of these points home. Obviously, this isn't appropriate for every class.
