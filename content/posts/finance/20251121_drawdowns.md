---
date: 2025-11-21
math: true
categories: "finance"
tags: ["probability", "finance"]
title: "Drawdown Formulas"
---


The aim of this article is to record and add some references on the recent 
post by Gappy discussing a number of drawdown formulas, see the original post 
{{< cite "Gappy2025" >}} 
([here](https://byfire.substack.com/p/reading-writing-and-drawdown-arithmetic?r=abwpr&utm_medium=ios&triedRedirect=true)) - 
primarily to act as a keepsake for myself in the future. Some other useful 
references on this topic include {{< cite "Zhang2012" "Salminen2025" 
"Taylor1975" >}}.

## Definitions

Assume you have a process (e.g. a capital stream) $X = (X_{t})_{t}$ described 
as a drifted Brownian motion with drift $\mu > 0$ and volatility 
$\sigma > 0$, i.e. such that

$$
\begin{eqnarray}
  \mathrm{d} X_{t} & = & \mu \mathrm{d} t + \sigma \mathrm{d} B_{t},
  \nonumber\\\
  X_{0} & = & 0, \nonumber
\end{eqnarray}
$$

where $(B_{t})_{t > 0}$ denotes the standard Brownian motion with zero 
drift and unit variance. Then, the running maximum, and drawdown processes can 
be defined as

$$
\begin{eqnarray}
  M_{t} & := & \sup _{0 \leqslant s \leqslant t} X_{t}, \nonumber\\\
  D_{t} & := & M_{t} - X_{t}, \nonumber
\end{eqnarray}
$$

where we note that the drawdown process $(D_{t})_{t}$ is non-negative.

We introduce the following stopping time, for when the processes $X_{t}$ first 
hit some value $x \in \mathbb{R}$, which will be the emphasis of our 
discussions below

$$
\begin{eqnarray}
  \tau _{x}  & := & \inf \lbrace t \geqslant 0 : X_{t} \leqslant - x \rbrace,
  \nonumber
\end{eqnarray}
$$

Remark. Here, for a process $(X_{t})_{t}$ that describes capital, $\mu$ can be 
interpreted as the expected daily PnL, and $\sigma$ as the daily volatility.

In such a scenario, define the Sharpe ratio across a time horizon $T$ (in 
business days) as $\operatorname{SR}_{T} := \frac{\mu}{\sigma} \sqrt{T}$ and a 
period specific volatility as $\sigma _{T} := \sigma \sqrt{T}$. In addition, 
when considering a drawdown $- b$, for some $b \geqslant 0$, define the 
vol-normalised drawdown as $b_{\sigma} := \frac{b}{\sigma}$. Furthermore, for 
brevity, we write $\operatorname{SR}_{1}$ as $\operatorname{SR}$.

## Questions of Interest

We now concern ourselves with the following questions (slightly rephrased to 
improve clarity for my part). We begin with questions relating to the process 
$(X_{t})$ rather than the drawdown process $(D_{t})$.

### Question 1: Hitting Probability at Any Time

*What is the hitting probability that the process $X_{t}$ hits a given limit 
at any point in the future – i.e. for $b > 0$, what is $\mathbb{P} \left( 
X_{t} \leqslant - b, \text{ for some } t > 0 \right)$?*

This is a classical problem in stochastic analysis, and can be treated in a 
number of ways. We provide here a simple proof utilising some existing theory.

The hitting time probability can be restated into the following more tractable 
form

$$
\begin{eqnarray}
  \left\lbrace X_{t} \leqslant - b \text{ for some } t > 0 \right\rbrace &
  \equiv & \lbrace \exists t > 0 : X_{t} \leqslant - b \rbrace, 
\nonumber\\\
  & \equiv & \lbrace \tau _{b} < \infty \rbrace, \nonumber
\end{eqnarray}
$$

therefore $\mathbb{P} \left( X_{t} \leqslant - b, \text{ for some } t > 0 
\right) =\mathbb{P} (\tau _{b} < \infty)$. Using the monotone converge 
theorem, we can restate the problem once again into investigating the Laplace 
transform of $\tau _{b}$

$$
\begin{eqnarray}
  \mathbb{P} (\tau _{b} < \infty) & = & \mathbb{E} 
(\boldsymbol{1}_{\lbrace
  \tau _{b} < \infty \rbrace}) \nonumber\\\
  \text{monotone convergence theorem } \rightsquigarrow & = & \lim _{r
  \rightarrow 0^-} \mathbb{E} (e^{- r \tau _{b}}) . \nonumber
\end{eqnarray}
$$

The Laplace transform of $\tau _{b}$ is well studied, and an explicit 
expression for this can be found in the reference book {{< cite 
"Borodin2002" >}} (Equation 2.0.1, pg. 295), or also accompanied with a 
proof in {{< cite "Shreve2008" >}} (Theorem 8.3.2 pg. 346). In 
particular, the references above state that for a drifted Brownian motion with 
drift $\nu$ and unit variance, i.e. $\mathrm{d} Y_{t} = \nu \mathrm{d} t + 
\mathrm{d} B_{t}$ with $Y_{0} = 0$, the Laplace transform of the hitting 
probability $\eta _{x} := \inf \lbrace t \geqslant 0 : T_{t} \leqslant - x 
\rbrace$ for $x > 0$ is

$$
\begin{eqnarray}
  \mathbb{E} (e^{- r \eta _{x}}) & = & e^{- \left( \nu + \sqrt{\nu^2 + 2 r}
  \right) x} . \nonumber
\end{eqnarray}
$$

Letting $X_{t} = \sigma Y_{t}$ with $\mu = \sigma \nu$, we obtain (using the 
transformation $b = \sigma x$)

$$
\begin{eqnarray}
  \mathbb{E} (e^{- r \tau _{b}}) & = & e^{- \left( \frac{\mu}{\sigma} +
  \sqrt{\left( \frac{\mu}{\sigma} \right)^2 + 2 r} \right) \left(
  \frac{b}{\sigma} \right)} \nonumber\\\
  & = & e^{- \left( \frac{\mu + \sqrt{\mu^2 + 2 r \sigma^2}}{\sigma^2}
  \right) b} . \nonumber
\end{eqnarray}
$$

Putting together, and taking the limit as $r \rightarrow 0^-$ then yields

$$
\begin{eqnarray}
  \mathbb{P} (\tau _{b} < \infty) & = & \left\lbrace\begin{array}{ll}
    1 & \text{if $\mu \leqslant 0$},\\
    e^{- \frac{2 \mu b}{\sigma^2}} & \text{if } \mu > 0,
  \end{array}\right. \nonumber
\end{eqnarray}
$$

precisely as Gappy described. What this tells you is that if your drift is 
negative, you will almost surely hit the negative boundary, and with 
exponentially decreasing probability hit the negative boundary if your drift 
is positive. For $\mu > 0$, rewriting the above equation in terms of 
Sharpe, we see that

$$
\begin{eqnarray}
  \mathbb{P} (\tau _{b} < \infty) & = & e^{- 2 b_{\sigma} 
\operatorname{SR}}
  \nonumber
\end{eqnarray}
$$

i.e. the chance of hitting a lower boundary from a given starting point of 
zero decreases exponentially with Sharpe.

### Question 2: Hitting Probability Within a Given Time

*What is the hitting probability of a given drawdown limit **within a given 
interval** – i.e. for $b, T > 0$, what is $\mathbb{P} \left( X_{t} 
\leqslant - b, \text{ for some } t \in [0, T) \right)$?*

In Question 1, we determined (or referred to the fact) that the Laplace 
transform of the stopping time $\tau _{b}$ can be described as

$$
\begin{eqnarray}
  \mathbb{E} (e^{- r \tau _{b}}) & = & e^{- \left( \frac{\mu + \sqrt{\mu^2 + 2
  r \sigma^2}}{\sigma^2} \right) b}, \qquad r > 0. \nonumber
\end{eqnarray}
$$

By uniqueness of the Laplace transform and distribution (also by uniqueness of 
the Moment Generating Functions, which is equivalent to the Laplace 
transform), $\tau _{b}$ is a random variable described by the Inverse Gaussian 
distribution $\text{IG} \left( \frac{b}{\mu}, \left( \frac{b}{\sigma} 
\right)^2 \right)$, see {{< cite "WikiIG2025" >}}, which has 
conditional CDF

$$
\begin{eqnarray}
  \mathbb{P} (\tau _{b} \leqslant x| \tau _{b} < \infty) & = & \Phi 
\left(
  \frac{x \mu - b}{\sigma \sqrt{x}} \right) + e^{\frac{2 \mu b}{\sigma^2}}
  \Phi \left( \frac{- x \mu - b}{\sigma \sqrt{x}} \right) \nonumber
\end{eqnarray}
$$

with $\Phi$ denoting the standard normal distribution.

Knowing this distribution, we can also determine a number of other facts 
relating to this hitting time. Restating the original probability in terms of 
the hitting time $\tau _{b}$, we have

$$
\begin{eqnarray}
  \mathbb{P} \left( X_{t} \leqslant - b, \text{ for some } t \in [0, T)
  \right) & = & \mathbb{P} (\tau _{b} \leqslant T, \tau _{b} < \infty)
  \nonumber\\\
  & = & \mathbb{P} (\tau _{b} < \infty) \mathbb{P} (\tau _{b} \leqslant 
T|
  \tau _{b} < \infty) \nonumber\\\
  & = & e^{- \frac{2 \mu b}{\sigma^2}} \left[ \Phi \left( \frac{T \mu -
  b}{\sigma \sqrt{T}} \right) + e^{\frac{2 \mu b}{\sigma^2}} \Phi \left(
  \frac{- T \mu - b}{\sigma \sqrt{T}} \right) \right] \nonumber\\\
  & = & \Phi \left( \frac{- T \mu - b}{\sigma \sqrt{T}} \right) + e^{-
  \frac{2 \mu b}{\sigma^2}} \Phi \left( \frac{T \mu - b}{\sigma \sqrt{T}}
  \right) \nonumber\\\
  & = & \Phi \left( - \frac{b_{\sigma}}{\sqrt{T}} -\operatorname{SR}_{T}
  \right) + e^{- 2\operatorname{SR}_{T} \frac{b_{\sigma}}{\sqrt{T}}} \Phi
  \left( - \frac{b_{\sigma}}{\sqrt{T}} +\operatorname{SR}_{T} \right)
  \nonumber
\end{eqnarray}
$$

where we have restated the last equation in volatility units. One can check 
that as $T \rightarrow \infty$, the right hand side of the equation approaches 
$e^{- \frac{2 \mu b}{\sigma^2}}$, the eventual hitting probability.

Remark. The probability of hitting the barrier $- b$ within a finite $T$ is 
given in two terms, where

$$
\begin{eqnarray}
  \Phi \left( \frac{- T \mu - b}{\sigma \sqrt{T}} \right) &  & \text{The
  likelihood of the process being below the barrier $- b$ at time $T$.}
  \nonumber\\\
  e^{- \frac{2 \mu b}{\sigma^2}} \Phi \left( \frac{T \mu - b}{\sigma \sqrt{T}}
  \right) &  & \text{The discount applied to the probability due to effect of
  positive drift.} \nonumber
\end{eqnarray}
$$

### Question 3: Distribution of Drawdown Values

We now move on to discuss drawdown probabilities, which are slightly more 
complicated, as they are path dependent, as the drawdown process $(D_{t})_{t}$ 
is derived from the joint distribution $(M_{t}, X_{t})_{t}$.

*What is the distribution of drawdown values?*

Recall that the drawdown process $(D_{t})_{t}$ measures the current drop from 
the historical maximum, which is tracked by the process $(M_{t})_{t}$. By 
manipulating, and integrating out the joint density, it can be determined that 
the probability that the drawdown at time $t < \infty$ is greater than 
$b > 0$ is

$$
\begin{eqnarray}
  \mathbb{P} (D_{t} \geqslant b) & = & \Phi \left( \frac{- t \mu - b}{\sigma
  \sqrt{t}} \right) + e^{- \frac{2 \mu b}{\sigma^2}} \Phi \left( \frac{t \mu -
  b}{\sigma \sqrt{t}} \right), \nonumber
\end{eqnarray}
$$

and in particular, as time $t \rightarrow \infty$

$$
\begin{eqnarray}
  \mathbb{P} (D_{\infty} \geqslant b) & = & e^{- \frac{2 \mu b}{\sigma^2}},
  \nonumber\\\
  & = & e^{- 2 b_{\sigma} \operatorname{SR}}, \nonumber
\end{eqnarray}
$$

i.e. $\mathbb{P} (D_{\infty} \leqslant b) = 1 - e^{- \frac{2 \mu 
b}{\sigma^2}}$, and hence $D_{\infty} \sim \operatorname{Exp} \left( \frac{2 
\mu}{\sigma^2} \right)$. We have two remarkable things here, one is that the 
probability of a drawdown exceeding a certain threshold at a given time $t$ is 
precisely the hitting time of the process $X_{t}$ of the barrier $- b$, and 
secondly that the complicated path dependent drawdown process, at large times, 
converges to the stationary Exponential distribution (even though $X_{t}$ 
itself is not stationary), see {{< cite "WikiExp2025" >}}. The 
intuition here is that under the positive drift $\mu > 0$, $X_{t}$ drifts 
upwards, and at every time, it continues to hit new heights, which resets 
$D_{t}$ to zero, making it memoryless. Furthermore, in the sense of a capital 
process, a larger $\operatorname{SR}$ makes drawdowns exponentially less 
likely.

Since the infinite time drawdown process follows an Exponential distribution 
with parameter $\lambda = \frac{2 \mu}{\sigma^2}$, it directly follows (from 
the results regarding the distribution) that in the infinite time limit, the 
average drawdown is

$$
\begin{eqnarray}
  \mathbb{E} (D_{\infty}) & = & \frac{\sigma^2}{2 \mu}, \nonumber\\\
  \frac{\mathbb{E} (D_{\infty})}{\sigma} & = & \frac{1}{2\operatorname{SR}},
  \nonumber
\end{eqnarray}
$$

where the last equation represents the value in volatility units.

### Question 4: Expected Recovery Time

*What is the expected recovery time from a given drawdown?*

Assume that at time $t^{\ast}$, we are currently at a drawdown $- b$ for some 
$b > 0$, i.e. $D_{t^{\ast}} = b$, and $M_{t^{\ast}} = \sup _{0 \leqslant s 
\leqslant t_{0}} X_{s}$. We want to determine the recovery time from this 
drawdown, i.e.

$$
\begin{eqnarray}
  \rho _{b} & := & \inf \left\lbrace t \geqslant 0 : D_{t^{\ast} + t} = 0
  \text{ given } D_{t^{\ast}} = b \right\rbrace . \nonumber
\end{eqnarray}
$$

Rewriting in terms of $X_{t}$, we have

$$
\begin{eqnarray}
  \rho _{b} & = & \inf \lbrace t \geqslant 0 : X_{t^{\ast} + t} = M_{t^{\ast}}
  \rbrace \nonumber\\\
  & = & \inf \lbrace t \geqslant 0 : X_{t^{\ast} + t} - X_{t^{\ast}} =
  M_{t^{\ast}} - X_{t^{\ast}} \rbrace \nonumber\\\
  & = & \inf \lbrace t \geqslant 0 : X_{t^{\ast} + t} - X_{t^{\ast}} = b
  \rbrace \nonumber\\\
  \text{$\widetilde{X_{t}} := X_{t^{\ast} + t} - X_{t^{\ast}}$ and Strong
  Markov Property} \rightsquigarrow & = & \inf \lbrace t \geqslant 0 :
  \tilde{X}_{t} = b \rbrace \nonumber\\\
  & = & \inf \lbrace t \geqslant 0 : \tilde{X}_{t} \geqslant b \rbrace
  \nonumber
\end{eqnarray}
$$

where the final line shows that $\rho (b)$ is simply the first passage hitting 
time of a fresh Brownian motion $\tilde{X}_{t}$ with $\mathrm{d} \tilde{X}_{t} 
= \mathrm{d} \mu + \sigma \mathrm{d} B_{t}$ with $\tilde{X}_{0} = 0$. As we 
did for Questions 1 and 2, we can determine that as $\mu$ is positive, the 
probability of recovery is one in infinite time (as now the hitting boundary 
is above the starting point), and that $\rho _{b} \sim \operatorname{IG} 
\left( \frac{b}{\mu}, \left( \frac{b}{\sigma} \right)^2 \right)$. With this, 
the expected time for recovery can be computed as

$$
\begin{eqnarray}
  \mathbb{E} (\rho _{b}) & = & \frac{b}{\mu} =
  \frac{b_{\sigma}}{\operatorname{SR}} . \nonumber
\end{eqnarray}
$$

What is interesting is that the expected recovery time is independent of the 
volatility of the process, even though one would intuitively think that the 
volatility has some action here. Instead, what you find is that the volatility 
instead dictates the variance of the recovery time

$$
\begin{eqnarray}
  \mathbb{V} (\rho _{b}) & = & \frac{b \sigma^2}{\mu^3} =
  \frac{b_{\sigma}}{\operatorname{SR}^3} . \nonumber
\end{eqnarray}
$$

Something else one can notice here is the relation of the above identity to 
physics, i.e. if $\mu$ denotes the general speed of travel, and $b$ the 
distance one needs to traverse, then the time taken can be calculated as 
$\frac{b}{\mu}$, which is precisely $\mathbb{E} (\rho _{b})$.

### Question 5: Expected Time in Drawdown

*What is the expected time spent in a drawdown?*

This question is a little ambiguous. In explicit terms, the process $X_{t}$ is 
almost surely always in a drawdown, and therefore across a time $[0, T]$, the 
expected time spent in a drawdown is $T$.

However, what Gappy discusses here is not the above - instead, it is, given a 
random point in time, what is the expected time I should wait to recover from 
my current drawdown, i.e. the expected remaining recovery time.

From the above, we determined that the expected time required to recover to 
the previous high, given that the current drawdown depth is $b$ is $\mathbb{E} 
(\rho _{b})$. Let $T_{\text{obs}}$ denote a random variable chosen uniformly 
across $(0, T)$ as $T \rightarrow \infty$ (with $T$ large enough such that 
$(D_{t})_{t}$ resembles the stationary distribution). At this moment, the 
current drawdown depth can be described as

$$
\begin{eqnarray}
  D_{\text{obs}} & = & M_{T_{\text{obs}}} - X_{T_{\text{obs}}} . \nonumber
\end{eqnarray}
$$

For the sake of simplicity, assume that $D_{\text{obs}} \sim D_{\infty}$, i.e. 
that the drawdown is distributed according to a stationary distribution. 
Define now $\tau _{\text{remain}}$, the duration required for the process 
$X_{t}$ to return to the level of the maximum observed at time 
$T_{\text{obs}}$, i.e.

$$
\begin{eqnarray}
  \tau _{\text{remain}} & = & \inf \left\lbrace t \geqslant 0 :
  X_{T_{\text{obs}} + t} = M_{T_{\text{obs}}} \right\rbrace . \nonumber
\end{eqnarray}
$$

Then, we wish to determine $\mathbb{E} \left( \tau _{\text{remain}} \right)$, 
which using the law of total expectation, we can determine to be

$$
\begin{eqnarray}
  \mathbb{E} \left( \tau _{\text{remain}} \right) & = &
  \mathbb{E}_{D_{\text{obs}}} \left( \mathbb{E} \left( \tau _{\text{remain}}
  |D_{\text{obs}} \right) \right) \nonumber\\\
  & = & \mathbb{E}_{D_{\text{obs}}} \left( \frac{D_{\text{obs}}}{\mu} \right)
  \nonumber\\\
  & = & \frac{1}{\mu} \mathbb{E}_{D_{\text{obs}}} \left( D_{\text{obs}}
  \right) \nonumber\\\
  \text{from above $\mathbb{E} (D_{\infty}) = \frac{\sigma^2}{2 \mu} $}
  \rightsquigarrow & = & \frac{1}{\mu} \left( \frac{\sigma^2}{2 \mu} \right)
  \nonumber\\\
  & = & \frac{\sigma^2}{2 \mu^2} = \frac{1}{2} \frac{1}{\operatorname{SR}^2}
  . \nonumber
\end{eqnarray}
$$

More specifically, the expected time to wait to exit a given drawdown that you 
may find yourself in is inversely proportional to the square of the Sharpe 
ratio. For example, assume you have a strategy that has an annualised Sharpe 
of $\xi$, i.e. $\operatorname{SR}_{260} = \xi$, then, at any given drawdown, 
your expected recovery time (in business days) is

$$
\begin{eqnarray}
  \mathbb{E} \left( \tau _{\text{remain}} \right) & = & \frac{1}{2}
  \frac{1}{\operatorname{SR}^2} \nonumber\\\
  & = & \frac{1}{2} \frac{1}{\left(
  \frac{\operatorname{SR}_{260}}{\sqrt{260}} \right)^2} \nonumber\\\
  & = & \frac{130}{\xi^2} \nonumber
\end{eqnarray}
$$

which is 520bd (2y) for a $\xi = 0.5$ strategy (quite a considerable time).

{{< references >}}
