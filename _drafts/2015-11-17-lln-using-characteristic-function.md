---
layout: post
title: Proof of a law of large numbers
category: probability theory
tags: probability-theory characteristic functions LLN convergence
year: 2015
month: 11
day: 17
published: true
summary: A proof of convergence in probability of a sequence of IID random variables using characteristic functions. A first moment is assumed to exist, but nothing else.
---

Usually, when we have a sequence of random variables, we can say things about the average of the sequence as we sample repeatedly by assuming things about the moments and the sampling process and then applying an appropriate law of large numbers. But how would we prove a law of large numbers?

Laws of large numbers are statements about averages of random variables converging in probability to a constant. In this example, we assume the existence of a finite first moment, assume random sampling with replacement (IID), and show that a sequence of averages of the IID random variables will converge to the first moment.

Let \\( \\{X_t\\}, ~ t=1,2,... \\) be the sequence of IID random variables on a probability space \\( ( \Omega, \mathcal{F}, P ) \\) with \\( E(X_t) = \mu \lt \infty \\). The goal is to show that 

$$ \lim_{n \to \infty} P \left( \omega : \left| \frac{1}{n} \sum_{t=1}^n X_t(\omega) - \mu \right| \gt \epsilon \right) = 0 $$

### Proof

Begin by defining \\( A_n \\) and its characteristic function:

$$\begin{align}
A_n & \equiv \frac{1}{n} \sum_{t=1}^n X_t \cr
\phi_{A_n}(s) & \equiv E(e^{isA_n }) \cr
\end{align}$$

By the properties of exponential functions and the fact that \\( X_t \\) is IID, we can write \\( \phi_{A_n}(\frac{s}{n}) \\) as

$$ \phi_{A_n}(s) =  ( \phi_{X_t} \left( \frac{s}{n} \right) )^n $$

By a theorem I may someday prove here but will now state without proof (Carlos' Theorem 129), we can approximate \\( \phi_{X_t}(\frac{s}{n}) \\) as

$$\begin{align}
 \phi_{X_t} \left(\frac{s}{n} \right) & = 1 + is \frac{\mu}{n} + \mathcal{O} \left(\frac{s^2}{n^2} \right) \cr
 \mathcal{O} \left(\frac{s^2}{n^2} \right) & \equiv i^2 \int_0^{\frac{x}{n}} \left(\frac{x}{n}-s \right) e^{is} ds \cr
\end{align}$$

\\( \mathcal{O}(\frac{s^2}{n^2}) \\) is the remainder from the approximation, the \\( \mathcal{O} \\) is [big O notation](https://en.wikipedia.org/wiki/Big_O_notation) that the remainder is bounded.

So now we have

$$ \phi_{A_n}(s) \approx \left( 1 + is \frac{\mu}{n} \right)^n $$

The trick is to use a binomial expansion here. In general,

$$ \begin{align}
\left( 1+ \frac{a}{n} \right)^n & = \sum_{j=0}^n \binom{n}{j} \left( \frac{a}{n} \right)^j \cr
\lim_{n \to \infty} \left( 1+ \frac{a}{n} \right)^n & = \sum_{j=0}^{\infty} \left( \frac{a^j}{j!} \right) \cr
& = e^a \cr
\end{align} $$

So, letting \\( a = is \mu \\),

$$\begin{align}
\phi_{A_n}(s) & = \left( 1 + is \frac{ \mu }{n} + \mathcal{O}(\frac{s^2}{n^2}) \right)^n \cr
 \lim_{n \to \infty} \phi_{A_n}(s) & = e^{is \mu } = \phi_{ \mu } (s) \cr
\end{align}$$

The remainder term \\( \mathcal{O} (\frac{s^2}{n^2} ) \to 0 \\) as \\(n \to \infty\\).

By the uniqueness of mapping between characteristic and distribution functions of random variables, \\( \lim_{n \to \infty} \phi_{A_n}(s) = \phi_{ \mu }(s) \\) implies \\( \lim_{n \to \infty} F_{A_n} = F_{ \mu } \\), where \\( F_{A_n} \\) and \\( F_{ \mu } \\) are the distribution functions of \\( A_n \\) and \\( \mu \\) respectively.

This is still only convergence in distribution, not convergence in probability. However, \\( \mu \\) is a constant, and convergence in distribution to the distribution of a constant is the same as convergence in probability to that constant (think of the constant's distribution as a point mass). So we have the desired result, \\( A_n \overset{p}{\to} \mu \\).

### Discussion

I'm not entirely sure how to interpret the parameter \\(s\\) for a general characteristic function. The characteristic function is just an exponential Fourier transform, and I would usually interpret that parameter as the "time index" for a given sequence I was Fourier transforming. I'm not sure if that interperetation is justified here, since each random variable is an IID draw from the same distribution. If I wanted to read a "time index" into this, it would be \\( t\\), which is the draw number. Maybe \\(s\\) is not very meaningful in this setting, so we can let it be whatever we want?

Anyway, the point of doing it this way is that sometimes a product of exponentials is easier to work with than some arbitrary sum. I should learn more about Fourier transforms and characteristic functions, they seem useful.