---
layout: post
title: A simple labor market with two types of workers and a test
category: micro theory
tags: micro-theory labor market signalling static private information
year: 2015
month: 10
day: 06
published: true
summary: A static model of a labor market with private information with two two types of workers. What happens if a test reveals a worker's type?
---

Consider a competitive labor market where workers are either high ability ("high type") or low ability ("low type"). A worker's type is the worker's private information, but the firms are aware that a fraction \\(\alpha \in (0,1)\\) of the workers have high ability. The high ability worker will produce value \\(v=v_h\\) for the firm, and the low type will produce \\(v=v_l\\), where \\(0\le v_l\lt v_h\lt\infty\\). The worker's can produce \\(r\lt v_h\\) if they are self-employed (reservation wage).

#### Benchmark case: No signalling

If there's no way for the worker to signal their type to the firm, then the firm will go with what it knows: that the probability of a worker having high ability is \\(alpha\\). Using this, we get that the firm's expectation of the workers' ability is \\(E[v]=\alpha v_h + (1-\alpha) v_l\\).

A [competitive equilibrium](https://en.wikipedia.org/wiki/Competitive_equilibrium) can be described be a price \\(w^\*(\theta)\\) and an allocation \\(\theta^\*(w)\\) which maximize the agents' expected utilities. Here, the CE is

$$\begin{align}
w^\*(\theta)=E \ [ \ \theta \ | \ \theta \in \theta^\*] \cr
\theta^\*(w)= \\{ \theta \ : \ r \le w \\}
\end{align}$$

The firm will pay workers the expected value of their marginal productivity, which ends up being a constant. The workers will work if the wage is greater than or equal to what they could get staying at home. If the workers' reservation wage is greater than the firm's wage (expected marginal productivity of labor), no one will work. If \\(r<w=E[v]\\), everyone will work.

#### With a costly test that signals types

Now suppose there's a test that workers can take, and it's easier for high types to get a certain score than it is for low types. By observing the score that workers get on the test, firms can guess whether a worker is high ability or not. Formally,

$$c(e,\theta)=
\begin{cases}
c_{h}e ~~~ \text{if} ~ \theta=v_h \cr
c_{l}e ~~~ \text{if} ~ \theta=v_l
\end{cases}$$

where \\(0\lt c_h\lt c_l\\). Preparing for and taking the test is useless except that it is costlier for the low type, and can be used to distinguish between the types.

The equilibrium concept we use here is a Perfect Bayesian Equilibrium ([PBE](https://en.wikipedia.org/wiki/Bayesian_game#Perfect_Bayesian_equilibrium). The worker's choice of test score is optimal given their knowledge of their type, the firm's beliefs of the worker's type after observing their test score \\(\mu(e)\\) is formed using Bayes' Rule, and the wage \\(w(e)\\) is a Nash equilibrium for \\(e(\theta)\\) given the firm's beliefs \\(\mu(e)\\).

One separating PBE that we can construct is \\(w^\*(e^\*(v_h)) = v_h\\) and \\(w^\*(e\^*(v_l)) = v_l\\), \\(e^\*(v_l)=0\\), and \\(e^\*(v_h)=\tilde{e}\\), where \\(\tilde{e}\\) is the least education the high type can get while still getting utility at least as high as if they pooled with the low type. 

The argument for this is pretty simple. If the high type can signal their ability, there's no point in the low type scoring above 0 on the test - effort is costly. If the firm can distinguish high and low types, then they will pay each their marginal product.

The most efficient separating PBE is when the high type engages in as little signalling behavior as possible. This occurs when the high type's education level makes them indifferent between being employed and pooling with the low type. Letting \\(c_l(e)=c(e,v_l)\\) and \\(c_h(e)=c(e,v_h)\\),

$$\begin{align}
e^\*(v_h):&~~ v_h - c_l (e^\*(v_h)) = v_l \cr
\implies &~ c_l (e^\*(v_h)) = v_h-v_l \cr
\implies &~ e^\*(v_h) = c_l^{-1}(v_h-v_l) \equiv \tilde{e} \cr
\end{align}$$

The full PBE is

$$ e^\*(\theta) =
\begin{cases}
0 ~~ \text{if} ~~ \theta=v_l\cr
\tilde{e} ~~ \text{if} ~~ \theta=v_h\cr
\end{cases} $$

$$ \mu^\*(e) =
\begin{cases}
0 ~~ \text{if} ~~ e \lt \tilde{e}\cr
1 ~~ \text{if} ~~ e \ge \tilde{e}\cr
\end{cases} $$

$$ w^\*(e) =
\begin{cases}
v_l ~~ \text{if} ~~ \theta=v_l\cr
v_h ~~ \text{if} ~~ \theta=v_h\cr
\end{cases} $$

This is not a unique equilibrium. There are a continuum of separating PBEs that are less efficient than this one, and a continuum of pooling PBEs with one more efficient than the rest. Whether the most efficient separating PBE is more efficient than the most efficient pooling PBE depends on the parameter values.