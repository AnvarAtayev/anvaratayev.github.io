---
date: "2025-11-06"
math: true
refs: 
  - "KellyJr.1956"
  - "Ferguson2009"
  - "Thorp2006"
  - "VonNeumann2007"
  - "MacLean2010"
title: "The Kelly Criterion"
tags: ["mathematics", "finance"]
categories: ["mathematics"]
summary: "A summary of the Kelly Criterion and the optimal sizing of bets for maximal expected logarithmic returns."
---


This is a short summary of the Kelly Criterion, initially developed by J. 
Kelly Jr. in their 1956 manuscript {{< cite "KellyJr.1956" >}}, which 
describes the optimal way in which to size bets as to obtain the greatest 
expected logarithmic returns in a betting game. Plenty of further reading is 
available on this topic, one useful resource is {{< cite 
"Ferguson2009" >}}, which is a short article on the Kelly Criterion from a 
course taught by T. Ferguson of UCLA in 2009. Ferguson also has a number of 
other interesting articles on his webpage, which you can find 
[here](https://www.math.ucla.edu/~tom/). There also exist a plethora of other 
articles from the famous E. Thorp on the matter, see for example {{< cite 
"Thorp2006" >}}. Note, for brevity, the notation used here aims to remain 
consistent with that of Thorp and Ferguson.

## The Game

Suppose you are asked to play a betting game where you undergo repeated trials 
against an infinitely wealthy opponent who will wager even-money bets. Suppose 
further that on each trial, you have a probability of winning of $p > 
\frac{1}{2}$, and of losing, $q := 1 - p$.

Let $X_{0}$ denote your initial wealth, and $X_{k}$ your wealth after the 
$k$th trial. Denote by $0 \leqslant B_{k} \leqslant X_{k - 1}$ the bet made on 
the $k$th trial (we can assume that this is either deterministic or random). 
If you win the $k$th trial, your wealth increases to $X_{k - 1} + B_{k}$ and 
$X_{k - 1} - B_{k}$ if you lose, i.e.

$$
\begin{eqnarray}
  X_{k} & = & \left\lbrace\begin{array}{ll}
    X_{k - 1} + B_{k} & \text{with probability } p,\\
    X_{k - 1} - B_{k} & \text{with probability } q = 1 - p.
  \end{array}\right. \nonumber
\end{eqnarray}
$$

Letting $T_{k} = + 1$ if the $k$th trial is won, and $T_{k} = - 1$ otherwise, 
we can simplify and instead write

$$
\begin{eqnarray}
  X_{k} & = & X_{k - 1} + T_{k} B_{k}, \nonumber
\end{eqnarray}
$$

where $T_{k}$ is a Bernoulli random variable with success $p$, i.e. $T_{k} 
\sim \operatorname{Bernoilli} (p)$, and each $T_{k}$ is i.i.d. for $k \in 
\mathbb{N}$. Recursively expanding, and unravelling, we can further simplify 
the expression for our wealth after the $k$th trail to

$$
\begin{eqnarray}
  X_{k} & = & X_{0} + \sum_{i = 1}^k T_{i} B_{i} . \nonumber
\end{eqnarray}
$$

## Maximising Wealth After $k$ Trials

The question we now ask ourselves is, how can we best maximise our wealth, in 
whatever manner we mean best.

From a naïve point of view, a gambler will aim to determine how to size bets 
$B_{i}$ to maximise $\mathbb{E} (X_{k})$ given knowledge of the outcome of the 
previous bets. Indeed, doing so, we see that

$$
\begin{eqnarray}
  \mathbb{E} (X_{k}) & = & X_{0} + \sum_{i = 1}^k \mathbb{E} (T_{i} B_{i}) .
  \nonumber
\end{eqnarray}
$$

Expanding by the law of total expectation, and using the fact that $\mathbb{P} 
(T_{i} = + 1) = p, \mathbb{P} (T_{i} = - 1) = q$,

$$
\begin{eqnarray}
  \mathbb{E} (X_{k}) & = & X_{0} + \sum_{i = 1}^k (p - q) \mathbb{E} (B_{i}) .
  \nonumber
\end{eqnarray}
$$

Since $p > \frac{1}{2}$, we have $p - q > 0$, therefore to maximise 
$\mathbb{E} (X_{k})$, we are simply required to maximise $\mathbb{E} (B_{i})$ 
for each $i = 1, \ldots, k$. As $0 \leqslant \mathbb{E} (B_{i}) \leqslant \max 
B_{i} = X_{i - 1}$, one can maximise $\mathbb{E} (B_{i})$ by simply (in a 
deterministic manner) setting $B_{i} = X_{i - 1}$ for each $i = 1, \ldots, k$. 
That is, the optimal strategy to maximise *expected total wealth* $\mathbb{E} 
(X_{k})$ at stage $k$, is to simply wager your whole fortune at each trial.

In doing so, in $k$ trials, you will amass a wealth of

$$
\begin{eqnarray}
  X_{k} & = & \left\lbrace\begin{array}{ll}
    2^k X_{0} & \text{with probability } p^k,\\
    0 & \text{with probability } 1 - p^k,
  \end{array}\right. \nonumber
\end{eqnarray}
$$

with $\mathbb{E} (X_{k}) = (2 p)^k X_{0}$. Note that the probability of ruin, 
$1 - p^k$, quickly tends to one as $k \rightarrow \infty$. Although this is a 
strategy that generates the greatest expected wealth, it is not a sensible 
strategy, as that wealth is not probable and chance of ruin is high.

Indeed, calculating the variance of your wealth with this strategy, we find 
that for any $k \in \mathbb{N}$

$$
\begin{eqnarray}
  \mathbb{V} (X_{k}) & = & X_{0}^2 (4 p)^k (1 - p^k) . \nonumber
\end{eqnarray}
$$

In particular, as $p > \frac{1}{2}$, $4 p > 2$, and as $p < 1$, 
$p^k \rightarrow 0$ as $k \rightarrow \infty$, therefore $\mathbb{V} (X_{k})$ 
grows at least as fast as $X_{0}^2 2^k$ as $k \rightarrow \infty$, which is 
exponentially fast, i.e. the strategy is not very stable.

One other metric that is interesting to calculate is the Sharpe of this 
strategy. Define by $R_{i} := \frac{X_{i} - X_{i - 1}}{X_{i - 1}}$ for $i = 1, 
\ldots, k$, the returns of this strategy after stage $i$. Then, using $B_{i} = 
X_{i - 1}$,

$$
\begin{eqnarray}
  R_{i} & = & \frac{X_{i - 1} + T_{i} X_{i - 1} - X_{i - 1}}{X_{i - 1}} =
  T_{i} \nonumber
\end{eqnarray}
$$

Since, for each $i = 1, \ldots, k$, $T_{i} \sim \operatorname{Bernoilli} (p)$, 
and is i.i.d., we have that

$$
\begin{eqnarray}
  \mathbb{E} (R_{i}) & = & p - q = 2 p - 1, \nonumber\\
  \mathbb{E} (R_{i}^2) & = & p + q = 1, \nonumber\\
  \mathbb{V} (R_{i}) & = & \mathbb{E} (R_{i}^2) -\mathbb{E} (R_{i})^2 = 4 p (1 - p), \nonumber
\end{eqnarray}
$$

and in particular the Sharpe ratio for this strategy is

$$
\begin{eqnarray}
  \operatorname{Sharpe} (R_{i}) & = & \frac{\mathbb{E}
  (R_{i})}{\sqrt{\mathbb{V} (R_{i})}} = \frac{2 p - 1}{2 \sqrt{p (1 - p)}}
  \nonumber
\end{eqnarray}
$$

which is positive for $p > \frac{1}{2}$, approaches infinity as $p 
\rightarrow + 1$ and zero as $p \rightarrow \frac{1}{2}$. Surprisingly, this 
strategy has a relatively high Sharpe for $p$ just above $0.5$.

## Avoiding Ruin

To avoid ruin, that is seeing your wealth $X_{k}$ go to zero, we can instead 
opt for a slightly modified strategy, where we restrict $0 \leqslant B_{k} 
< X_{k - 1}$, and take a proportional approach and never invest our whole 
wealth (note that, although this avoids complete ruin, it does not avoid 
asymptotic ruin, i.e. there exists $k \in \mathbb{N}$ such that $\mathbb{P} 
(X_{k} < \varepsilon)$ for any $\varepsilon > 0$, for which there are 
other results). For brevity, write $B_{k} := \pi (p) X_{k - 1}$ for $k \in 
\mathbb{N}$ for some $\pi : [0, 1] \rightarrow [0, 1)$ yet to be determined. 
Then, we can write

$$
\begin{eqnarray}
  X_{k} & = & X_{0} + \sum_{i = 1}^k T_{i} B_{i} . \nonumber\\\
  & = & X_{0} (1 + \pi)^{\sharp (T_{i} = + 1, i = 1, \ldots, k)} (1 -
  \pi)^{\sharp (T_{i} = - 1, i = 1, \ldots, k)} \nonumber
\end{eqnarray}
$$

where $\sharp (T_{i} = + 1, i = 1, \ldots, k)$ denotes the number of times 
$T_{i} = + 1$ for $i = 1, \ldots, k$, and similarly for $\sharp (T_{i} = - 
1)$. The random variable $\sharp (T_{i} = + 1, i = 1, \ldots, k)$ can be 
understood as the Binomial random variable $Z_{k} \sim \operatorname{Binomial} 
(k, p)$, with success $p$, allowing us to rewrite

$$
\begin{eqnarray}
  X_{k} & = & X_{0} (1 + \pi)^{Z_{k}} (1 - \pi)^{k - Z_{k}} . \nonumber
\end{eqnarray}
$$

Under this construction, we can see that under an appropriate choice of $\pi$, 
our wealth could grow exponentially fast, without the chance of absolute ruin, 
in particular

$$
\begin{eqnarray}
  X_{k} & = & X_{0} (1 + \pi)^{Z_{k}} (1 - \pi)^{k - Z_{k}}, \nonumber\\\
  & = & X_{0} e^{\log ((1 + \pi)^{Z_{k}} (1 - \pi)^{k - Z_{k}})},
  \nonumber\\\
  & = & X_{0} e^{k \left[ \frac{Z_{k}}{k} \log (1 + \pi) + \frac{(k -
  Z_{k})}{k} \log (1 - \pi) \right]}, \nonumber
\end{eqnarray}
$$

which in conjunction with the estimator $\frac{Z_{k}}{k} \rightarrow p$ as $p 
\rightarrow \infty$ for the Binomial random variable $Z_{k}$, we find that for 
large $k \gg 1$

$$
 X_{k} \approx X_{0} e^{k [p \log (1 + \pi) + (1 - p) \log (1 - \pi)]} =
   X_{0} e^{G (p) k}
$$

where $G (p) :=$$p \log (1 + \pi) + (1 - p) \log (1 - \pi)$ denotes 
the *growth rate*.

Indeed, which $\pi (p)$ attains maximal growth is known as the Kelly 
proportion, which can be calculated as $\bar{\pi} (p) := p - q = 2 p - 1$, for 
$q := 1 - p$.

In particular, the Kelly proportion suggests that for $k \gg 1$, $X_{k}$ would 
grow at a rate of

$$
\begin{eqnarray}
  X_{k} & \approx & X_{0} e^{k [\log (2) + p \log (p) + (1 - p) \log (1 - p)]}
  \nonumber\\\
  & = & X_{0} (2 p^p (1 - p)^{(1 - p)})^k \nonumber
\end{eqnarray}
$$

which grows exponentially for $p \neq \frac{1}{2}$, and stays at the initial 
capital $X_{0}$ for $p = \frac{1}{2}$, in which case the Kelly proportion, 
$\pi$, is $0$, and no capital would be bet. I wish to state that the above 
strategy does not maximise $\mathbb{E} (X_{k})$, as that would be the strategy 
of betting your whole wealth at each trial, but instead concerns maximising 
the asymptotic rate of growth, $G$, of your wealth as $k \rightarrow \infty$.

## Kelly Betting System: Maximising Expected Utility

Instead of aiming to maximise $\mathbb{E} (X_{k})$, consider instead the want 
to maximise $\mathbb{E} (\log (X_{k}))$ at each $k \in \mathbb{N}$, where 
$\log (X_{n})$ is often called the utility, see the work of J. von Neumann in 
{{< cite "VonNeumann2007" >}} for the seminal work on utility theory.

Additionally, assume that $B_{k} := \pi _{k} (p) X_{k - 1}$ with $\pi _{k} : 
[0, 1] \rightarrow [0, 1]$ which can vary at each step. Then, the expected 
wealth at trial $k$, given information at trial $k - 1$ can be written as

$$
\begin{eqnarray}
  \mathbb{E} (\log (X_{k}) |X_{k - 1}) & = & \log (X_{k - 1}) + p \log (1 +
  \pi _{k}) p + q \log (1 - \pi _{k}) . \nonumber
\end{eqnarray}
$$

At each stage $k$, $\mathbb{E} (\log (X_{k}) |X_{k - 1})$ is maximised by the 
Kelly proportion discussed above

$$
 \pi _{k} (p) := p - q = 2 p - 1.
$$

This gives a small justification of the Kelly betting system (i.e. it 
maximises the expectation of the log utility, whereas for the non log-utility 
approach, it only maximises the rate of increase of wealth).

This betting system can also be used if the win probabilities change from 
stage to stage. If there are $n$ stages, and the win probability at stage $k$ 
is $p_{k}$, then the Kelly betting system at each stage uses the rule of 
maximising the expected $\log$ of fortune one step ahead, as done above. Thus 
at stage $k$, you bet the proportion $\pi _{k} (p_{k})$ of your fortune.

For further reading on the matter, one can also review the good and bad 
properties of the Kelly betting system, {{< cite "MacLean2010" >}}, 
and the application of the Kelly criterion for sports betting and Wall Street, 
see {{< cite "Thorp2006" >}} and references therein.

{{< references >}}
