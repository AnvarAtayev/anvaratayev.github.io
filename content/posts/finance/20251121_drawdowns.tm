<TeXmacs|2.1.4>

<style|<tuple|article|british|number-europe|padded-paragraphs|hugo>>

<\body>
  <doc-data|<doc-title|Drawdown Formulas>|<\doc-date>
    November 21, 2025
  </doc-date>>

  The aim of this article is to record and add some references on the recent
  post by Gappy discussing a number of drawdown formulas, see the original
  post <cite-detail|Gappy2025|<hlink|here|https://byfire.substack.com/p/reading-writing-and-drawdown-arithmetic?r=abwpr&utm_medium=ios&triedRedirect=true>>
  - primarily to act as a keepsake for myself in the future. Some other
  useful references on this topic include
  <cite|Zhang2012|Salminen2025|Taylor1975>.

  <subsection*|Definitions>

  Assume you have a process (e.g. a capital stream)
  <math|X=<around*|(|X<rsub|t>|)><rsub|t>> described as a drifted Brownian
  motion with drift <math|\<mu\>\<gtr\>0> and volatility
  <math|\<sigma\>\<gtr\>0>, i.e. such that

  <\eqnarray>
    <tformat|<table|<row|<cell|\<mathd\>X<rsub|t>>|<cell|=>|<cell|\<mu\>
    \<mathd\>t+\<sigma\>\<mathd\>B<rsub|t>,>>|<row|<cell|X<rsub|0>>|<cell|=>|<cell|0,>>>>
  </eqnarray>

  where <math|<around*|(|B<rsub|t>|)><rsub|t\<gtr\>0>> denotes the standard
  Brownian motion with zero drift and unit variance. Then, the running
  maximum, and drawdown processes can be defined as

  <\eqnarray>
    <tformat|<table|<row|<cell|M<rsub|t>>|<cell|\<assign\>>|<cell|sup<rsub|0\<leqslant\>s\<leqslant\>t>X<rsub|t>,>>|<row|<cell|D<rsub|t>>|<cell|\<assign\>>|<cell|M<rsub|t>-X<rsub|t>,>>>>
  </eqnarray>

  where we note that the drawdown process
  <math|<around*|(|D<rsub|t>|)><rsub|t>> is non-negative.

  We introduce the following stopping time, for when the processes
  <math|X<rsub|t>> first hit some value <math|x\<in\>\<bbb-R\>>, which will
  be the emphasis of our discussions below

  <\eqnarray>
    <tformat|<table|<row|<cell|\<tau\><rsub|x><rsup|>>|<cell|\<assign\>>|<cell|inf<around*|{|t\<geqslant\>0\<of\>X<rsub|t>\<leqslant\>-x|}>,>>>>
  </eqnarray>

  <with|font-series|bold|Remark.> Here, for a process
  <math|<around*|(|X<rsub|t>|)><rsub|t>> that describes capital,
  <math|\<mu\>> can be interpreted as the expected daily PnL, and
  <math|\<sigma\>> as the daily volatility.

  In such a scenario, define the Sharpe ratio across a time horizon <math|T>
  (in business days) as <math|SR<rsub|T>\<assign\><frac|\<mu\>|\<sigma\>><sqrt|T>>
  and a period specific volatility as <math|\<sigma\><rsub|T>\<assign\>\<sigma\><sqrt|T>>.
  In addition, when considering a drawdown <math|-b>, for some
  <math|b\<geqslant\>0>, define the vol-normalised drawdown as
  <math|b<rsub|\<sigma\>>\<assign\><frac|b|\<sigma\>>>. Furthermore, for
  brevity, we write <math|SR<rsub|1>> as <math|SR>.

  <subsection*|Questions of Interest>

  We now concern ourselves with the following questions (slightly rephrased
  to improve clarity for my part). We begin with questions relating to the
  process <math|<around*|(|X<rsub|t>|)>> rather than the drawdown process
  <math|<around*|(|D<rsub|t>|)>>.

  <subsubsection*|Question 1: Hitting Probability at Any Time>

  <em|What is the hitting probability that the process <math|X<rsub|t>> hits
  a given limit at <with|font-series|bold|any> point in the future \U i.e.
  for <math|b\<gtr\>0>, what is <math|\<bbb-P\><around*|(|X<rsub|t>\<leqslant\>-b,<text|
  for some >t\<gtr\>0|)>>?>

  This is a classical problem in stochastic analysis, and can be treated in a
  number of ways. We provide here a simple proof utilising some existing
  theory.

  The hitting time probability can be restated into the following more
  tractable form

  <\eqnarray>
    <tformat|<table|<row|<cell|<around*|{|X<rsub|t>\<leqslant\>-b<text| for
    some >t\<gtr\>0|}>>|<cell|\<equiv\>>|<cell|<around*|{|\<exists\>t\<gtr\>0\<of\>X<rsub|t>\<leqslant\>-b|}>,>>|<row|<cell|>|<cell|\<equiv\>>|<cell|<around*|{|\<tau\><rsub|b>\<less\>\<infty\>|}>,>>>>
  </eqnarray>

  therefore <math|\<bbb-P\><around*|(|X<rsub|t>\<leqslant\>-b,<text| for some
  >t\<gtr\>0|)>=\<bbb-P\><around*|(|\<tau\><rsub|b>\<less\>\<infty\>|)>>.
  Using the monotone converge theorem, we can restate the problem once again
  into investigating the Laplace transform of <math|\<tau\><rsub|b>>

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-P\><around*|(|\<tau\><rsub|b>\<less\>\<infty\>|)>>|<cell|=>|<cell|\<bbb-E\><around*|(|<with|font-series|bold|1><rsub|<around*|{|\<tau\><rsub|b>\<less\>\<infty\>|}>>|)>>>|<row|<cell|<text|monotone
    convergence theorem >\<rightsquigarrow\>>|<cell|=>|<cell|lim<rsub|r\<rightarrow\>0<rsup|->>\<bbb-E\><around*|(|e<rsup|-r
    \<tau\><rsub|b>>|)>.>>>>
  </eqnarray>

  The Laplace transform of <math|\<tau\><rsub|b>> is well studied, and an
  explicit expression for this can be found in the reference book
  <cite-detail|Borodin2002|Equation 2.0.1, pg. 295>, or also accompanied with
  a proof in <cite-detail|Shreve2008|Theorem 8.3.2 pg. 346>. In particular,
  the references above state that for a drifted Brownian motion with drift
  <math|\<nu\>> and unit variance, i.e. <math|\<mathd\>Y<rsub|t>=\<nu\>
  \<mathd\>t+\<mathd\>B<rsub|t>> with <math|Y<rsub|0>=0>, the Laplace
  transform of the hitting probability <math|\<eta\><rsub|x>\<assign\>inf<around*|{|t\<geqslant\>0\<of\>T<rsub|t>\<leqslant\>-x|}>>
  for <math|x\<gtr\>0> is

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|(|e<rsup|-r\<eta\><rsub|x>>|)>>|<cell|=>|<cell|e<rsup|-<around*|(|\<nu\>+<sqrt|\<nu\><rsup|2>+2r>|)>x>.>>>>
  </eqnarray>

  Letting <math|X<rsub|t>=\<sigma\>Y<rsub|t>> with
  <math|\<mu\>=\<sigma\>\<nu\>>, we obtain (using the transformation
  <math|b=\<sigma\>x>)

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|(|e<rsup|-r\<tau\><rsub|b>>|)>>|<cell|=>|<cell|e<rsup|-<around*|(|<frac|\<mu\>|\<sigma\>>+<sqrt|<around*|(|<frac|\<mu\>|\<sigma\>>|)><rsup|2>+2r>|)><around*|(|<frac|b|\<sigma\>>|)>>>>|<row|<cell|>|<cell|=>|<cell|e<rsup|-<around*|(|<frac|\<mu\>+<sqrt|\<mu\><rsup|2>+2r\<sigma\><rsup|2>>|\<sigma\><rsup|2>>|)>b>.>>>>
  </eqnarray>

  Putting together, and taking the limit as <math|r\<rightarrow\>0<rsup|->>
  then yields

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-P\><around*|(|\<tau\><rsub|b>\<less\>\<infty\>|)>>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|1>|<cell|<text|if
    <math|\<mu\>\<leqslant\>0>>,>>|<row|<cell|e<rsup|-<frac|2\<mu\>b|\<sigma\><rsup|2>>>>|<cell|<text|if
    >\<mu\>\<gtr\>0,>>>>>>>>>
  </eqnarray>

  precisely as Gappy described. What this tells you is that if your drift is
  negative, you will almost surely hit the negative boundary, and with
  exponentially decreasing probability hit the negative boundary if your
  drift is positive. For <math|\<mu\>\<gtr\>0>, rewriting the above equation
  in terms of Sharpe, we see that

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-P\><around*|(|\<tau\><rsub|b>\<less\>\<infty\>|)>>|<cell|=>|<cell|e<rsup|-2b<rsub|\<sigma\>>SR>>>>>
  </eqnarray>

  i.e. the chance of hitting a lower boundary from a given starting point of
  zero decreases exponentially with Sharpe.

  <subsubsection*|Question 2: Hitting Probability Within a Given Time>

  <em|What is the hitting probability of a given drawdown limit
  <with|font-series|bold|within a given interval> \U i.e. for
  <math|b,T\<gtr\>0>, what is <math|\<bbb-P\><around*|(|X<rsub|t>\<leqslant\>-b,<text|
  for some >t\<in\><around*|[|0,T|)>|)>>?>

  In Question 1, we determined (or referred to the fact) that the Laplace
  transform of the stopping time <math|\<tau\><rsub|b>> can be described as

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|(|e<rsup|-r\<tau\><rsub|b>>|)>>|<cell|=>|<cell|e<rsup|-<around*|(|<frac|\<mu\>+<sqrt|\<mu\><rsup|2>+2r\<sigma\><rsup|2>>|\<sigma\><rsup|2>>|)>b>,<space|2em>r\<gtr\>0.>>>>
  </eqnarray>

  By uniqueness of the Laplace transform and distribution (also by uniqueness
  of the Moment Generating Functions, which is equivalent to the Laplace
  transform), <math|\<tau\><rsub|b>> is a random variable described by the
  <with|font-shape|italic|Inverse Gaussian distribution>
  <math|<text|IG><around*|(|<frac|b|\<mu\>>,<around*|(|<frac|b|\<sigma\>>|)><rsup|2>|)>>,
  see <cite|WikiIG2025>, which has conditional CDF

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-P\><around*|(|\<tau\><rsub|b>\<leqslant\>x\|\<tau\><rsub|b>\<less\>\<infty\>|)>>|<cell|=>|<cell|\<Phi\><around*|(|<frac|x\<mu\>-b|\<sigma\><sqrt|x>>|)>+e<rsup|<frac|2\<mu\>b|\<sigma\><rsup|2>>>\<Phi\><around*|(|<frac|-x\<mu\>-b|\<sigma\><sqrt|x>>|)>>>>>
  </eqnarray>

  with <math|\<Phi\>> denoting the standard normal distribution.

  Knowing this distribution, we can also determine a number of other facts
  relating to this hitting time. Restating the original probability in terms
  of the hitting time <math|\<tau\><rsub|b>>, we have

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-P\><around*|(|X<rsub|t>\<leqslant\>-b,<text|
    for some >t\<in\><around*|[|0,T|)>|)>>|<cell|=>|<cell|\<bbb-P\><around*|(|\<tau\><rsub|b>\<leqslant\>T,\<tau\><rsub|b>\<less\>\<infty\>|)>>>|<row|<cell|>|<cell|=>|<cell|\<bbb-P\><around*|(|\<tau\><rsub|b>\<less\>\<infty\>|)>\<bbb-P\><around*|(|\<tau\><rsub|b>\<leqslant\>T\|\<tau\><rsub|b>\<less\>\<infty\>|)>>>|<row|<cell|>|<cell|=>|<cell|e<rsup|-<frac|2\<mu\>b|\<sigma\><rsup|2>>><around*|[|\<Phi\><around*|(|<frac|T\<mu\>-b|\<sigma\><sqrt|T>>|)>+e<rsup|<frac|2\<mu\>b|\<sigma\><rsup|2>>>\<Phi\><around*|(|<frac|-T\<mu\>-b|\<sigma\><sqrt|T>>|)>|]>>>|<row|<cell|>|<cell|=>|<cell|\<Phi\><around*|(|<frac|-T\<mu\>-b|\<sigma\><sqrt|T>>|)>+e<rsup|-<frac|2\<mu\>b|\<sigma\><rsup|2>>>\<Phi\><around*|(|<frac|T\<mu\>-b|\<sigma\><sqrt|T>>|)>>>|<row|<cell|>|<cell|=>|<cell|\<Phi\><around*|(|-<frac|b<rsub|\<sigma\>>|<sqrt|T>>-SR<rsub|T>|)>+e<rsup|-2SR<rsub|T><frac|b<rsub|\<sigma\>>|<sqrt|T>>>\<Phi\><around*|(|-<frac|b<rsub|\<sigma\>>|<sqrt|T>>+SR<rsub|T>|)>>>>>
  </eqnarray>

  where we have restated the last equation in volatility units. One can check
  that as <math|T\<rightarrow\>\<infty\>>, the right hand side of the
  equation approaches <math|e<rsup|-<frac|2\<mu\>b|\<sigma\><rsup|2>>>>, the
  eventual hitting probability.

  <with|font-series|bold|Remark.> The probability of hitting the barrier
  <math|-b> within a finite <math|T> is given in two terms, where

  <\eqnarray>
    <tformat|<table|<row|<cell|\<Phi\><around*|(|<frac|-T\<mu\>-b|\<sigma\><sqrt|T>>|)>>|<cell|>|<cell|<text|The
    likelihood of the process being below the barrier <math|-b> at time
    <math|T>.>>>|<row|<cell|e<rsup|-<frac|2\<mu\>b|\<sigma\><rsup|2>>>\<Phi\><around*|(|<frac|T\<mu\>-b|\<sigma\><sqrt|T>>|)>>|<cell|>|<cell|<text|The
    discount applied to the probability due to effect of positive drift.>>>>>
  </eqnarray>

  <subsubsection*|Question 3: Distribution of Drawdown Values>

  We now move on to discuss drawdown probabilities, which are slightly more
  complicated, as they are path dependent, as the drawdown process
  <math|<around*|(|D<rsub|t>|)><rsub|t>> is derived from the joint
  distribution <math|<around*|(|M<rsub|t>,X<rsub|t>|)><rsub|t>>.\ 

  <em|What is the distribution of drawdown values?>

  Recall that the drawdown process <math|<around*|(|D<rsub|t>|)><rsub|t>>
  measures the current drop from the historical maximum, which is tracked by
  the process <math|<around*|(|M<rsub|t>|)><rsub|t>>. By manipulating, and
  integrating out the joint density, it can be determined that the
  probability that the drawdown at time <math|t\<less\>\<infty\>> is greater
  than <math|b\<gtr\>0> is\ 

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-P\><around*|(|D<rsub|t>\<geqslant\>b|)>>|<cell|=>|<cell|\<Phi\><around*|(|<frac|-t\<mu\>-b|\<sigma\><sqrt|t>>|)>+e<rsup|-<frac|2\<mu\>b|\<sigma\><rsup|2>>>\<Phi\><around*|(|<frac|t\<mu\>-b|\<sigma\><sqrt|t>>|)>,>>>>
  </eqnarray>

  and in particular, as time <math|t\<rightarrow\>\<infty\>>

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-P\><around*|(|D<rsub|\<infty\>>\<geqslant\>b|)>>|<cell|=>|<cell|e<rsup|-<frac|2\<mu\>b|\<sigma\><rsup|2>>>,>>|<row|<cell|>|<cell|=>|<cell|e<rsup|-2b<rsub|\<sigma\>>
    SR>,>>>>
  </eqnarray>

  i.e. <math|\<bbb-P\><around*|(|D<rsub|\<infty\>>\<leqslant\>b|)>=1-e<rsup|-<frac|2\<mu\>b|\<sigma\><rsup|2>>>>,
  and hence <math|D<rsub|\<infty\>>\<sim\>Exp<around*|(|<frac|2\<mu\>|\<sigma\><rsup|2>>|)>>.
  We have two remarkable things here, one is that the probability of a
  drawdown exceeding a certain threshold at a given time <math|t> is
  precisely the hitting time of the process <math|X<rsub|t>> of the barrier
  <math|-b>, and secondly that the complicated path dependent drawdown
  process, at large times, converges to the stationary Exponential
  distribution (even though <math|X<rsub|t>> itself is not stationary), see
  <cite|WikiExp2025>. The intuition here is that under the positive drift
  <math|\<mu\>\<gtr\>0>, <math|X<rsub|t>> drifts upwards, and at every time,
  it continues to hit new heights, which resets <math|D<rsub|t>> to zero,
  making it memoryless. Furthermore, in the sense of a capital process, a
  larger <math|SR> makes drawdowns exponentially less likely.

  Since the infinite time drawdown process follows an Exponential
  distribution with parameter <math|\<lambda\>=<frac|2\<mu\>|\<sigma\><rsup|2>>>,
  it directly follows (from the results regarding the distribution) that in
  the infinite time limit, the average drawdown is

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|(|D<rsub|\<infty\>>|)>>|<cell|=>|<cell|<frac|\<sigma\><rsup|2>|2\<mu\>>,>>|<row|<cell|<frac|\<bbb-E\><around*|(|D<rsub|\<infty\>>|)>|\<sigma\>>>|<cell|=>|<cell|<frac|1|2
    SR>,>>>>
  </eqnarray>

  where the last equation represents the value in volatility units.

  <subsubsection*|Question 4: Expected Recovery Time>

  <em|What is the expected recovery time from a given drawdown?>

  Assume that at time <math|t<rsup|\<ast\>>>, we are currently at a drawdown
  <math|-b> for some <math|b\<gtr\>0>, i.e. <math|D<rsub|t<rsup|\<ast\>>>=b>,
  and <math|M<rsub|t<rsup|\<ast\>>>=sup<rsub|0\<leqslant\>s\<leqslant\>t<rsub|0>>X<rsub|s>>.
  We want to determine the recovery time from this drawdown, i.e.

  <\eqnarray>
    <tformat|<table|<row|<cell|\<rho\><rsub|b>>|<cell|\<assign\>>|<cell|inf<around*|{|t\<geqslant\>0\<of\>D<rsub|t<rsup|\<ast\>>+t>=0<text|
    given >D<rsub|t<rsup|\<ast\>>>=b|}>.>>>>
  </eqnarray>

  Rewriting in terms of <math|X<rsub|t>>, we have\ 

  <\eqnarray>
    <tformat|<table|<row|<cell|\<rho\><rsub|b>>|<cell|=>|<cell|inf<around*|{|t\<geqslant\>0\<of\>X<rsub|t<rsup|\<ast\>>+t>=M<rsub|t<rsup|\<ast\>>>|}>>>|<row|<cell|>|<cell|=>|<cell|inf<around*|{|t\<geqslant\>0\<of\>X<rsub|t<rsup|\<ast\>>+t>-X<rsub|t<rsup|\<ast\>>>=M<rsub|t<rsup|\<ast\>>>-X<rsub|t<rsup|\<ast\>>>|}>>>|<row|<cell|>|<cell|=>|<cell|inf<around*|{|t\<geqslant\>0\<of\>X<rsub|t<rsup|\<ast\>>+t>-X<rsub|t<rsup|\<ast\>>>=b|}>>>|<row|<cell|<text|<math|<wide|X<rsub|t>|~>\<assign\>X<rsub|t<rsup|\<ast\>>+t>-X<rsub|t<rsup|\<ast\>>>>
    and Strong Markov Property>\<rightsquigarrow\>>|<cell|=>|<cell|inf<around*|{|t\<geqslant\>0\<of\><wide|X|~><rsub|t>=b|}>>>|<row|<cell|>|<cell|=>|<cell|inf<around*|{|t\<geqslant\>0\<of\><wide|X|~><rsub|t>\<geqslant\>b|}>>>>>
  </eqnarray>

  where the final line shows that <math|\<rho\><around*|(|b|)>> is simply the
  first passage hitting time of a fresh Brownian motion
  <math|<wide|X|~><rsub|t>> with <math|\<mathd\><wide|X|~><rsub|t>=\<mathd\>\<mu\>+\<sigma\>\<mathd\>B<rsub|t>>
  with <math|<wide|X|~><rsub|0>=0>. As we did for Questions 1 and 2, we can
  determine that as <math|\<mu\>> is positive, the probability of recovery is
  one in infinite time (as now the hitting boundary is above the starting
  point), and that <math|\<rho\><rsub|b>\<sim\>IG<around*|(|<frac|b|\<mu\>>,<around*|(|<frac|b|\<sigma\>>|)><rsup|2>|)>>.
  With this, the expected time for recovery can be computed as

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|(|\<rho\><rsub|b>|)>>|<cell|=>|<cell|<frac|b|\<mu\>>=<frac|b<rsub|\<sigma\>>|SR>.>>>>
  </eqnarray>

  What is interesting is that the expected recovery time is independent of
  the volatility of the process, even though one would intuitively think that
  the volatility has some action here. Instead, what you find is that the
  volatility instead dictates the variance of the recovery time

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-V\><around*|(|\<rho\><rsub|b>|)>>|<cell|=>|<cell|<frac|b\<sigma\><rsup|2>|\<mu\><rsup|3>>=<frac|b<rsub|\<sigma\>>|SR<rsup|3>>.>>>>
  </eqnarray>

  Something else one can notice here is the relation of the above identity to
  physics, i.e. if <math|\<mu\>> denotes the general
  <with|font-shape|italic|speed> of travel, and <math|b> the distance one
  needs to traverse, then the time taken can be calculated as
  <math|<frac|b|\<mu\>>>, which is precisely
  <math|\<bbb-E\><around*|(|\<rho\><rsub|b>|)>>.\ 

  <subsubsection*|Question 5: Expected Time in Drawdown>

  <em|What is the expected time spent in a drawdown?>

  This question is a little ambiguous. In explicit terms, the process
  <math|X<rsub|t>> is almost surely always in a drawdown, and therefore
  across a time <math|<around*|[|0,T|]>>, the expected time spent in a
  drawdown is <math|T>.

  However, what Gappy discusses here is not the above - instead, it is, given
  a random point in time, what is the expected time I should wait to recover
  from my current drawdown, i.e. the <with|font-shape|italic|expected
  remaining recovery time>.

  From the above, we determined that the expected time required to recover to
  the previous high, given that the current drawdown depth is <math|b> is
  <math|\<bbb-E\><around*|(|\<rho\><rsub|b>|)>>. Let
  <math|T<rsub|<text|obs>>> denote a random variable chosen uniformly across
  <math|<around*|(|0,T|)>> as <math|T\<rightarrow\>\<infty\>> (with <math|T>
  large enough such that <math|<around*|(|D<rsub|t>|)><rsub|t>> resembles the
  stationary distribution). At this moment, the current drawdown depth can be
  described as

  <\eqnarray>
    <tformat|<table|<row|<cell|D<rsub|<text|obs>>>|<cell|=>|<cell|M<rsub|T<rsub|<text|obs>>>-X<rsub|T<rsub|<text|obs>>>.>>>>
  </eqnarray>

  For the sake of simplicity, assume that
  <math|D<rsub|<text|obs>>\<sim\>D<rsub|\<infty\>>>, i.e. that the drawdown
  is distributed according to a stationary distribution. Define now
  <math|\<tau\><rsub|<text|remain>>>, the duration required for the process
  <math|X<rsub|t>> to return to the level of the maximum observed at time
  <math|T<rsub|<text|obs>>>, i.e.

  <\eqnarray>
    <tformat|<table|<row|<cell|\<tau\><rsub|<text|remain>>>|<cell|=>|<cell|inf<around*|{|t\<geqslant\>0\<of\>X<rsub|T<rsub|<text|obs>>+t>=M<rsub|T<rsub|<text|obs>>>|}>.>>>>
  </eqnarray>

  Then, we wish to determine <math|\<bbb-E\><around*|(|\<tau\><rsub|<text|remain>>|)>>,
  which using the law of total expectation, we can determine to be

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|(|\<tau\><rsub|<text|remain>>|)>>|<cell|=>|<cell|\<bbb-E\><rsub|D<rsub|<text|obs>>><around*|(|\<bbb-E\><around*|(|\<tau\><rsub|<text|remain>>\|D<rsub|<text|obs>>|)>|)>>>|<row|<cell|>|<cell|=>|<cell|\<bbb-E\><rsub|D<rsub|<text|obs>>><around*|(|<frac|D<rsub|<text|obs>>|\<mu\>>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|\<mu\>>\<bbb-E\><rsub|D<rsub|<text|obs>>><around*|(|D<rsub|<text|obs>>|)>>>|<row|<cell|<text|from
    above <math|\<bbb-E\><around*|(|D<rsub|\<infty\>>|)>=<frac|\<sigma\><rsup|2>|2\<mu\>>
    >>\<rightsquigarrow\>>|<cell|=>|<cell|<frac|1|\<mu\>><around*|(|<frac|\<sigma\><rsup|2>|2\<mu\>>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|\<sigma\><rsup|2>|2\<mu\><rsup|2>>=<frac|1|2><frac|1|SR<rsup|2>>.>>>>
  </eqnarray>

  More specifically, the expected time to wait to exit a given drawdown that
  you may find yourself in is inversely proportional to the square of the
  Sharpe ratio. For example, assume you have a strategy that has an
  annualised Sharpe of <math|\<xi\>>, i.e. <math|SR<rsub|260>=\<xi\>>, then,
  at any given drawdown, your expected recovery time (in business days) is

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|(|\<tau\><rsub|<text|remain>>|)>>|<cell|=>|<cell|<frac|1|2><frac|1|SR<rsup|2>>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|2><frac|1|<around*|(|<frac|SR<rsub|260>|<sqrt|260>>|)><rsup|2>>>>|<row|<cell|>|<cell|=>|<cell|<frac|130|\<xi\><rsup|2>>>>>>
  </eqnarray>

  which is 520bd (2y) for a <math|\<xi\>=0.5> strategy (quite a considerable
  time).

  <\bibliography|bib|tm-plain|../../../../../../Library/CloudStorage/Dropbox/Education/University_of_Warwick/BibliographyBibTex>
    <\bib-list|8>
      <bibitem*|1><label|bib-Borodin2002>Andrei<nbsp>N.<nbsp>Borodin<localize|
      and >Paavo Salminen. <newblock><with|font-shape|italic|Handbook of
      Brownian Motion - Facts and Formulae>. <newblock>Probability and Its
      Applications. Birkhäuser, Basel, 2002.<newblock>

      <bibitem*|2><label|bib-Gappy2025>Gappy. <newblock>Reading, Writing and
      Drawdown Arithmetic. <newblock>nov 2025.<newblock>

      <bibitem*|3><label|bib-Salminen2025>Paavo Salminen<localize| and
      >Pierre Vallois. <newblock>Drawdowns of Diffusions.
      <newblock><with|font-shape|italic|ESAIM: Probability and Statistics>,
      29:357-380, 2025.<newblock>

      <bibitem*|4><label|bib-Shreve2008>Steven Shreve. <newblock>Stochastic
      calculus for finance. 2: Continuous-time models. <newblock>Springer
      Finance Textbook. Springer, New York, NY, 2008.<newblock>

      <bibitem*|5><label|bib-Taylor1975>Howard<nbsp>M.<nbsp>Taylor.
      <newblock>A Stopped Brownian Motion Formula.
      <newblock><with|font-shape|italic|The Annals of Probability>, 3(2), apr
      1975.<newblock>

      <bibitem*|6><label|bib-WikiExp2025>Exponential distribution.
      <newblock><with|font-shape|italic|Wikipedia>, nov 2025.<newblock>

      <bibitem*|7><label|bib-WikiIG2025>Inverse Gaussian distribution.
      <newblock><with|font-shape|italic|Wikipedia>, may 2025.<newblock>

      <bibitem*|8><label|bib-Zhang2012>Hongzhong Zhang<localize| and >Olympia
      Hadjiliadis. <newblock>Drawdowns and the Speed of Market Crash.
      <newblock><with|font-shape|italic|Methodology and Computing in Applied
      Probability>, 14(3):739-752, sep 2012.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|page-medium|papyrus>
    <associate|page-screen-margin|false>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|?>>
    <associate|auto-2|<tuple|?|?>>
    <associate|auto-3|<tuple|?|?>>
    <associate|auto-4|<tuple|?|?>>
    <associate|auto-5|<tuple|?|?>>
    <associate|auto-6|<tuple|?|?>>
    <associate|auto-7|<tuple|?|?>>
    <associate|auto-8|<tuple|?|?>>
    <associate|bib-Borodin2002|<tuple|1|?>>
    <associate|bib-Gappy2025|<tuple|2|?>>
    <associate|bib-Salminen2025|<tuple|3|?>>
    <associate|bib-Shreve2008|<tuple|4|?>>
    <associate|bib-Taylor1975|<tuple|5|?>>
    <associate|bib-WikiExp2025|<tuple|6|?>>
    <associate|bib-WikiIG2025|<tuple|7|?>>
    <associate|bib-Zhang2012|<tuple|8|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Gappy2025

      Zhang2012

      Salminen2025

      Taylor1975

      Borodin2002

      Shreve2008

      WikiIG2025

      WikiExp2025
    </associate>
    <\associate|toc>
      <with|par-left|<quote|1tab>|Questions of Interest
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>