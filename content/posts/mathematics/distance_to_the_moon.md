---
math: true
date: "2026-05-01"
summary: >
    In light of the recent historic Artemis II launch to return to the Moon 
    for the first time in 50 years, I describe a simple computation of the 
    distance to the Moon from *almost* first principles.
title: "Distance to the Moon"
cover:
  src: /images/posts/mathematics/distance_to_the_moon/art002e009285.jpg
  alt: The Edge of Two Worlds
  link: https://www.nasa.gov/image-detail/amf-art002e009285/
  source: NASA
---

In light of the recent Artemis II {{< cite "ArtemisII2025" >}} mission to return to the Moon for 
the first time in 50 years, I describe a simple computation of the distance to 
the Moon from *almost* first principles. This is a different derivation from the 
one performed by the Greeks and that is well known throughout the literature, i.e. 
that performed by Aristarchus of Samos {{< cite "WikiAristarchus" >}} in 270 BC, and 
instead uses some relatively simple physics that many of us would have 
encountered in school.

In particular, with the use of a pendulum, a protractor, and some light 
physics, we get an approximation to the distance to the Moon within 1% 
accuracy of the true (average) value.

# 1 Physics

We begin with an outline of the physics that will be necessary for this derivation.

## 1.1 Newton's Law of Universal Gravitation

{{< tmfigure src="/images/posts/mathematics/distance_to_the_moon/nlg.svg" float="right" width="30%" dark-invert="true" >}}{{< /tmfigure >}}

For two bodies of masses $m_1, m_2$ that are a distance $r$ apart (distance 
between their centres of mass), the gravitational force exerted by one body 
onto the other is given by the following inverse-square law

\\[ F = \frac{G m_1 m_2}{r^2}, \\]

where $G$ is the gravitational constant - which we need not know.

<div class="clearfix"></div>

## 1.2 Newton's Second Law

{{< tmfigure src="/images/posts/mathematics/distance_to_the_moon/newton-second-law.svg" float="left" width="20%" dark-invert="true" >}}{{< /tmfigure >}}

Newton's second law states that the acceleration of a body, $a$, is directly 
proportional to the force experienced by it, $F$, and also inversely 
proportional to its mass, $m$; more commonly written as

\\[ F = m a. \\]

<div class="clearfix"></div>

## 1.3 Centripetal Force

{{< tmfigure src="/images/posts/mathematics/distance_to_the_moon/centripretal.svg" float="right" width="30%" dark-invert="true" >}}{{< /tmfigure >}}

From the kinematics of curved motion, it is known that for an object moving at 
tangential speed $v$ along a path with radius of curvature $r$, its acceleration
towards the centre of curvature is

\\[ a = \frac{v^2}{r} . \\]

Using $v = \omega r$, we can also write this in terms of the angular velocity $\omega = \frac{2 \pi}{T}$ for an orbital period of $T$. 

\\[ a = \frac{4 \pi^2 r}{T^2} . \\]

<div class="clearfix"></div>

## 1.4 Pendulum Period

{{< tmfigure src="/images/posts/mathematics/distance_to_the_moon/pendulum.svg" float="left" width="20%" dark-invert="true" >}}{{< /tmfigure >}}

The period of the swing of a simple pendulum, $T$, depends on the length of 
the pendulum string, $\ell$, and the strength of local gravity $g$ via

\\[ T = 2 \pi \sqrt{\frac{\ell}{g}} . \\]

<div class="clearfix"></div>

# 2 Formulation

Armed with the elementary physics described above, we can now construct a 
simple equation for the distance to the Moon, by only requiring the knowledge 
of very few parameters, that can be relatively easily measured!

Recall that on the surface of the Earth, we experience a gravitational 
acceleration $g$ (assume not yet known, but to be measured). Furthermore, by 
Newton's second law, the gravitational force experienced by a body on the 
surface of the Earth, with mass $M_B$, is given by $F = M_B g$.

Equivalently, via the inverse square law, this force may also be written as

\\[ F = \frac{G M_E M_B}{R_E^2} \\]

where $G$ denotes the universal gravitational constant (need not know), $M_E$ 
the mass of the Earth (need not know), and $R_E$ the radius of the Earth 
(assume not yet known, but to be measured). Equating these together and 
cancelling out $M_B$ yields the equation

<span id="eq-gE" class="tm-eqlabel"></span>
\begin{equation}
\label{eq-gE}\tag{1} g = \frac{G M_E}{R_E^2} .
\end{equation}

Now, instead of a body on the surface of the Earth, consider the Moon of mass, 
$M_M$, and the gravitational force exerted on the Moon by the Earth, $F_M$, 
which by Newton's second law would give $F_M = M_M a_M$, where $a_M$ denotes 
the acceleration towards the Earth experienced at the distance of the Moon. 
Similarly to the above, the inverse square law gives

\\[ F_M = \frac{G M_E M_M}{D^2} \\]

where $D$ denotes the distance between the centres of mass of the Earth and 
Moon. Equating these as before, and cancelling $M_M$, then gives

<span id="eq-gM" class="tm-eqlabel"></span>
\begin{equation}
\label{eq-gM}\tag{2} a_M = \frac{G M_E}{D^2} .
\end{equation}

In particular, equating across $G M_E$ with Equations [(1)](#eq-gE) and 
[(2)](#eq-gM), we get

<span id="eq-gMgE" class="tm-eqlabel"></span>
\begin{equation}
\label{eq-gMgE}\tag{3} a_M D^2 = g R_E^2,
\end{equation}

which already brings us much closer to the distance to the Moon.

Finally, observing that the Moon orbits roughly in a circular manner around 
the Earth, by the centripetal force equation, the centripetal acceleration 
(also the gravitation acceleration) experienced by the Moon can be expressed as

<span id="eq-aM" class="tm-eqlabel"></span>
\begin{equation}
\label{eq-aM}\tag{4} a_M = \frac{4 \pi^2 D}{T_M^2}
\end{equation}

where $T_M$ denotes the orbital period of the Moon, which common knowledge 
suggests to be roughly once a month (say 28 days). Substituting now the 
expression of $a_M$ from Equation [(4)](#eq-aM) into Equation [(3)](#eq-gMgE) 
yields

\\[ \left( \frac{4 \pi^2 D}{T_M^2} \right) D^2 = g R_E^2 \\]

and after solving for $D$, we get

<span id="eq-moon" class="tm-eqlabel"></span>
\begin{equation}
\label{eq-moon}\tag{5} D = \left( \frac{g T_M^2 R_E^2}{4 \pi^2}
\right)^{\frac{1}{3}} .
\end{equation}

A simple formula for the distance between the centres of mass of the Earth and 
the Moon. To get the precise distance to the Moon, i.e. from surface to 
surface, a little extra measurement is required to determine the radius of the 
Moon (this can be done by observing eclipses), but it does not change the 
answer by much.

# 3 Measurement

Having now obtained a simple formulaic expression of the distance to the Moon 
in Equation [(5)](#eq-moon), we notice that we require the knowledge of only a few 
constants, that I will show are easily measured.

{{% description %}}
{{% description-item title="$\boldsymbol{\pi}$" %}}
Known for millennia as roughly $3.14$, and can be confirmed and measured at home by hand, see the excellent videos by Matt Parker on his YouTube channel StandUpMaths {{< cite "ParkerPi2026" >}}. I will assume that this is known.
{{% /description-item %}}

{{% description-item title="$\boldsymbol{T_M}$" %}}
The orbital period of the Moon, i.e. how long it takes the Moon to orbit the Earth; known and observed to be roughly 28 days. I will assume that this is known.
{{% /description-item %}}

{{% description-item title="$\boldsymbol{g}$" %}}
The gravitational acceleration experienced on the surface of the Earth. An understanding of the value for $g$ has been known in the literature since 1651 by an account of Giovanni Battista Riccioli, although not in the common form of $9.81 \text{m s}^{- 2}$ as we know it today as this pre-dates the invention of the *metre*. Since this does not feel elementary, I will **not** assume that this is known, and we shall measure it directly using a *pendulum*, although dropping objects from a height and measuring the time it takes to drop can also be used.
{{% /description-item %}}

{{% description-item title="$\boldsymbol{R_E}$" %}}
The radius of the Earth has been accurately known since 240 BC (more than 2000 years ago!), the first method recorded in the literature is that of *Eratosthenes* {{< cite "WikiEratosthenes" >}}, which calculates the diameter of the Earth using the angle difference of shadows cast by the sun on a vertical rod at two different locations, and is determined to be roughly 6371 km. This also does not feel elementary, and therefore I will **not** assume this is known, and we shall measure it directly.
{{% /description-item %}}
{{% /description %}}

So we are left to measure only $g$ and $R_E$.

## 3.1 Gravitational Acceleration

The measurement of $g$ can be made in a number of ways, but one of the 
simplest is via the use of a pendulum (for me, a string connected to a spare piece of plastic acting as the bob to provide tension). The period of a (small) swing, $T$, of a simple pendulum of length $\ell$ is known to depend on the strength of local gravity $g$ via

\\[ T = 2 \pi \sqrt{\frac{\ell}{g}} . \\]

Solving for $g$, we get

\\[ g = \frac{4 \pi^2 \ell}{T^2} . \\]

Therefore, it remains to measure $g$ by measuring the length of a simple 
pendulum and the period of its swings.

For this, I perform the experiment at home under the parameters $\ell = 0.6 
m$, and I measure $T$ multiple times, $T_1, \ldots, T_n$, and compute 
corresponding $g_1, \ldots, g_n $ values. To reduce the noise in my 
computation, I select $g = \frac{1}{n} \sum_{i = 1}^n g_i$ to represent my estimator, i.e. the 
average of my observations. Doing so, I get the following measurements

\\[ \begin{array}{l|lll}
n & \ell [\text{m}] & T [\text{s}] & g [\text{m s}^{- 2}]\\\\
\hline
1 & 0.6 & 1.55 & 9.86\\\\
2 & 0.6 & 1.57 & 9.60\\\\
3 & 0.6 & 1.52 & 10.12
\end{array} \\]

yielding an average value $g = 9.86 \text{m s}^{- 2}$, which is close enough to the 
generally accepted value of $9.81 \text{m s}^{- 2}$, although this does vary slightly 
depending on where you are on the planet.

I should note that the experiment performed by me was not entirely under strict scientific conditions with the most accurate measurement tools, e.g. my phone camera and myself simply dropping the pendulum, although more rigorous approaches are encouraged.

## 3.2 Radius of the Earth

Regarding the radius of the Earth $R_E$, we may also compute this with a pendulum, although it becomes more physically challenging - you could measure $g$ at two different (known) heights above the surface of the Earth using the method above, and then via the inverse square law, can solve for $R_E$. Instead, we resort to the more traditional method of using the horizon.

Assume you stand on a tall object of height $h$ above the surface of the Earth, and measure 
the angle that the horizon makes versus when looking directly straight and 
perpendicular to where you are standing, calling this the drop angle, $\theta$. Drawing this 
out in a diagram, we notice that the point from which we are standing, the point on the horizon that we can see and the centre of the Earth make a right-angled triangle, with hypotenuse $R_E + h$, adjacent $R_E$, and the angle between the hypotenuse and the adjacent being $\theta$.

{{< tmfigure src="/images/posts/mathematics/distance_to_the_moon/earth-radius.svg" float="right" width="25%" dark-invert="true" >}}{{< /tmfigure >}}

By simple trigonometry (i.e. SOH**CAH**TOA), we can write

\begin{eqnarray}
\cos (\theta) & = & \frac{R_E}{R_E + h} . \nonumber
\end{eqnarray}

Solving for $R_E$ then gives us

\begin{eqnarray}
R_E & = & \frac{h \cos (\theta)}{1 - \cos (\theta)} . \nonumber
\end{eqnarray}

Currently being in Sydney, I decided to make this measurement from the *Sydney 
Tower Eye*, which has a viewing platform roughly $h = 250\text{m}$ from sea-level 
(which we can also measure independently through a similar technique). Taking 
my trusty protractor, here I used a level measurement app on my phone for convenience and precision, 
although any accurate protractor will do, I was able to measure (again, not under any form of strict scientific procedure) the following

\\[ \begin{array}{l|lll}
n & h [\text{m}] & \theta [\deg] & R_E [\text{m}]\\\\
\hline
1 & 250 & 0.50 & 6, 565, 404\\\\
2 & 250 & 0.45 & 5, 425, 918\\\\
3 & 250 & 0.48 & 7, 123, 937
\end{array} \\]

which yields an average value of $6, 371, 753 \text{m} \approx 6, 372\operatorname{km}$, roughly in line with the true value of $6350\operatorname{km}$.

# 4 Computation

Having now obtained values for $g, R_E$ and also knowing the value of $\pi$ 
and $T_M$

\begin{eqnarray}
\pi & = & 3.14 \nonumber\\\\\\
T_M & = & 28\operatorname{days}= 2, 419, 200 \text{s} \nonumber\\\\\\
g & = & 9.86\operatorname{ms}^{- 2} \nonumber\\\\\\
R_E & = & 6372\operatorname{km} \nonumber
\end{eqnarray}

we get the following estimate for the distance between the Earth and the Moon

```python
>>> g=9.86
>>> TM=28*24*60*60
>>> RE=6372*1000
>>> pi=3.14
>>> D = (g*(TM**2)*(RE)**2/(4*(pi)**2))**(1/3)
>>> print(f'{int(D/1000)}km')
390197km
```

Using this simple method, we get $\boldsymbol{D \approx 390, 197}$**km**, versus the 
true value of $\approx 385, 000\operatorname{km}$, with roughly 1% error of the 
true value - a truly remarkable result!


## Notes
- The diagrams in this post were made in Typst using the package **astro** {{< cite "AtayevAstro" >}} - a package I created motivated by the TikZ-planets package for $\LaTeX$.

{{< references >}}
