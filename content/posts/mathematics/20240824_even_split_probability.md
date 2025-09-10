---
date: 2024-08-24
title: An Even Split in Probability
weight: 10
math: true
tags: ["probability"]
categories: "mathematics"
---

This is a generalisation of Q18 from *50 Challenging Problems in Probability*.

{{< question >}}
When $n$ coins are tossed, what is the probability that exactly $k$ are heads?
{{< /question >}}

Assume first that we have a fair coin, and thus the probability of getting a heads or a tails is $1/2$.
Let $X_n(\omega) = (t_1(\omega),\dots,t_n(\omega))$ denote a possible realisation of a sequence of $n$ coin tosses from a random sampling $\omega$ from the space of all possible random samplings $\Omega$. Then, we wish to determine
$$
P(\#X_n(\omega) = k) = \sum_{\substack{\omega\in\Omega \\ \#X_n(\omega) = k}} P(X_n(\omega)).
$$
Since the coin is fair, the probability of getting any number of heads, say $k$, followed by $n-k$ tails is exactly $(1/2)^k (1/2)^{n-k} = (1/2)^n$. Therefore
$$
P(\#X_n(\omega) = k) = \left|\{\omega \in \Omega : \#X_n(\omega) = k\}\right| \left(\frac{1}{2}\right)^n,
$$
and thus is dependent purely on the number of ways in which we can obtain exactly $k$ heads out of $n$ tosses, which is precisely $n \choose k$.
Therefore
$$
P(\#X_n(\omega) = k) = {n \choose k} \left(\frac{1}{2}\right)^n.
$$

