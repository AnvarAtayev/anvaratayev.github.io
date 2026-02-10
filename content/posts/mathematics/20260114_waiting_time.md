---
date: "2026-02-10"
math: true
refs: 
  - "Downey2024"
  - "VanderPlas2018"
  - "Grimmett2020"
summary: >
    Faced with the choice of walking or waiting for a shuttle at Auckland 
    Airport, we explore the optimal strategy in expectation. Starting from a 
    simple deterministic model, we introduce uncertainty in bus headways and 
    discover the inspection paradox: under any variance in arrival times, the 
    expected wait is always longer than the naive estimate of half the mean 
    headway.
title: "Waiting Time and the Inspection Paradox"
---


Abstract:*Faced with the choice of walking or waiting for a shuttle at 
Auckland Airport, we explore the optimal strategy in expectation. Starting 
from a simple deterministic model, we introduce uncertainty in bus headways 
and discover the inspection paradox: under any variance in arrival times, the 
expected wait is always longer than the naive estimate of half the mean 
headway.*

I was recently at Auckland Airport for some travelling, where I arrived at the 
Domestic Airport to drop off my car and had to transfer to the International 
Airport. To do so, I could walk, which would take me around 15mins, according 
to the sings on the wall, or I could take a transfer bus that also, 
supposedly, comes every 15mins.

As one would usually do, I arrived at the shuttle stop, to see if I can get to 
the International Terminal quickly, but there wasn't a bus in sight. So, I was 
faced with the following problem:

> *Walk my way to the International Terminal, or wait, and have my time 
> possibly reduced dramatically if a shuttle is about to appear.*

In the end, we ended up walking and beating the shuttle, but I wondered what 
is the best option in expectation, if you take into consideration some 
uncertainty around some of the claims the airport makes, and so on. Doing so, 
we discover the inspection paradox, on which you can read more about at 
{{< cite "Downey2024" >}} and {{< cite "VanderPlas2018" >}}.

## Problem Statement

Let $T_{\text{walk}}, T_{\operatorname{bus}}$, and $T_{\text{wait+bus}}$ 
denote the random variables representing how long it takes, in minutes, to get 
from the Domestic Airport to the International Airport at Auckland Airport, 
via walking, via bus, and by first waiting and then taking the bus, 
respectively. Then, what is the optimal choice to minimise the expected time 
it takes to get from the Domestic Airport to the International Airport.

## Basic Problem

The basic problem is simple and easy to solve, and follows from assuming 
exactly what the signs suggest. Assume, we are sure that 
$T_{\operatorname{walk}} = 15$ and that the bus comes exactly every $H$mins 
($H$ for *headway*) with $H = 15$.

As we're unsure how long the bus will take between terminals, let 
$T_{\operatorname{bus}}$ be a random variable representing this quantity. I 
will assume that my walking pace is around 5km/h and that the bus travels at 
the speed limit enforced around the airport, which in New Zealand we expect to 
be 30-50km/h, in which case we can make the educated guess that $\mathbb{E} 
(T_{\operatorname{bus}}) = \lambda \mathbb{E} (T_{\operatorname{walk}})$ with 
$\lambda$ likely in $\left( 0, \frac{1}{6} \right)$ and certainly $\lambda 
< 1 / 2$. Furthermore let $W$ denote the random variable representing 
the *waiting time* that I have to endure before the next bus. Then, we may 
write

$$
\begin{eqnarray}
  T_{\text{walk}} & = & 15, \nonumber\\\
  T_{\text{wait+bus}} & = & W + T_{\text{bus}} . \nonumber
\end{eqnarray}
$$

To answer our question, we wish to determine the sign of $\mathbb{E} 
(T_{\operatorname{wait}+\operatorname{bus}}) -\mathbb{E} 
(T_{\operatorname{walk}})$, a positive value implying that walking is faster 
than waiting and bussing, whilst a negative value implying the opposite.

{{% details %}}
Indeed, using $\mathbb{E} (T_{\operatorname{bus}}) = \lambda \mathbb{E} 
(T_{\operatorname{walk}})$,

$$
 \mathbb{E} (T_{\operatorname{wait}+\operatorname{bus}}) -\mathbb{E}
   (T_{\operatorname{walk}}) =\mathbb{E} (W) - (1 - \lambda) \mathbb{E}
   (T_{\operatorname{walk}}) .
$$
<!-- split -->
{{% env type="proof" %}}
The result follows from direct manipulation,

$$
\begin{eqnarray}
  \mathbb{E} (T_{\operatorname{wait}+\operatorname{bus}}) -\mathbb{E}
  (T_{\operatorname{walk}}) & = & \mathbb{E} (W) +\mathbb{E}
  (T_{\operatorname{bus}}) -\mathbb{E} (T_{\operatorname{walk}}) \nonumber\\\
  & = & \mathbb{E} (W) + \lambda \mathbb{E} (T_{\operatorname{walk}})
  \-\mathbb{E} (T_{\operatorname{walk}}) \nonumber\\\
  & = & \mathbb{E} (W) - (1 - \lambda) \mathbb{E} (T_{\operatorname{walk}}) .
  \nonumber
\end{eqnarray}
$$
{{% /env %}}


{{% /details %}}

As $\mathbb{E} (T_{\operatorname{walk}}) = 15$ is known it suffices to 
determine $\mathbb{E} (W)$.

Intuition tells us that, if everything is running smoothly and as expected, 
$W$ should follow $U (0, H)$, which would give us $\mathbb{E} (W) = 
\frac{H}{2}$. Using the fact that $T_{\operatorname{walk}} = H$, gives

$$
\begin{eqnarray}
  \mathbb{E} (T_{\operatorname{wait}+\operatorname{bus}}) -\mathbb{E}
  (T_{\operatorname{walk}}) & = & \left( \lambda - \frac{1}{2} \right)
  \mathbb{E} (T_{\operatorname{walk}}) < 0 \nonumber
\end{eqnarray}
$$

where the inequality follows since $\lambda < \frac{1}{2}$. That is, in 
expectation, it is better to *wait for the bus* rather than to walk, under 
this simple formulation.

{{% env type="remark" style="plain" %}}
In the basic problem, we made a huge assumption that $H$, the time between 
buses, is exactly 15mins. In reality, this is unlikely to be the case, either 
due to weather, road conditions, or simply drivers being late to their shift. 
Therefore one should really consider instead the problem where $H$ is a random 
variable, and instead with $\mathbb{E} (H) = 15$.

Interestingly, if one adds randomness into the mix for the headway, we 
immediately arrive at an interesting result known as the inspection paradox, 
which we will describe shortly.
{{% /env %}}

## Generalised Problem

We focus here on the waiting time, and prove results regarding $\mathbb{E} 
(W)$ under uncertainty.

This problem sits within the realm of *renewal theory*, and as such we 
consider a generic renewal process $(S_{n})_{n \geqslant 0}$, which denotes 
the time at which the $n$th bus arrives. Without loss of generality, we can 
assume that $S_{0} = 0$ and write $S_{n} := H_{1} + \cdots + H_{n}$, where 
$(H_{n})_{n \geqslant 1}$ denote the time between the $(n - 1)$th and $n$th 
buses. We assume that $(H_{n})_{n \geqslant 1}$ are i.i.d. non-negative random 
variables with a common distribution $F_{H}$ such that $\mathbb{E} (H) 
=\mathbb{E} (T_{\operatorname{walk}}) < \infty$ and $\mathbb{E} (H^2) 
< \infty$.

Let $t \in [0, \infty)$ denote the time at which I arrive at the bus stop, $W 
(t) := S_{N (t) + 1} - t$ denote the *waiting time*, i.e. the time remaining 
until the next bus arrival, where $N (t) := \sup \lbrace n : S_{n} \leqslant t 
\rbrace$ denotes the number of buses that have arrived by time $t$.

Now, $W (t)$ represents the waiting time at a given time $t$, and is dependent 
on the entire history of the renewal process $(S_{n})_{n \geqslant 0}$. 
Although, as an individual who does not organise the bus schedule, or collects 
data on bus arrival times, we do not know the entire history of the process 
when we arrive at the bus stop, and therefore the best bet for us is to 
question the long-run character of the system, and explore the distribution of 
$W (t)$ as $t \rightarrow \infty$, i.e. the steady-state waiting time. We 
denote the random variable sampled from the steady-state waiting time 
distribution by $W$. Then we get the following result.

{{% env type="theorem" title="Inspection Paradox" %}}
Let $W (t)$ denote the waiting time at some t of a renewal process $(S_{n})_{n 
\geqslant 0}$ with i.i.d. headway $H$. Then

<span id="eq-inspection-paradox" class="tm-eqlabel"></span>
$$
\begin{equation}
  \label{eq-inspection-paradox}\tag{1} \lim _{t \rightarrow \infty} \mathbb{E}
  (W (t)) = \frac{\mathbb{E} (H^2)}{2\mathbb{E} (H)} = \frac{\mathbb{E}
  (H)}{2} + \frac{\mathbb{V} (H)}{2\mathbb{E} (H)} = \frac{\mathbb{E} (H)}{2}
  \left( 1 + \left( \frac{\sigma (H)}{\mathbb{E} (H)} \right)^2 \right) .
\end{equation}
$$
{{% /env %}}

In particular, [(undefined label: 
'eq-inspection-paradox')](#eq-inspection-paradox) tells us that under some 
uncertainty of the headway, the expected waiting time is greater than or equal 
to the $\mathbb{E} (H) / 2$, and only equal to $\mathbb{E} (H) / 2$ (the 
intuitive result) when there is no variance on the headway.

What this states intuitively is that, under any variance in the headways, some 
intervals will be longer than others, and that if you were to land in any 
particular window, you would land preferentially in the longer ones than 
shorter ones, as they simply occupy a larger window in time. We refer the 
reader to the appendix for the proof of this result.

### Examples

We provide here some examples of the expected waiting time under different 
distribution assumptions for the headway $H$.

{{% env type="example" title="Exponential" style="plain" %}}
At first glance, one could assume that the headway can be modelled via an 
exponential distribution, $H \sim \operatorname{Exp} (\gamma)$, in which case 
$\mathbb{E} (H) = \sigma (H) = \frac{1}{\gamma}$, giving

$$
\begin{eqnarray}
  \mathbb{E} (W) & = & \mathbb{E} (H) . \nonumber
\end{eqnarray}
$$

That is, the expected wait time is precisely the expected headway. This is 
rather unintuitive and comes from the memoryless property of the exponential 
distribution, i.e. waiting tells you nothing about when the next bus arrives.

Thinking a little more about the bus problem, tells us that this is indicative 
of a system where buses do not run on a particular schedule, which is not a 
common design of bus networks.

Additionally, the exponential distribution places highest density at $H = 0$, 
with arbitrarily short headways having the most common outcome. But this is 
not the case in the majority of real life situations, buses typically have 
schedules and are designed to operate at a fixed intervals, with the highest 
density of headways being at the designed interval values.

Although, if one were to assume an exponential distribution for the bus 
arrival times, then given the transit time of the bus, we would certainly have 
$\mathbb{E} (T_{\operatorname{walk}}) <\mathbb{E} 
(T_{\operatorname{wait}+\operatorname{bus}})$ as $\mathbb{E} (W) =\mathbb{E} 
(H) =\mathbb{E} (T_{\operatorname{walk}})$ in our situation, with the last 
equality assumed to hold true. Therefore, one should always simply choose to 
walk.
{{% /env %}}

{{% env type="example" title="Log-Normal" style="plain" %}}
In practice, measured bus headways are often well-modelled by a log-normal 
distribution. Assuming that $H \sim \operatorname{LogNormal} (\nu, \tau^2)$, 
we have that $\mu := \mathbb{E} (H) = e^{\nu + \frac{\tau^2}{2}}$ and $\sigma 
(H) = \mu \sqrt{e^{\tau^2} - 1}$, yielding

$$
\begin{eqnarray}
  \mathbb{E} (W) & = & \frac{\mathbb{E} (H)}{2} e^{\tau^2} . \nonumber
\end{eqnarray}
$$

{{% details %}}
In particular, recalling that $\mathbb{E} (H) =\mathbb{E} 
(T_{\operatorname{walk}})$,

$$
 \mathbb{E} (T_{\operatorname{wait}+\operatorname{bus}}) -\mathbb{E}
   (T_{\operatorname{walk}}) = \underbrace{\left( \lambda + \frac{1}{2}
   e^{\tau^2} - 1 \right)}_{\kappa} \mathbb{E} (T_{\operatorname{walk}}) .
$$
<!-- split -->
{{% env type="proof" %}}
The proof follows via direct manipulation

$$
\begin{eqnarray}
  \mathbb{E} (T_{\operatorname{wait}+\operatorname{bus}}) -\mathbb{E}
  (T_{\operatorname{walk}}) & = & \mathbb{E} (W) - (1 - \lambda) \mathbb{E}
  (T_{\operatorname{walk}}) \nonumber\\\
  & = & \frac{\mathbb{E} (H)}{2} e^{\tau^2} - (1 - \lambda) \mathbb{E}
  (T_{\operatorname{walk}}) \nonumber\\\
  & = & \frac{\mathbb{E} (T_{\operatorname{walk}})}{2} e^{\tau^2} - (1 -
  \lambda) \mathbb{E} (T_{\operatorname{walk}}) \nonumber\\\
  & = & \underbrace{\left( \lambda + \frac{1}{2} e^{\tau^2} - 1
  \right)}_{\kappa} \mathbb{E} (T_{\operatorname{walk}}) \nonumber
\end{eqnarray}
$$

as required.
{{% /env %}}
{{% /details %}}

In particular, for moderate variability, say $\tau = 0.3$, $e^{\tau^2} 
\approx 1.1$, and realistic ratios between walking and driving speeds, 
$\lambda = 0.1$, we get $\sigma (H) \approx 4.6$, $\kappa = - 0.35$, i.e. 
waiting for and taking the bus is faster than walking, even with the slight 
bias we get from the inspection paradox.
{{% /env %}}

{{% env type="note" style="plain" %}}
Although we have shown, under somewhat general conditions, there are further 
complications one could add to this model, for example, including 
probabilities that the service is running on a given day, or that we have 
found the appropriate bus stop in the first place. We will not cover these in 
this blog post, but are factors that one should consider if one was to model 
this problem more thoroughly.
{{% /env %}}

## Appendix

We now state the Key Renewal Theorem, a slight restatement of the result from 
{{< cite "Grimmett2020" >}} (pg. 418), and additionally provide a 
proof of the inspection paradox result.

{{% env type="theorem" title="Key Renewal Theorem" %}}
Let $(N (t))_{t \geqslant 0}$ be a renewal process with i.i.d. inter-renewal 
times $(H_{n})_{n \geqslant 1}$ having distribution $F_{H}$ with mean $\mu := 
\mathbb{E} (H) \in (0, \infty)$, and a renewal function $m (t) := \mathbb{E} 
(N (t))$. Let $h := [0, \infty) \rightarrow \mathbb{R}$ be a directly Riemann 
integrable function. Then the solution to the renewal equation

$$
 Z (t) = h (t) + \int_{0}^t Z (t - s) \mathrm{d} F_{H} (s)
$$

satisfies

$$
 \lim _{t \rightarrow \infty} Z (t) = \frac{1}{\mu} \int_{0}^{\infty} h (s)
   \mathrm{d} s
$$

provided $F_{H}$ is non-lattice (i.e. the support of $H$ is not contained in 
$d\mathbb{N}$ for any $d > 0$).
{{% /env %}}

{{% env type="proof" title="Inspection Paradox" %}}
The result follows by an application of the *Key Renewal Theorem*

{{% details %}}
Let $x \geqslant 0$ and define by $Z (t) := \mathbb{P} (W (t) > x)$ the 
probability that the waiting time at $t$ is greater than $x$. Then, by the law 
of total probability and conditioning on $H_{1} < t$, one can show that

$$
\begin{eqnarray}
  Z (t) & = & \mathbb{P} (H > t + x) + \int_{0}^t Z (t - s) \mathrm{d} 
F_{H}
  (s) . \nonumber
\end{eqnarray}
$$
<!-- split -->
This following by conditioning on $H_{1}$ and using the law of total 
probability. We partition the space into the events $\lbrace H_{1} > t 
\rbrace$ and $\lbrace H_{1} \leqslant t \rbrace$ and unravel

$$
\begin{eqnarray}
  Z (t) & = & \mathbb{P} (W (t) > x, H_{1} > t) +\mathbb{P} (W 
(t) > x, H_{1}
  \leqslant t) . \nonumber
\end{eqnarray}
$$

Case 1: $H_{1} > t$

If $H_{1} > t$, then $S_{1} = H_{1} > t$, and therefore $N (t) = 0$. 
Hence,

$$
\begin{eqnarray}
  W (t) & = & S_{N (t) + 1} - t = S_{1} - t = H_{1} - t \nonumber
\end{eqnarray}
$$

and $W (t) > x$ if and only if $H_{1} > t + x$. Hence

$$
\begin{eqnarray}
  \mathbb{P} (W (t) > x, H_{1} > t) & = & \mathbb{P} (H_{1} > t + 
x) \nonumber
\end{eqnarray}
$$

Case 2: $H_{1} \leqslant t$

If $H_{1} = s \leqslant t$ for some $s \in [0, t]$, i.e. the first bus arrives 
at some time before $t$, then a renewal occurs at time $s$. At this renewal 
point, $s$, the process restarts, and one can define a new renewal process 
$(\tilde{S}_{n})_{n \geqslant 0}$ such that $\tilde{S}_{0} = 0$, 
$\tilde{S}_{k} = H_{2} + \cdots + H_{k + 1}$. Equivalently, the waiting time 
at time $t$ can be described as $\tilde{W} (t) := W (t + s)$, which has the 
same distribution as $W (t)$. In particular, we can write

$$
\begin{eqnarray}
  \mathbb{P} (W (t) > x, H_{1} \leqslant t) & = & \int_{0}^t \mathbb{P} (W 
(t)
  \> x, H_{1} = s) \mathrm{d} F_{H} (s) \nonumber\\\
  & = & \int_{0}^t \mathbb{P} (W' (t - s) > x, H_{1} = s) \mathrm{d} F_{H}
  (s) \nonumber\\\
  & = & \int_{0}^t \mathbb{P} (W' (t - s) > x, \tilde{H}_{0} = s) 
\mathrm{d}
  F_{H} (s) \nonumber\\\
  & = & \int_{0}^t \mathbb{P} (W' (t - s) > x) \mathrm{d} F_{H} (s)
  \nonumber\\\
  & = & \int_{0}^t \mathbb{P} (W (t - s) > x) \mathrm{d} F_{H} (s)
  \nonumber\\\
  & = & \int_{0}^t Z (t - s) \mathrm{d} F_{H} (s) . \nonumber
\end{eqnarray}
$$

Combining both of the above cases, we get the desired result, after dropping 
the subscript on $H_{1}$, which is allowed as all $H_{i}$ are identically 
distributed.
{{% /details %}}

Letting

$$
 h (t) := \mathbb{P} (H > t + x) = 1 - F_{H} (t + x),
$$

places us in the format of the Key Renewal Theorem, which yields

$$
\begin{eqnarray}
  \lim _{t \rightarrow \infty} Z (t) & = & \frac{1}{\mu} \int_{0}^{\infty} h
  (s) \mathrm{d} s = \frac{1}{\mu} \int_{x}^{\infty} \mathbb{P} (H > u)
  \mathrm{d} u. \nonumber
\end{eqnarray}
$$

In particular,

$$
\begin{eqnarray}
  \lim _{t \rightarrow \infty} \mathbb{P} (W (t) \leqslant x) & = & 1 - \lim
  _{t \rightarrow \infty} \mathbb{P} (W (t) > x) \nonumber\\\
  & = & 1 - \frac{1}{\mu} \int_{x}^{\infty} \mathbb{P} (H > u) \mathrm{d} 
u
  \nonumber\\\
  & = & \frac{1}{\mu} \int_{0}^x \mathbb{P} (H > u) \mathrm{d} u 
\nonumber\\\
  & = & \frac{1}{\mu} \int_{0}^x (1 - F_{H} (u)) \mathrm{d} u =: F_{e} (x)
  \nonumber
\end{eqnarray}
$$

where we denote by $F_{e}$ the equilibrium distribution of the waiting time. 
The density of $F_{e}$ is

$$
 f_{e} (x) := \frac{1 - F_{H} (x)}{\mu} = \frac{\mathbb{P} (H > x)}{\mu}
   \qquad x \geqslant 0.
$$

Now, let $W$ denote a random variable with distribution $F_{e}$, i.e. the 
equilibrium waiting time. Then

$$
\begin{eqnarray}
  \mathbb{E} (W) & = & \int_{0}^{\infty} u f_{e} (u) \mathrm{d} u,
  \nonumber\\\
  & = & \frac{1}{\mu} \int_{0}^{\infty} u\mathbb{P} (H > u) \mathrm{d} u.
  \nonumber
\end{eqnarray}
$$

By Fubini's Theorem

$$
 \mathbb{E} [X^2] =\mathbb{E} \left[ \int_{0}^X 2 u \mathrm{d} u \right]
   =\mathbb{E} \left[ \int_{0}^{\infty} 2 u \boldsymbol{1}_{\lbrace u < X
   \rbrace} \mathrm{d} u \right] = \int_{0}^{\infty} 2 u\mathbb{P} (X > u)
   \mathrm{d} u
$$

which allows us to write

$$
\begin{eqnarray}
  \mathbb{E} (W) & = & \frac{1}{\mu} \int_{0}^{\infty} u\mathbb{P} (H > u)
  \mathrm{d} u \nonumber\\\
  & = & \frac{\mathbb{E} [H^2]}{2\mathbb{E} (H)} . \nonumber
\end{eqnarray}
$$

Finally, using the fact that $\mathbb{E} [H^2] =\mathbb{V} (H) +\mathbb{E} 
(H)^2$, we get

$$
\begin{eqnarray}
  \mathbb{E} (W) & = & \frac{\mathbb{E} (H)}{2} + \frac{\mathbb{V}
  (H)}{2\mathbb{E} (H)}, \nonumber
\end{eqnarray}
$$

precisely as required.
{{% /env %}}

{{< references >}}


