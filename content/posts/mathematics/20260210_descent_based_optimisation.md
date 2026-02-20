---
date: "2026-02-20"
math: true
refs: 
  - "Ruder2017"
  - "Cauchy1897"
  - "Robbins1951"
  - "Polyak1964"
  - "Qian1999"
  - "Nesterov1983"
  - "Koolen2017"
  - "Duchi2011"
  - "Hinton2012"
  - "Zeiler2012"
  - "Kingma2017"
  - "Reddi2018"
  - "Loshchilov2019"
summary: >
    We discuss gradient descent based optimisation algorithms, starting from 
    simple gradient descent and slowly making our way to the famous Adam 
    optimiser, motivating adaptations that lead to the optimisers along the 
    way.
title: "A Review of Descent Based Optimisation Algorithms"
---




# 1 Introduction

Let $f : \mathbb{R}^n \rightarrow \mathbb{R}$ denote a smooth function, then 
the aim of a general optimisation (minimisation) problem is to find $\min 
_{\theta} f (\theta)$ and the corresponding point(s) at which this minimum is 
attained $\theta^{\ast} := \operatorname{argmin}_{\theta} f (\theta)$. If the 
function is simple enough, we simply solve $\nabla f = 0$. Although, if $f$ is 
complex, and the derivative is not easy to solve, one widely used option is to 
take an iterative approach, i.e. find a sequence of points $(\theta _{k})_{k 
\in \mathbb{N}}$ such that as $\theta _{k} \rightarrow \theta^{\ast}$, we get 
$f (\theta _{k}) \rightarrow f (\theta^{\ast})$ as $k \rightarrow \infty$.

A general iterative approach can be classified as follows: find a sequence 
$(\theta _{k})_{k}, (\alpha _{k})_{k}, (\boldsymbol{g}_{k})_{k}$ such that

$$
\begin{eqnarray}
  \theta _{k + 1} & = & \theta _{k} + \boldsymbol{\alpha}_{k}
  \boldsymbol{d}_{k} \nonumber
\end{eqnarray}
$$

where $\boldsymbol{d}_{k} \in \mathbb{R}^n$ represents the direction that one 
needs to take to get to the next point, and $\boldsymbol{\alpha}_{k} \in 
\mathbb{R}^{n \times n}$ represents the scale (also known as learning-rate), 
i.e. the size of the step one needs to take in the direction 
$\boldsymbol{d}_{k}$ to reach the next point, where the next point $\theta 
_{k + 1}$ is slightly closer to the optimal solution $\theta^{\ast}$.

Given this classification, we are left with two free parameters, scale and 
direction. The question we ask ourselves now is, how should we choose these? 
The history of descent-based optimisation can be understood as a series of 
increasingly refined answers to this question. In this article, we outline the 
history of descent based algorithms, and outline their approaches, see 
{{< cite "Ruder2017" >}} for an additional summary.

# 2 Gradient Descent

We start with simple gradient descent (GD), also known as batch gradient 
descent (BGD) in machine learning literature, which was initially introduced 
by Cauchy in {{< cite "Cauchy1897" >}}.

Let $(\theta _{k})_{k}$ denote some sequence of parameters that we wish to 
define such that $\theta _{k} \rightarrow \theta^{\ast}$ as $k \rightarrow 
\infty$. If we assume that $\theta _{k + 1} = \theta _{k} + h$ for $h \in 
\mathbb{R}^n$ with $\| h \|$ small, then by the multivariate Taylor expansion, 
we have that

$$
 f (\theta _{k + 1}) = f (\theta _{k} + h) = f (\theta _{k}) + h^T \nabla f
   (\theta _{k}) +\mathcal{O} (\| h \|^2) .
$$

A natural choice of $h$ would be such that $h^T \nabla f (\theta _{k}) < 
0$, i.e. iterative steps make $f$ smaller (assuming that the first order 
expansion well approximates $f$). By Cauchy-Schwarz

$$
\begin{eqnarray}
  h^T \nabla f (\theta _{k}) & \geqslant & - \| h \|  \| \nabla f (\theta
  _{k}) \| \nonumber
\end{eqnarray}
$$

with equality holding when

$$
\begin{eqnarray}
  h & := & - \eta \frac{\nabla f (\theta _{k})}{\| \nabla f (\theta _{k}) \|}
  \nonumber
\end{eqnarray}
$$

for some $\eta > 0$, also called the learning rate. That is, the optimal 
direction for the greatest reduction in $f$ is the direction of steepest 
descent. Summarising, we get the following evolution equation

$$
\begin{eqnarray}
  \theta _{k + 1} & = & \theta _{k} - \alpha _{k} \nabla f (\theta _{k})
  \nonumber\\\
  \alpha _{k} & = & \frac{\eta}{\| \nabla f (\theta _{k}) \|} \nonumber
\end{eqnarray}
$$

for some free parameter $\eta > 0$. As $\eta$ is free, we may simplify 
this entirely, and consider instead $\alpha _{k}$ the free parameter, and 
write

$$
\begin{eqnarray}
  \theta _{k + 1} & = & \theta _{k} - \alpha \nabla f (\theta _{k}) \nonumber
\end{eqnarray}
$$

for some predefined learning rate $\alpha$.

{{% algorithm number="1" title="(Gradient Descent)" %}}
**Require:** $\alpha$: Step size

**Require:** $f (\theta)$:  Objective function with parameters $\theta$

**Require:** $\theta _{0}$: Initial parameter vector

$t \leftarrow 0$ (Initialise time-step)

**while** $\theta _{t}$ not converged do

{{% indent %}}
$t \leftarrow t + 1$

$g_{t} \leftarrow \nabla _{\theta} f_{t} (\theta _{t - 1})$ (Get gradients 
with respect to objective at time $t$)

$\theta _{t} \leftarrow \theta _{t - 1} - \alpha \cdot g_{t}$ (Update 
parameters)
{{% /indent %}}

**end while**

return $\theta _{t}$ (Resulting parameters)
{{% /algorithm %}}

{{% env type="example" number="1" title="Machine Learning" style="plain" %}}
<span id="ex-machine-learning"></span>In supervised 
learning, we are often given a dataset of $N$ samples $(x_{i}, y_{i})$. In 
such a scenario, we choose a model $h_{\theta} (x)$ parametrised by some 
$\theta \in \mathbb{R}^n$ and a loss function $\ell (h_{\theta} (x), y)$ that 
measures the prediction error made by the model. The empirical risk is the 
average loss over the training data

$$
\begin{eqnarray}
  f (\theta) & := & \frac{1}{N} \sum_{i = 1}^N \ell (h_{\theta} (x_{i}),
  y_{i}), \nonumber
\end{eqnarray}
$$

and the goal is to find $\theta^{\ast}$ that minimises this average loss. A 
simple batch gradient descent algorithm could then be written as

$$
\begin{eqnarray}
  \theta _{k + 1} & = & \theta _{k} - \alpha _{k}  \frac{1}{N} \sum_{i = 1}^N
  \nabla \ell (h_{\theta _{k}} (x_{i}), y_{i}) . \nonumber
\end{eqnarray}
$$

For large $N$, this would require $N$ gradient computations, which can be 
quite slow. Thankfully, there are remedies to this, which we discuss later 
under stochastic gradient descent and mini-batch gradient descent.
{{% /env %}}

### Pathologies

{{% description %}}
{{% description-item title="Sensitive to Learning Rate" %}}
The learning rate needs to be chosen carefully as to make sure convergence occurs, even for a convex function. If chosen too large, convergence does not occur, and if too small, convergence is slow.
{{% /description-item %}}

{{% description-item title="Locally Optimal" %}}
Solutions can often get stuck in local optima if the function is not convex, and therefore the approach is not necessarily the best to choose when seeking for globally optimal solutions. A simple way to address this is to employ noisy learning rates, i.e. set $\alpha = \eta + \varepsilon$ for some random noise $\varepsilon$.
{{% /description-item %}}

{{% description-item title="Inefficient" %}}
The approach can be computationally inefficient for large $n$ or for machine learning problems with large training data, i.e. large $N$.
{{% /description-item %}}
{{% /description %}}

# 3 Stochastic Gradient Descent

Gradient descent as described above requires the exact gradient $\nabla f$ at 
every step. In many settings this is either too expensive or impossible: the 
function $f$ may be an expectation over a large (or infinite) population, or 
it may be a sum over a dataset so large that evaluating every term at each 
iteration is impractical. A natural question arises: what happens if we 
replace the true gradient with a noisy estimate $g = \nabla f + \varepsilon$, 
where $\varepsilon$ is some noise can the algorithm still converge?

## 3.1 Robbins-Monro Conditions

Fortunately, for the many methods that rely on this core principle, the answer 
is yes, provided the learning rate is dynamic and is chosen appropriately. The 
seminal work of Robbins and Monro, {{< cite "Robbins1951" >}}, 
establishes that the iteration

$$
\begin{eqnarray}
  \theta _{k + 1} & = & \theta _{k} - \alpha _{k} g (\theta _{k}) \nonumber
\end{eqnarray}
$$

where $g$ is an unbiased estimator of $\nabla f$, i.e. $\mathbb{E} [g 
(\theta)] = \nabla f (\theta)$, converges to $\theta^{\ast}$ in probability 
provided the step sizes, $\alpha _{k} > 0$, satisfy the following three 
conditions:

1. $\sum_{k = 1}^{\infty} \alpha _{k} = \infty$. The total distance the 
   algorithm can travel must be unbounded.
1. $\sum_{k = 1}^{\infty} \alpha _{k}^2 < \infty$. The steps must 
   eventually shrink fast enough to damp out the noise.

These are referred to as the Robbins-Monro conditions. Together, the 
conditions create a tension: the step sizes must shrink but not too quickly. 
The canonical choice $\alpha _{k} = c / k$ for some constant $c > 0$ 
satisfies both, and is the most commonly used schedule in the stochastic 
approximation literature.

The Robbins-Monro result reveals that gradient descent is inherently robust to 
noise: convergence is preserved as long as the noise is unbiased and the 
learning rate decays appropriately. This observation opens the door to 
intentionally introducing noise, trading exactness for computational 
efficiency. This is precisely the idea behind stochastic gradient descent as 
it is used in modern machine learning: we do not merely tolerate noise in the 
gradient, we engineer it by subsampling the data.

## 3.2 Modern Interpretation

We now make the connection to machine learning concrete. Recall Example 
[1](#ex-machine-learning), where the objective is the empirical risk $f 
(\theta) = \frac{1}{N} \sum_{i = 1}^N \ell (h_{\theta} (x_{i}), y_{i})$. Batch 
gradient descent computes the full sum at every step, costing $\mathcal{O} 
(N)$ per iteration. SGD applies the Robbins-Monro framework by replacing the 
true gradient with a single-sample estimate: draw $\sigma \sim 
\operatorname{Uniform} \lbrace 1, \ldots, N \rbrace$ and set $g (\theta) = 
\nabla \ell (h_{\theta} (x_{\sigma}), y_{\sigma})$, giving the evolution 
equation

$$
\begin{eqnarray}
  \theta _{k + 1} & = & \theta _{k} - \alpha _{k} \nabla \ell (h_{\theta _{k}}
  (x_{\sigma (k)}, y_{\sigma (k)})) . \nonumber
\end{eqnarray}
$$

Indeed, we have that $g$ is an unbiased estimator of $\nabla f$, as

$$
 \mathbb{E} [g (\theta) | ((x_{i}, y_{i}))_{i = 1}^N] = \frac{1}{N} \sum_{j
   = 1}^N \nabla \ell (h_{\theta _{k}} (x_{j}), y_{j}) = \nabla f (\theta) .
$$

Now, instead of requiring one to compute the gradient at $N$ different points, 
one is only required to compute the gradient at one single point. This adds 
noise to the descent process towards the minimum, visually seen as a jitter in 
the optimal path, but with this increase in noise, we get a much more 
computationally efficient algorithm.

{{% algorithm number="2" title="(Stochastic Gradient Descent)" %}}
**Require:** $\alpha _{0}$: Initial step size

**Require:** $f (\theta) = \frac{1}{N} \sum_{i = 1}^N f_{i} (\theta)$: Stochastic 
objective function with parameters $\theta$

**Require:** $\theta _{0}$: Initial parameter vector

$t \leftarrow 0$ (Initialise time-step)

**while** $\theta _{t}$ not converged do

{{% indent %}}
$t \leftarrow t + 1$

$\alpha _{t} \leftarrow \varphi (\alpha _{t - 1}, \ldots, \alpha _{0})$ (Decay 
step size according to Robbins-Monro conditions)

$i_{t} \sim U \lbrace 1, \ldots, N \rbrace$ (Sample a data point uniformly at 
random)

$g_{t} \leftarrow \nabla _{\theta} f_{i_{t}} (\theta _{t - 1})$ (Get gradients 
with respect to stochastic objective at time $t$)

$\theta _{t} \leftarrow \theta _{t - 1} - \alpha _{t} \cdot g_{t}$ (Update 
parameters)
{{% /indent %}}

**end while**

return $\theta _{t}$ (Resulting parameters)
{{% /algorithm %}}

## 3.3 Mini Batch Optimisation

Mini-batch optimisation is a middle ground between batch gradient descent and 
stochastic gradient descent. While batch gradient descent requires the 
calculation of all $N$ gradients, and stochastic gradient descent requires 
only one, mini-batch gradient descent computes the gradient over a random 
subset of size $b$. The resulting estimator $g_{t} = \frac{1}{b} \sum_{i \in 
\mathcal{B}_{t}} \nabla f_{i} (\theta)$ is still unbiased, but its variance is 
reduced by a factor of $b$ relative to single-sample SGD, since 
$\operatorname{Var} (g_{t}) = \frac{1}{b} \operatorname{Var} (\nabla f_{i})$. 
This smoothens the convergence to the (local) optimum while keeping the 
per-step cost at $\mathcal{O} (b)$ rather than $\mathcal{O} (N)$. This 
approach is typically used when compute parallelisation is available, and in 
practice, $b$ is typically chosen as a power of 2 to exploit hardware 
parallelism on GPUs.

{{% algorithm number="3" title="(Mini-Batch Gradient Descent)" %}}
**Require:** $\alpha _{0}$: Initial step size

**Require:** $f (\theta) = \frac{1}{N} \sum_{i = 1}^N f_{i} (\theta)$: Stochastic 
objective function with parameters $\theta$

**Require:** $\theta _{0}$: Initial parameter vector

$t \leftarrow 0$ (Initialise time-step)

**while** $\theta _{t}$ not converged do

{{% indent %}}
$t \leftarrow t + 1$

$\alpha _{t} \leftarrow \varphi (\alpha _{t - 1}, \ldots, \alpha _{0})$ (Decay 
step size)

$\mathcal{B}_{t} \sim$Sample $b$ indices from $\lbrace 1, \ldots, N \rbrace$ 
without replacement

$g_{t} \leftarrow \frac{1}{b} \sum_{i \in \mathcal{B}_{t}} \nabla _{\theta} 
f_{i} (\theta _{t - 1})$ (Compute mini-batch gradient estimate)

$\theta _{t} \leftarrow \theta _{t - 1} - \alpha _{t} \cdot g_{t}$ (Update 
parameters)
{{% /indent %}}

**end while**

return $\theta _{t}$ (Resulting parameters)
{{% /algorithm %}}

### Pathologies

{{% description %}}
{{% description-item title="Oscillation" %}}
Suppose that our objective $f$ has narrow valleys with the optimum lying within that valley. Then, the gradient points mostly across the valley (towards the steep walls) and only weakly along it (towards the minimum). In particular, SGD will oscillate back and forth across the valley while making slow progress along it.
{{% /description-item %}}

{{% description-item title="Gradient Noise" %}}
In the stochastic setting $g_{k}$ fluctuates around $\nabla f (x_{k})$. These fluctuations cause the trajectory to jitter, particularly near the optimum.
{{% /description-item %}}
{{% /description %}}

Both pathologies share a common structure, the harmful components of the 
gradient (oscillations, noise) tend to change sign frequently, while the 
useful components (the persistent descent direction) are consistent across 
iterations. This suggests a natural fix, average the gradients over time. 
Components that are consistent will reinforce; components that oscillate or 
fluctuate will cancel.

# 4 Momentum and Adaptive Learning Rates

Returning to our general framework, SGD with a fixed or decaying scalar 
learning rate sets $\boldsymbol{\alpha}_{k} = \alpha _{k} I$ and 
$\boldsymbol{d}_{k} = - g_{k}$: it treats every coordinate identically and 
uses only the current gradient to choose its direction. The pathologies 
identified above suggest two independent avenues for improvement

1. improve the direction $\boldsymbol{d}_{k}$ by averaging gradients over 
   time,
1. improve the scale $\boldsymbol{\alpha}_{k}$ by adapting the learning rate 
   to each coordinate individually.

We address these in turn.

## 4.1 Directional Improvements - Momentum

The method of momentum, introduced by Polyak in {{< cite 
"Polyak1964" >}} and surveyed in {{< cite "Qian1999" >}}, is 
designed to accelerate learning in the face of the two pathologies described 
above: high-curvature oscillations and stochastic noise. The core idea is to 
replace the raw gradient $g_{k}$ with a running average of past gradients, 
which we call the velocity $m_{k}$. Because harmful components (oscillations, 
noise) change sign frequently, averaging cancels them out; because the useful 
descent direction is consistent, averaging reinforces it.

### 4.1.1 Exponential Moving Average

One of the simplest forms of temporal averaging is the exponential moving 
average (EMA). Define the velocity $m_{k}$ recursively as

$$
 m_{k} = \beta m_{k - 1} + (1 - \beta) g_{k}
$$

with $m_{0} = 0$ and $\beta \in [0, 1)$, where $\beta$ controls how much 
history to retain. Expanding the recursion gives the weighted sum of all past 
gradients

$$
\begin{eqnarray}
  m_{k} & = & (1 - \beta) \sum_{j = 1}^k \beta^{k - j} g_{j} . \nonumber
\end{eqnarray}
$$

The weights $(1 - \beta) \beta^{k - j}$ decay exponentially into the past: 
recent gradients contribute most, and the effective window of history is 
approximately $1 / (1 - \beta)$ steps (e.g. $\beta = 0.9$ averages roughly the 
last 10 gradients).

### 4.1.2 Polyak's Heavy Ball Method

The classical momentum formulation due to Polyak, see {{< cite 
"Polyak1964" >}}, uses a slightly different convention that absorbs the 
$(1 - \beta)$ factor into the learning rate:

$$
\begin{eqnarray}
  m_{k} & = & \beta m_{k - 1} + g_{k}, \nonumber\\\
  \theta _{k + 1} & = & \theta _{k} - \alpha m_{k} . \nonumber
\end{eqnarray}
$$

Expanding the second line reveals the structure

$$
\begin{eqnarray}
  \theta _{k + 1} & = & \underbrace{\theta _{k} - \alpha
  g_{k}}_{\text{classical SGD structure}} - \underbrace{\alpha \beta m_{k -
  1}}_{\text{momentum correction}} . \nonumber
\end{eqnarray}
$$

{{< tmfigure class="big-figure" marginal-caption="true" src="/images/posts/mathematics/20260210_descent_based_optimisation/fig-1.svg" width="50%">}}Figure 1.Polyak's heavy ball method. The update $\theta _{k + 1} = \theta 
_{k} - \alpha m_{k}$ decomposes as a parallelogram. The gradient step $- 
\alpha g_{k}$ (red) is evaluated at the current position $\theta _{k}$ plus 
the momentum correction $\alpha \beta m_{k - 1}$ (orange).{{</tmfigure>}}

Under this convention, the velocity expands as $m_{k} = \sum_{j = 1}^k 
\beta^{k - j} g_{j}$, which differs from the normalised EMA only by the factor 
$(1 - \beta)$. Since $\alpha$ is a free parameter, the two formulations yield 
identical trajectories after rescaling.

In practice, Polyak's convention is more common because the learning rate 
$\alpha$ decouples from $\beta$: the expansion $\theta _{k + 1} = \theta 
_{k} - \alpha g_{k} - \alpha \beta m_{k - 1}$ shows that $\alpha$ directly 
controls the per-gradient step size, and setting $\beta = 0$ recovers vanilla 
SGD with step size $\alpha$. By contrast, the normalised EMA gives an 
effective per-gradient step of $\alpha (1 - \beta)$, so changing $\beta$ 
implicitly changes the learning rate too.

{{% algorithm number="4" title="(SGD with Momentum (Polyak))" %}}
**Require:** $\alpha$: Step size

**Require:** $\beta  \in [0, 1)$: Momentum coefficient (typically 0.9)

**Require:** $f (\theta) = \frac{1}{N} \sum_{i = 1}^N f_{i} (\theta)$: Stochastic 
objective function with parameters $\theta$

**Require:** $\theta _{0}$: Initial parameter vector

$m_{0} \leftarrow 0$ (Initialise velocity)

$t \leftarrow 0$ (Initialise time-step)

**while** $\theta _{t}$ not converged do

{{% indent %}}
$t \leftarrow t + 1$

$i_{t} \sim U \lbrace 1, \ldots, N \rbrace$ (Sample data point)

$g_{t} \leftarrow \nabla _{\theta} f_{i_{t}} (\theta _{t - 1})$ (Compute 
stochastic gradient)

$m_{t} \leftarrow \beta \cdot m_{t - 1} + g_{t}$ (Update velocity)

$\theta _{t} \leftarrow \theta _{t - 1} - \alpha \cdot m_{t}$ (Update 
parameters)
{{% /indent %}}

**end while**

return $\theta _{t}$ (Resulting parameters)
{{% /algorithm %}}

### 4.1.3 Nesterov Accelerated Gradient

Nesterov proposed a subtle but important variant, see {{< cite 
"Nesterov1983" >}}. Standard momentum computes the gradient at the current 
position $\theta _{k}$ and then adds the momentum correction. Nesterov 
reverses the order, first apply the momentum to get a lookahead point, then 
compute the gradient there

$$
\begin{eqnarray}
  \tilde{\theta}_{k} & = & \theta _{k} - \alpha \beta m_{k - 1} \nonumber\\\
  m_{k} & = & \beta m_{k - 1} + \nabla f (\tilde{\theta}_{k}) \nonumber\\\
  \theta _{k + 1} & = & \theta _{k} - \alpha m_{k} . \nonumber\\\
  & = & \theta _{k} - \alpha \nabla f (\tilde{\theta}_{k}) - \alpha \beta
  m_{k - 1} \nonumber
\end{eqnarray}
$$

The intuition is corrective: since momentum will carry us to approximately 
$\tilde{\theta}_{k}$ anyway, we should evaluate the gradient where we are 
about to be, not where we currently are. If the momentum is overshooting (e.g. 
past a minimum), the gradient at the lookahead point already points back, 
providing an earlier course correction. For convex quadratics, this achieves 
the optimal convergence rate among first-order methods: $\mathcal{O} (1 / 
k^2)$ versus $\mathcal{O} (1 / k)$ for standard gradient descent.

{{< tmfigure class="big-figure" marginal-caption="true" src="/images/posts/mathematics/20260210_descent_based_optimisation/fig-2.svg" width="50%">}}Figure 2.Nesterov's accelerated gradient. Unlike Polyak's method, the gradient 
is not evaluated at $\theta _{k}$, but instead at the lookahead 
$\tilde{\theta}_{k} = \theta _{k} - \alpha \beta m_{k - 1}$ (purple), obtained 
by first applying the momentum correction. The dashed grey arrow shows where 
$- \nabla f (\theta _{k}) $ would point if we evaluated at the current 
position instead.{{</tmfigure>}}

## 4.2 Scaling Improvements

Having improved the direction with momentum, we now turn to the scale 
$\boldsymbol{\alpha}_{k}$. A single scalar learning rate treats every 
parameter identically, yet different parameters may live in very different 
landscapes. Some directions curve steeply and need small steps, while others 
are nearly flat and need large ones.

One could try to fix this with second-order information. Newton's method 
replaces the scalar $\alpha I$ with the inverse Hessian $H^{- 1}$, so that the 
step $\theta _{k + 1} = \theta _{k} - H^{- 1} \nabla f$ scales each gradient 
component by the inverse curvature along that direction. However, computing 
and inverting the $n \times n$ Hessian costs $\mathcal{O} (n^3)$, which is 
prohibitive in modern applications. The adaptive methods below take a 
different, cheaper approach: they use only first-order information to give 
each coordinate its own step size. The form of this scaling is not chosen by 
analogy with Newton, but emerges from a principled analysis of regret which 
appears in online optimisation.

### Regret and Per-Coordinate Step Sizes

SGD already has the structure of an online algorithm, that is, at each step 
$t$, we observe the stochastic gradient $g_{t} = \nabla f_{i_{t}} (\theta 
_{t})$ and must commit to $\theta _{t + 1}$ before seeing any future 
gradients. Because $g_{t}$ is stochastic, we cannot guarantee a loss reduction 
at every step. What can we guarantee instead?

A natural measure is regret, which is the total excess loss accumulated along 
our trajectory relative to the single best fixed point in hindsight

$$
 R_{T} := \sum_{t = 1}^T f_{t} (\theta _{t}) - \min _{\theta} \sum_{t = 1}^T
   f_{t} (\theta) .
$$

Regret is always non-negative, and an algorithm is considered good if $R_{T}$ 
grows sub-linearly in $T$, meaning the average per-step penalty $R_{T} / T 
\rightarrow 0$. Standard online gradient descent, with a scalar step size 
$\alpha _{t} = \alpha / \sqrt{t}$, achieves $R_{T} =\mathcal{O} \left( 
\sqrt{T} \right)$, but it treats every coordinate identically.

To allow per-coordinate step sizes, we generalise the update to $\theta _{t + 
1} = \theta _{t} - X g_{t}$, where $X =\operatorname{diag} (\alpha _{1}, 
\ldots, \alpha _{n})$ is a fixed positive-definite diagonal matrix (we will 
make it data-dependent momentarily).

{{% details %}}
For fixed $X$, a standard regret analysis gives the bound

$$
 R_{T} \leqslant \frac{1}{2} \sum_{i = 1}^n \frac{D_{i}^2}{\alpha _{i}} +
   \frac{1}{2} \sum_{i = 1}^n \alpha _{i} G_{T, i},
$$

where $D_{i} = \max _{t} | \theta _{t, i} - \theta _{i}^{\ast} |$ is the 
maximum distance coordinate $i$ travels from the optimum and $G_{T, i} = 
\sum_{t = 1}^T g_{t, i}^2$ is the accumulated squared gradient.
<!-- split -->
{{% env type="proof" %}}
Let each $f_{t}$ be convex. Fix coordinate $i$ and write $\delta _{t, i} = 
\theta _{t, i} - \theta _{i}^{\ast}$.

Step 1 (Convexity). Since $f_{t}$ is convex, $f_{t} (\theta _{t}) - f_{t} 
(\theta^{\ast}) \leqslant g_{t}^{\top} (\theta _{t} - \theta^{\ast}) = 
\sum_{i} g_{t, i} \delta _{t, i}$. It suffices to bound each $\sum_{t} g_{t, 
i} \delta _{t, i}$.

Step 2 (One-step identity). From the update rule, $\delta _{t + 1, i} = \delta 
_{t, i} - \alpha _{i} g_{t, i}$. Squaring both sides and rearranging,

$$
 g_{t, i} \delta _{t, i} = \frac{\delta _{t, i}^2 - \delta _{t + 1, i}^2}{2
   \alpha _{i}} + \frac{\alpha _{i} g_{t, i}^2}{2} .
$$

Step 3 (Telescope). Summing from $t = 1$ to $T$, the first term telescopes 
directly:

$$
 \sum_{t = 1}^T g_{t, i} \delta _{t, i} = \frac{\delta _{1, i}^2 - \delta
   _{T + 1, i}^2}{2 \alpha _{i}} + \frac{\alpha _{i}}{2} \sum_{t = 1}^T g_{t,
   i}^2 \leqslant \frac{D_{i}^2}{2 \alpha _{i}} + \frac{\alpha _{i} G_{T,
   i}}{2} .
$$

Summing over coordinates gives the stated bound.
{{% /env %}}
{{% /details %}}

The two terms are in direct tension: the first penalises small step sizes 
(slow progress towards $\theta^{\ast}$), the second penalises large step sizes 
(overshooting). The optimal $\alpha _{i}$ sits at the balance point, and 
crucially this balance is different for every coordinate.

Writing the bound in matrix form makes the minimisation transparent. With $G 
=\operatorname{diag} (G_{T, 1}, \ldots, G_{T, n})$ and $D^2 
=\operatorname{diag} (D_{1}^2, \ldots, D_{n}^2)$, the upper bound reads

$$
 R_{T} \leqslant \frac{1}{2} \operatorname{tr} (X^{- 1} D^2 + X G) .
$$

We minimise over all positive-definite $X$ (not just diagonal, the result 
happens to be diagonal when $G$ and $D^2$ are). Differentiating and setting to 
zero, $- X^{- 2} D^2 + G = 0$, giving the optimal choice of $X$, $X^{\ast} = D 
G^{- 1 / 2}$. In the diagonal case this is $\alpha _{i}^{\ast} = D_{i} / 
\sqrt{G_{T, i}}$, i.e. the optimal step size for coordinate $i$ is inversely 
proportional to the root accumulated gradient energy, for the non-diagonal 
case, see {{< cite "Koolen2017" >}}.

Of course $G_{T, i}$ is unknown at time $t < T$, but we can substitute 
the running estimate $G_{t, i} = \sum_{\tau = 1}^t g_{\tau, i}^2$ at each 
step, giving $\alpha _{t, i} = c_{i} / \sqrt{G_{t, i}}$ with $c_{i}$ a 
constant. This is monotonically decreasing and tied to the per-coordinate 
gradient energy. Directions with large or frequent gradients shrink their step 
size quickly, while directions with rare or small gradients preserve a large 
effective step size.

{{% details %}}
Substituting this time-varying step size into the (now time-varying) regret 
bound and optimising $c_{i}$ yields

$$
 R_{T} \leqslant \mathcal{O} \left( \sum_{i = 1}^n D_{i} \sqrt{\sum_{t =
   1}^T g_{t, i}^2} \right) .
$$
<!-- split -->
{{% env type="proof" %}}
We verify that $\alpha _{t, i} = c_{i} / \sqrt{G_{t, i}}$, with $G_{t, i} = 
\sum_{\tau = 1}^t g_{\tau, i}^2$, minimises the per-coordinate regret bound 
and derive the optimal constant $c_{i}$. For coordinate $i$, the bound 
contributes

$$
 R_{T, i} \leqslant \frac{D_{i}^2}{2 \alpha _{T, i}} + \frac{1}{2} \sum_{t =
   1}^T \alpha _{t, i} g_{t, i}^2 .
$$

Substituting $\alpha _{t, i} = c_{i} / \sqrt{G_{t, i}}$, the first term 
becomes $D_{i}^2 \sqrt{G_{T, i}} / (2 c_{i})$. For the second term, write 
$G_{t, i} = G_{t - 1, i} + g_{t, i}^2$ and observe

$$
 \frac{g_{t, i}^2}{\sqrt{G_{t, i}}} = \frac{G_{t, i} - G_{t - 1,
   i}}{\sqrt{G_{t, i}}} \leqslant 2 \left( \sqrt{G_{t, i}} - \sqrt{G_{t - 1,
   i}} \right),
$$

where the inequality uses $\sqrt{G_{t}} + \sqrt{G_{t - 1}} \leqslant 2 
\sqrt{G_{t}}$. Summing telescopes:

$$
 \sum_{t = 1}^T \frac{g_{t, i}^2}{\sqrt{G_{t, i}}} \leqslant 2 \sqrt{G_{T,
   i}} .
$$

So the second term is bounded by $c_{i} \sqrt{G_{T, i}}$. Combining,

$$
 \mathcal{R}_{T, i} \leqslant \sqrt{G_{T, i}} \left( \frac{D_{i}^2}{2 c_{i}}
   \+ c_{i} \right) .
$$

Minimising over $c_{i} > 0$ gives $c_{i} = D_{i} / \sqrt{2}$, and the 
per-coordinate contribution is $\sqrt{2} D_{i} \sqrt{G_{T, i}}$. Summing over 
coordinates,

$$
 R_{T} \leqslant \sqrt{2} \sum_{i = 1}^n D_{i} \sqrt{\sum_{t = 1}^T g_{t,
   i}^2} =\mathcal{O} \left( \sum_{i = 1}^n D_{i} \sqrt{\sum_{t = 1}^T g_{t,
   i}^2} \right) .
$$
{{% /env %}}
{{% /details %}}

### 4.2.1 AdaGrad

AdaGrad (Adaptive Gradient), see {{< cite "Duchi2011" >}}, implements 
exactly the step size derived above, absorbing the coordinate-specific 
constant into a global learning rate $\alpha$. It maintains the running sum 
$v_{t, i} = \sum_{\tau = 1}^t g_{\tau, i}^2$ and divides the learning rate for 
each coordinate by $\sqrt{v_{t, i}}$, plus a regularising constant 
$\varepsilon$, typically $10^{- 8}$ to avoid division by zero. Parameters that 
receive many large gradients accumulate a large denominator and take smaller 
steps, while parameters associated with rare features keep a small denominator 
and take larger steps.

{{% algorithm number="5" title="(AdaGrad)" %}}
**Require:** $\alpha$: Step size

**Require:** $f (\theta) = \frac{1}{N} \sum_{i = 1}^N f_{i} (\theta)$: Stochastic 
objective function with parameters $\theta$

**Require:** $\theta _{0}$: Initial parameter vector

$v_{0} \leftarrow 0$ (Initialise second moment estimate)

$t \leftarrow 0$ (Initialise time-step)

**while** $\theta _{t}$ not converged do

{{% indent %}}
$t \leftarrow t + 1$

$g_{t} \leftarrow \nabla _{\theta} f_{t} (\theta _{t - 1})$ (Get gradients 
with respect to stochastic objective at time $t$)

$v_{t} \leftarrow v_{t - 1} + g_{t}^2$ (Accumulate squared gradients)

$\theta _{t} \leftarrow \theta _{t - 1} - \alpha \cdot g_{t} / \left( 
\sqrt{v_{t}} + \varepsilon \right)$ (Update parameters)
{{% /indent %}}

**end while**

return $\theta _{t}$ (Resulting parameters)
{{% /algorithm %}}



The regret bound explains why AdaGrad excels with sparse data: if most 
gradient entries are zero for a given coordinate, that coordinate's $v_{t, i}$ 
stays small, so it retains a large effective step size and makes rapid 
progress on the rare occasions it does receive a gradient. However, the 
accumulator can only grow, so the effective learning rate $\alpha / 
\sqrt{v_{t}}$ monotonically decreases. For convex problems this is desirable, 
but in deep learning, the learning rate often shrinks to the point that 
training effectively stalls long before a good minimum is found, which is 
where the next variant, RMSProp comes in.

### 4.2.2 RMSProp

AdaGrad's regret guarantee relies on the accumulator $v_{t} = \sum_{\tau} 
g_{\tau}^2$ growing monotonically, ensuring the step size shrinks over time. 
This is well-suited to the convex, online setting for which it was designed, 
but in the non-convex landscapes of deep learning, the gradient distribution 
changes as the optimiser moves through different regions. Early gradients 
dominate $v_{t}$, leaving the step size permanently small even when the 
landscape has changed. RMSProp (Root Mean Square Propagation), introduced by 
Geoffrey Hinton in a Coursera course in 2012, see {{< cite 
"Hinton2012" >}}, fixes this by replacing the full-history sum with an 
exponential moving average, so that $v_{t}$ tracks the recent second moment of 
the gradient. This makes the scaling adaptive not just across coordinates but 
also across time: when the gradient landscape changes, outdated information is 
forgotten and the effective learning rate can recover.

{{% algorithm number="6" title="(RMSProp)" %}}
**Require:** $\alpha$: Step size

**Require:** $\beta \in [0, 1)$: Exponential decay rate for the second moment 
estimate

**Require:** $f (\theta) = \frac{1}{N} \sum_{i = 1}^N f_{i} (\theta)$: Stochastic 
objective function with parameters $\theta$

**Require:** $\theta _{0}$: Initial parameter vector

$v_{0} \leftarrow 0$ (Initialise second moment estimate)

$t \leftarrow 0$ (Initialise time-step)

**while** $\theta _{t}$ not converged do

{{% indent %}}
$t \leftarrow t + 1$

$g_{t} \leftarrow \nabla _{\theta} f_{t} (\theta _{t - 1})$ (Get gradients 
with respect to stochastic objective at time $t$)

$v_{t} \leftarrow \beta \cdot v_{t - 1} + (1 - \beta) g_{t}^2$ (Update biased 
second raw moment estimate)

$\theta _{t} \leftarrow \theta _{t - 1} - \alpha \cdot g_{t} / \left( 
\sqrt{v_{t}} + \varepsilon \right)$ (Update parameters)
{{% /indent %}}

**end while**

return $\theta _{t}$ (Resulting parameters)
{{% /algorithm %}}

### 4.2.3 AdaDelta

RMSProp solves AdaGrad's stale-accumulator problem but still requires a global 
learning rate $\alpha$. AdaDelta, see {{< cite "Zeiler2012" >}}, 
removes this hyper-parameter entirely by exploiting a dimensional argument.

Assign hypothetical units to the quantities involved: if $\theta$ has units 
$[\theta]$ and the loss $f$ has units $[f]$, then the gradient $g = \partial f 
/ \partial \theta$ has units $[f] / [\theta]$. A parameter update $\Delta 
\theta := \theta _{t + 1} - \theta _{t}$ must have units $[\theta]$, so any 
valid step-size multiplying $g$ must carry units $[\theta]^2 / [f]$. In 
RMSProp, the update is $- \alpha g / \sqrt{v} + \varepsilon$, and since 
$\sqrt{v}$ has units $[f] / [\theta]$ (it is an RMS gradient), $g / \sqrt{v}$ 
is dimensionless. That means $\alpha$ must carry all of $[\theta]$, but 
$\alpha$ is just a scalar we tune by hand, with no knowledge of these units.

AdaDelta fixes this by replacing $\alpha$ with a quantity that has the correct 
units by construction. Define the second-moment EMA of the gradients as in 
RMSProp, $v_{t} = \beta v_{t - 1} + (1 - \beta) g_{t}^2$, and additionally 
track a second-moment EMA of the parameter updates themselves: $\Delta _{t} := 
\beta \Delta _{t - 1} + (1 - \beta) (\theta _{t} - \theta _{t - 1})^2$ with 
$\Delta _{0} = 0$. Then $\sqrt{\Delta _{t - 1}}$ has units $[\theta]$ (it is 
an RMS parameter change) and $\sqrt{v_{t}}$ has units $[f] / [\theta]$ (an RMS 
gradient). Their ratio carries units $[\theta]^2 / [f]$, exactly what is 
needed to multiply $g$ and produce a step with units $[\theta]$.

{{% details %}}
The update therefore becomes

$$
 \theta _{t + 1} = \theta _{t} - \frac{\sqrt{\Delta _{t - 1} +
   \varepsilon}}{\sqrt{v_{t} + \varepsilon}} g_{t} .
$$
<!-- split -->
{{% env type="proof" %}}
We verify the unit balance. Writing $[\cdot]$ for “units of”:

* $g_{t}$: units $[f] / [\theta]$.
* $\sqrt{v_{t}}$: RMS of $g$, hence units $[f] / [\theta]$.
* $\sqrt{\Delta _{t - 1}}$: RMS of $\theta _{t} - \theta _{t - 1}$, hence 
  units $[\theta]$.

The ratio $\sqrt{\Delta _{t - 1}} / \sqrt{v_{t}}$ therefore has units 
$[\theta] / ([f] / [\theta]) = [\theta]^2 / [f]$. Multiplying by $g_{t}$ 
(units $[f] / [\theta]$) gives $[\theta]^2 / [f] \cdot [f] / [\theta] = 
[\theta]$, matching the units of $\Delta \theta$.
{{% /env %}}
{{% /details %}}

Two details deserve comment. First, $\Delta _{t - 1}$ (not $\Delta _{t}$) must 
appear in the numerator. At step $t$ the current update $\theta _{t + 1} - 
\theta _{t}$ has not yet been computed, so we use the most recent available 
running average. Second, the dimensional argument does not uniquely determine 
the numerator: any quantity with units $[\theta]$ would restore the balance 
(e.g. a fixed scale $D$, or $\| \theta _{t} - \theta _{0} \|$). Zeiler's 
choice of the RMS of recent parameter changes a local and adaptive option that 
aims to automatically reflect the current step scale without introducing a new 
hyper-parameter.

The role of $\varepsilon$ in the numerator is also worth noting. In the 
denominator, $\varepsilon$ prevents division by zero, as in RMSProp, although 
with $\varepsilon$ now inside the square root for stylistic reasons. In the 
numerator, it serves a different purpose: since $\Delta _{0} = 0$, without 
$\varepsilon$ the first update would be exactly zero, $\Delta _{1}$ would 
remain zero, and the method would never move. The $\varepsilon$ in the 
numerator bootstraps the algorithm: the initial effective learning rate is 
approximately $\sqrt{\varepsilon} / \sqrt{v_{1}}$, and once the parameters 
begin to move, $\Delta _{t}$ grows and takes over.

# 5 Modern Techniques

The previous section developed two independent improvements to gradient 
descent. Momentum smooths the direction by averaging over recent gradients, 
and adaptive methods such as RMSProp correct the scale by normalising each 
coordinate based on its recent gradient magnitude. Because these operate on 
different components of our general framework $\theta _{k + 1} = \theta _{k} + 
\boldsymbol{\alpha}_{k} \boldsymbol{d}_{k}$, a natural question is whether 
they can be combined.

## 5.1 Adam

Adam (Adaptive Moment Estimation), see {{< cite "Kingma2017" >}}, 
answers this question by maintaining two EMAs simultaneously: one over the 
gradient itself (the first moment $m_{t}$, as in Polyak momentum) and one over 
the squared gradient (the second moment $v_{t}$, as in RMSProp). The first 
moment sets the direction, and the second provides the per-coordinate 
normalisation that sets adaptive step sizes.

There is one subtlety. Both EMAs are initialised at zero, so in the first few 
iterations they are biased towards zero, underestimating the true moments. The 
bias is exactly the factor $(1 - \beta^t)$ that appears in the EMA expansion. 
At step $t$, the sum of the EMA weights is $(1 - \beta) \sum_{j = 0}^{t - 1} 
\beta^j = 1 - \beta^t$, which is less than 1 when $t$ is small. Dividing by 
this factor recovers an unbiased estimate. The correction is significant early 
on (for $\beta _{2} = 0.999$, the raw $v_{1}$ underestimates $\mathbb{E} 
[g^2]$ by a factor of 1000) and vanishes as $t \rightarrow \infty$.

{{% algorithm number="7" title="(Adam)" %}}
**Require:** $\alpha$: Step size

**Require:** $\beta _{1}, \beta _{2} \in [0, 1)$: Exponential decay rates for the 
moment estimates

**Require:** $f (\theta)$: Stochastic objective function with parameters $\theta$

**Require:** $\theta _{0}$: Initial parameter vector

$m_{0} \leftarrow 0$ (Initialise 1st moment vector)

$v_{0} \leftarrow 0$ (Initialise 2nd moment vector)

$t \leftarrow 0$ (Initialise time-step)

**while** $\theta _{t}$ not converged do

{{% indent %}}
$t \leftarrow t + 1$

$g_{t} \leftarrow \nabla _{\theta} f_{t} (\theta _{t - 1})$ (Get gradients 
with respect to stochastic objective at time $t$)

$m_{t} \leftarrow \beta _{1} \cdot m_{t - 1} + (1 - \beta _{1}) g_{t}$ (Update 
biased first moment estimate)

$v_{t} \leftarrow \beta _{2} \cdot v_{t - 1} + (1 - \beta _{2}) g_{t}^2$ 
(Update biased second raw moment estimate)

$\hat{m}_{t} \leftarrow m_{t} / (1 - \beta _{1}^t)$ (Compute bias-corrected 
first moment estimate)

$\hat{v}_{t} \leftarrow v_{t} / (1 - \beta _{2}^t)$ (Compute bias-corrected 
second raw moment estimate)

$\theta _{t} \leftarrow \theta _{t - 1} - \alpha \cdot \hat{m}_{t} / \left( 
\sqrt{\hat{v}_{t}} + \varepsilon \right)$ (Update parameters)
{{% /indent %}}

**end while**

return $\theta _{t}$ (Resulting parameters)
{{% /algorithm %}}

## 5.2 AMSGrad

Adam's use of an EMA for the second moment, inherited from RMSProp, brings a 
subtle trade-off. The EMA can forget large past gradients, causing $v_{t}$ to 
decrease over time. When this happens, the effective learning rate $\alpha / 
\sqrt{\hat{v}_{t}}$ increases, potentially destabilising the optimiser in 
regions where a smaller step would be appropriate. Reddi et al., {{< cite 
"Reddi2018" >}}, constructed simple convex counterexamples where this 
behaviour prevents Adam from converging.

AMSGrad addresses this with a minimal modification: replace the bias-corrected 
second moment with its running maximum,

$$
 \hat{v}_{t} = \max (\hat{v}_{t - 1}, v_{t} / (1 - \beta _{2}^t)),
$$

so that the denominator can only grow. This guarantees that the effective 
learning rate is non-increasing, restoring the convergence property that 
AdaGrad enjoys by construction. The parameter update is otherwise identical to 
Adam:

$$
 \theta _{t} = \theta _{t - 1} - \alpha \cdot \hat{m}_{t} / \left(
   \sqrt{\hat{v}_{t}} + \varepsilon \right) .
$$

In practice, the convergence failures that motivate AMSGrad are rare in 
typical deep learning settings, and Adam with well-chosen hyper-parameters 
often performs comparably. The fix does, however, illustrate a recurring 
tension in optimiser design: RMSProp's EMA was introduced to let the 
normalisation adapt over time, yet that very adaptivity can violate the 
monotonic decay of the learning rate that classical convergence proofs 
require. AMSGrad resolves this by keeping the adaptivity of the EMA estimate 
while enforcing monotonicity on the effective step size.

## 5.3 AdamW

In practice, optimisation is almost always combined with regularisation to 
prevent overfitting. The most common form is $L^2$ regularisation, which adds 
a penalty $\frac{\lambda}{2} \| \theta \|^2$ to the loss, giving a modified 
objective $\tilde{f} (\theta) = f (\theta) + \frac{\lambda}{2} \| \theta 
\|^2$. For SGD, the gradient of the penalty is $\lambda \theta$, so the update 
becomes

$$
 \theta _{t + 1} = \theta _{t} - \alpha (g_{t} + \lambda \theta _{t}) = (1 -
   \alpha \lambda) \theta _{t} - \alpha g_{t} .
$$

The factor $(1 - \alpha \lambda)$ shrinks the parameters towards zero at each 
step, which is why $L^2$ regularisation is often called *weight decay*. For 
SGD, the two formulations are equivalent (up to a rescaling of $\lambda$ by 
$\alpha$), and practitioners routinely treat them as interchangeable.

However, for adaptive methods this equivalence breaks down. To see why, 
consider what happens when we apply Adam to the regularised objective 
$\tilde{f} = f + \frac{\lambda}{2} \| \theta \|^2$. The gradient fed to Adam 
is $\tilde{g}_{t} = g_{t} + \lambda \theta _{t}$, which enters both the first 
and second moment estimates:

$$
\begin{eqnarray*}
  m_{t} & = & \beta _{1} m_{t - 1} + (1 - \beta _{1}) (g_{t} + \lambda \theta
  _{t})\\\
  v_{t} & = & \beta _{2} v_{t - 1} + (1 - \beta _{2}) (g_{t} + \lambda \theta
  _{t})^2 .
\end{eqnarray*}
$$

The second-moment estimate $v_{t}$ now absorbs $\lambda \theta _{t}$. After 
adaptive rescaling, the effective per-coordinate update for coordinate $i$ is 
proportional to

$$
 \frac{\hat{m}_{t, i}}{\sqrt{\hat{v}_{t, i}} + \varepsilon} =
   \frac{\operatorname{EMA} (g_{i} + \lambda \theta
   _{i})}{\sqrt{\operatorname{EMA} ((g_{i} + \lambda \theta _{i})^2)} +
   \varepsilon} .
$$

{{% details %}}
The adaptive scaling partially cancels the regularisation.
<!-- split -->
{{% env type="proof" %}}
Consider a parameter $\theta _{i}$ whose task gradient is consistently small 
($g_{t, i} \approx 0$) but whose regularisation gradient $\lambda \theta _{t, 
i}$ is large (the parameter has drifted far from zero). With $\tilde{g}_{t, i} 
\approx \lambda \theta _{t, i}$, both the numerator and denominator of the 
adaptive ratio are dominated by the same quantity:

$$
 \frac{\operatorname{EMA} (\lambda \theta _{i})}{\sqrt{\operatorname{EMA}
   (\lambda^2 \theta _{i}^2)} + \varepsilon} \approx \frac{\lambda \theta
   _{i}}{\lambda | \theta _{i} | + \varepsilon} \approx \operatorname{sign}
   (\theta _{i}) .
$$

The magnitude of the penalty gradient has been normalised away – the update is 
approximately $\pm \alpha$, regardless of how large $\lambda \theta _{i}$ is. 
The intended decay, which should pull $\theta _{i}$ towards zero in proportion 
to its magnitude, has been reduced to a constant-sized nudge. Conversely, a 
parameter with large task gradients has a large $v_{t, i}$ that dilutes the 
regularisation term even further.
{{% /env %}}
{{% /details %}}

Loshchilov and Hutter, {{< cite "Loshchilov2019" >}}, showed that 
this coupling is why Adam with $L^2$ regularisation often generalises worse 
than SGD with momentum on tasks such as image classification.

AdamW fixes this by decoupling the weight decay from the adaptive gradient 
step. Instead of regularising the loss, the decay is applied directly to the 
parameters, bypassing the adaptive scaling entirely:

$$
 \theta _{t} = \theta _{t - 1} - \alpha \cdot \hat{m}_{t} / \left(
   \sqrt{\hat{v}_{t}} + \varepsilon \right) - \alpha \lambda \theta _{t - 1} .
$$

The first term is the standard Adam step, computed from the unregularised 
gradient $g_{t} = \nabla f (\theta _{t})$ (not $\tilde{g}_{t}$). The second 
term applies the decay $\alpha \lambda \theta _{t - 1}$ uniformly to every 
parameter, independent of $v_{t}$. A parameter with a large value is always 
pulled back proportionally, regardless of its gradient history.

This has two practical benefits. First, the regularisation strength is no 
longer entangled with the second-moment statistics, so the decay acts as 
intended. Second, the optimal weight decay factor $\lambda$ becomes largely 
independent of the learning rate $\alpha$, simplifying hyper-parameter tuning. 
In Adam with $L^2$ regularisation, changing $\alpha$ implicitly changes the 
effective regularisation (since both interact through $v_{t}$), forcing a 
joint search. In AdamW, the two can be tuned separately. AdamW has since 
become the default optimiser in most modern deep learning frameworks.

{{< references >}}


