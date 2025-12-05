<TeXmacs|2.1.4>

<style|<tuple|article|british|number-europe|padded-paragraphs|preview-ref>>

<\body>
  <doc-data|<doc-title|German Tank Problem>>

  <subsection*|Introduction>

  In this article, we review the famous German Tank Problem which refers to
  the estimation of the number of German tanks in production on a monthly
  basis by the Allied forces based on observations of the serial numbers of
  tanks, either through capture or espionage. The original report discussing
  the details of this problem was performed by Ruggles and Brodie, see
  <cite|Ruggles1947>, and Figure <reference|fig:RGtable> for an extract of a
  table from the report depicting estimates for tank production both via
  statistical and intelligence means. Additionally, a proof of the estimators
  suggested to in the Ruggles and Brodie report was performed by Goodman, see
  <cite|Goodman1952>.

  <big-figure|<image|file:///Users/anvar/Desktop/CleanShot 2025-11-27 at
  14.40.04@2x.png|100|||>|<label|fig:RGtable>A table depicting estimated
  monthly German tank production via the use of statistics (Serial Number
  Estimate) and through American and British intelligence estimates
  (Munitions Record) versus the actual monthly production recorded by the
  German Speer Ministry, see <cite-detail|Ruggles1947|pg. 89>.>

  <subsubsection*|Problem Statement>

  In mathematical terms, assume that we have an unknown number <math|N> of
  German tanks being produced on a monthly basis, and that each tank is
  identified by a unique serial number. Assume further that the serial
  numbers can be mapped to the natural numbers (starting at one) whilst
  preserving order, where the order can be interpreted by the order in which
  they are produced. Assume further that we have observed <math|k> tanks and
  our aim now is to determine an estimator, <math|<wide|N|^>>, for <math|N>
  which is unknown.

  <subsection*|Estimation>

  Let <math|X<rsub|1>,\<ldots\>,X<rsub|k>> denote the random variables
  corresponding to the serial markings observed on German tanks. We assume
  that each <math|X<rsub|i>> is sampled uniformly from
  <math|<around*|{|1,\<ldots\>,N|}>> <with|font-series|bold|without>
  replacement. In particular, we have that for any
  <math|i\<in\><around*|{|1,\<ldots\>,k|}>>

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-P\><around*|(|X<rsub|i>|)>>|<cell|=>|<cell|<frac|1|N>.>>>>
  </eqnarray>

  Something to note is that, while the observations are identically
  distributed, they are <with|font-series|bold|not> independent since we
  assume no replacement (i.e. serial numbers are not reused).

  For the purpose of calculations below, as the order of the statistics is
  not relevant (we do not care in which order the serial numbers were
  obtained), we consider the order statistics
  <math|X<rsub|<around*|(|1|)>>\<less\>\<cdots\>\<less\>X<rsub|<around*|(|k|)>>>,
  which have a joint density

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-P\><around*|(|X<rsub|<around*|(|1|)>>=x<rsub|1>,\<ldots\>,X<rsub|<around*|(|k|)>>=x<rsub|k>|)>>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|<frac|1|<choose|N|k>>>|<cell|<text|if
    all >x<rsub|i><text| are distinct and lie within
    ><around*|{|1,\<ldots\>,N|}>,>>|<row|<cell|0>|<cell|<text|otherwise>.>>>>>>>>>
  </eqnarray>

  Now, there are numerous estimators that one could use for <math|N>, but one
  must be wary of if they are biased and be conscious of their variance.

  <subsubsection*|Maximum Observed Value>

  If the tank number is <math|50>, then we know that <math|N\<geqslant\>50>,
  therefore a naïve first estimate could be the maximum observed value.

  Let <math|M\<assign\>max<around*|{|X<rsub|1>,\<ldots\>,X<rsub|k>|}>=X<rsub|<around*|(|k|)>>>
  denote the random variable corresponding to the maximum observed value, and
  <math|<wide|N|^><rsub|<text|max>>=M> the estimator for <math|N>.

  We now wish to determine whether <math|<wide|N|^><rsub|max>> estimator is
  biased and what its variance could be, for which we need the density of
  <math|M>. Whilst it is true that <math|X<rsub|k>> is uniformly distributed,
  <math|X<rsub|<around*|(|k|)>>> is the ordered statistic, and is heavily
  biased towards larger values, and therefore is not uniformly distributed -
  therefore, we need to derive the density of <math|M>.

  Let <math|m\<in\><around*|{|1,\<ldots\>,N|}>>, then the total number of
  possible outcomes of our samplings is <math|<choose|N|k>>, and out of
  these, the total number of outcomes where the maximum is <math|m> is the
  number of ways of choosing <math|k-1> numbers below <math|m>, i.e.
  <math|<choose|m-1|k-1>>. Therefore

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-P\><around*|(|M=m|)>>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|<frac|<choose|m-1|k-1>|<choose|N|k>>>|<cell|<text|if
    >k\<leqslant\>m\<leqslant\>N,>>|<row|<cell|0>|<cell|<text|otherwise>.>>>>>.>>>>
  </eqnarray>

  Hence

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|(|M|)>>|<cell|=>|<cell|<big|sum><rsub|m=1><rsup|N>m\<bbb-P\><around*|(|M=m|)>,>>|<row|<cell|<text|after
    much simplification >\<rightsquigarrow\>>|<cell|=>|<cell|<frac|k|k+1><around*|(|N+1|)>,>>>>
  </eqnarray>

  and

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-V\><around*|(|M|)>>|<cell|=>|<cell|<frac|k<around*|(|N+1|)><around*|(|N-k|)>|<around*|(|k+1|)><rsup|2><around*|(|k+2|)>>.>>>>
  </eqnarray>

  In particular, we see that

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|(|<wide|N|^><rsub|<text|max>>|)>>|<cell|=>|<cell|<frac|k|k+1><around*|(|N+1|)>,>>|<row|<cell|>|<cell|=>|<cell|N-<around*|(|<frac|N-k|k+1>|)>\<less\>N,>>|<row|<cell|\<bbb-V\><around*|(|<wide|N|^><rsub|max>|)>>|<cell|=>|<cell|<frac|k<around*|(|N+1|)><around*|(|N-k|)>|<around*|(|k+1|)><rsup|2><around*|(|k+2|)>>,>>>>
  </eqnarray>

  i.e. that the estimator is biased, and will systematically underestimate
  <math|N>, with the underestimation gap becoming more severe with increasing
  <math|N>.

  <subsubsection*|Method of Moments>

  <\folded-env>
    We know that each <math|X<rsub|i>> is uniformly distributed across
    <math|<around*|{|1,\<ldots\>,N|}>>, and with that, for all
    <math|i\<in\><around*|{|1,\<ldots\>,k|}>>

    <\eqnarray>
      <tformat|<table|<row|<cell|\<mu\>\<assign\>\<bbb-E\><around*|(|X<rsub|i>|)>>|<cell|=>|<cell|<frac|N+1|2>,>>>>
    </eqnarray>

    giving us the identity <math|N=2\<mu\>-1>. If we are able to obtain an
    estimator for <math|\<mu\>>, we can also do so for <math|N>. Letting
    <math|<wide|X|\<bar\>>\<assign\><frac|1|k><around*|(|X<rsub|1>+\<cdots\>+X<rsub|k>|)>>
    denote the sample mean, <math|<wide|X|\<bar\>>> provides an unbiased
    estimator of <math|\<mu\>>, i.e.

    <\eqnarray>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|(|<wide|X|\<bar\>>|)>>|<cell|=>|<cell|\<mu\>>>>>
    </eqnarray>

    and indeed, with that, we are able to obtain the estimator
    <math|<wide|N|^><rsub|<text|MoM>>\<assign\>2<wide|X|\<bar\>>-1>, for
    which we have

    <\eqnarray>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|(|<wide|N|^><rsub|<text|MoM>>|)>>|<cell|=>|<cell|N,>>|<row|<cell|\<bbb-V\><around*|(|<wide|N|^><rsub|<text|MoM>>|)>>|<cell|=>|<cell|<frac|<around*|(|N+1|)><around*|(|N-k|)>|3k>.>>>>
    </eqnarray>
  <|folded-env>
    To compute <math|\<bbb-V\><around*|(|<wide|N|^><rsub|\<mu\>>|)>>, we
    proceed as follows

    <\eqnarray>
      <tformat|<table|<row|<cell|\<bbb-V\><around*|(|<wide|N|^><rsub|<text|MoM>>|)>>|<cell|=>|<cell|\<bbb-V\><around*|(|2<wide|X|\<bar\>>-1|)>=4\<bbb-V\><around*|(|<wide|X|\<bar\>>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|4|k<rsup|2>>\<bbb-V\><around*|(|<big|sum><rsub|i=1><rsup|k>X<rsub|i>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|4|k<rsup|2>><around*|[|<big|sum><rsub|i=1><rsup|k>\<bbb-V\><around*|(|X<rsub|i>|)>+<big|sum><rsub|1\<leqslant\>i\<neq\>j\<leqslant\>k>Cov<around*|(|X<rsub|i>,X<rsub|j>|)>|]>.>>>>
    </eqnarray>

    Since <math|X<rsub|i>> are discretely uniformly distributed, we have that
    for <math|i\<in\><around*|{|1,\<ldots\>,k|}>>

    <\eqnarray>
      <tformat|<table|<row|<cell|\<bbb-V\><around*|(|X<rsub|i>|)>>|<cell|=>|<cell|<frac|N<rsup|2>-1|12>.>>>>
    </eqnarray>

    Regarding the covariance,

    <\eqnarray>
      <tformat|<table|<row|<cell|Cov<around*|(|X<rsub|i>,X<rsub|j>|)>>|<cell|=>|<cell|\<bbb-E\><around*|(|X<rsub|i>X<rsub|j>|)>-\<bbb-E\><around*|(|X<rsub|i>|)>\<bbb-E\><around*|(|X<rsub|j>|)>>>|<row|<cell|>|<cell|=>|<cell|\<bbb-E\><around*|(|X<rsub|i>X<rsub|j>|)>-\<mu\><rsup|2>.>>>>
    </eqnarray>

    where <math|\<bbb-E\><around*|(|X<rsub|i>X<rsub|j>|)>> is the expected
    product of two distinct elements drawn from a population with no
    replacement. For some <math|m,n\<in\><around*|{|1,\<ldots\>,N|}>>

    <\eqnarray>
      <tformat|<table|<row|<cell|\<bbb-P\><around*|(|X<rsub|i>=m,X<rsub|j>=n|)>>|<cell|=>|<cell|\<bbb-P\><around*|(|X<rsub|i>=m|)>\<bbb-P\><around*|(|X<rsub|j>=n\|X<rsub|i>=m|)>>>|<row|<cell|>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|<frac|1|N>\<cdot\><frac|1|N-1>>|<cell|<text|if
      >m\<neq\>n,>>|<row|<cell|0>|<cell|<text|if >m=n.>>>>>>>>>
    </eqnarray>

    Note that the probability is not <math|<frac|1|<choose|N|2>>> since the
    statement <math|\<bbb-P\><around*|(|X<rsub|i>=m,X<rsub|j>=n|)>> assumes
    some order with respect to <math|i,j>, although,
    <math|\<bbb-P\><around*|(|X<rsub|<around*|(|i|)>>=m,X<rsub|<around*|(|j|)>>=n|)>=<frac|1|<choose|N|2>>><math|>.
    Continuing on, we get

    <\eqnarray>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|(|X<rsub|i>X<rsub|j>|)>>|<cell|=>|<cell|<big|sum><rsub|m=1><rsup|N><big|sum><rsub|n=1><rsup|N>m
      n \<bbb-P\><around*|(|X<rsub|i>=m,X<rsub|j>=n|)>
      >>|<row|<cell|>|<cell|=>|<cell|<frac|1|N<around*|(|N-1|)>><big|sum><rsub|1\<leqslant\>n\<neq\>m\<leqslant\>N>m
      n>>|<row|<cell|>|<cell|=>|<cell|<frac|1|N<around*|(|N-1|)>><around*|[|<around*|(|<big|sum><rsub|n=1><rsup|N>n|)><rsup|2>-<around*|(|<big|sum><rsub|n=1><rsup|N>n<rsup|2>|)>|]>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|N<around*|(|N-1|)>><around*|[|<around*|(|<frac|N<around*|(|N+1|)>|2>|)><rsup|2>-<around*|(|<frac|1|6>N<around*|(|N+1|)><around*|(|2N+1|)>|)>|]>>>|<row|<cell|>|<cell|=>|<cell|<frac|<around*|(|N+1|)><around*|(|3N+2|)>|12>.>>>>
    </eqnarray>

    Hence

    <\eqnarray>
      <tformat|<table|<row|<cell|Cov<around*|(|X<rsub|i>,X<rsub|j>|)>>|<cell|=>|<cell|<frac|<around*|(|N+1|)><around*|(|3N+2|)>|12>-<frac|<around*|(|N+1|)><rsup|2>|4>>>|<row|<cell|>|<cell|=>|<cell|-<frac|<around*|(|N+1|)>|12>>>>>
    </eqnarray>

    and

    <\eqnarray>
      <tformat|<table|<row|<cell|\<bbb-V\><around*|(|<wide|N|^><rsub|<text|MoM>>|)>>|<cell|=>|<cell|<frac|4|k<rsup|2>><around*|[|<big|sum><rsub|i=1><rsup|k>\<bbb-V\><around*|(|X<rsub|i>|)>+<big|sum><rsub|1\<leqslant\>i\<neq\>j\<leqslant\>k>Cov<around*|(|X<rsub|i>,X<rsub|j>|)>|]>>>|<row|<cell|>|<cell|=>|<cell|<frac|4|k<rsup|2>><around*|[|k\<bbb-V\><around*|(|X<rsub|1>|)>-k<around*|(|k-1|)><frac|<around*|(|N+1|)>|12>|]>>>|<row|<cell|>|<cell|=>|<cell|<frac|4|k><around*|[|<frac|N<rsup|2>-1|12>-<around*|(|k-1|)><frac|<around*|(|N+1|)>|12>|]>>>|<row|<cell|>|<cell|=>|<cell|<frac|<around*|(|N+1|)><around*|(|N-k|)>|3k>.>>>>
    </eqnarray>
  </folded-env>

  <subsubsection*|Maximum Likelihood>

  Denote by <math|<with|font-series|bold|x>=<around*|(|x<rsub|1>,\<ldots\>,x<rsub|k>|)>>
  an observed sample of serial numbers, and
  <math|\<b-X\>=<around*|(|X<rsub|1>,\<ldots\>,X<rsub|k>|)>>. Then for
  <math|N\<in\><around*|{|k,k+1,\<ldots\>|}>>, the likelihood function
  (representing the probability of observing this specific sample given a
  population size <math|N>) is defined as

  <\eqnarray>
    <tformat|<table|<row|<cell|L<around*|(|N\|<with|font-series|bold|x>|)>>|<cell|\<assign\>>|<cell|\<bbb-P\><around*|(|X<rsub|<around*|(|1|)>>=x<rsub|1>,\<ldots\>,X<rsub|<around*|(|k|)>>=x<rsub|k>\|N|)>,>>|<row|<cell|>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|<frac|1|<choose|N|k>>>|<cell|<text|if
    >N\<geqslant\>max<around*|{|x<rsub|1>,\<ldots\>,x<rsub|k>|}>,>>|<row|<cell|0>|<cell|<text|otherwise>.>>>>>>>>>
  </eqnarray>

  For brevity, in the following we write <math|L<around*|(|N|)>> to denote
  <math|L<around*|(|N\|<with|font-series|bold|x>|)>>. Now, we want to
  determine the maximum likelihood - the likelihood is strictly decreasing
  (since its reciprocal is strictly increasing) in <math|N>,

  <\eqnarray>
    <tformat|<table|<row|<cell|<frac|L<around*|(|N+1|)>|L<around*|(|N|)>>>|<cell|=>|<cell|1-<frac|k|N+1>\<less\>1>>>>
  </eqnarray>

  i.e. <math|L<around*|(|N+1|)>\<less\>L<around*|(|N|)>> for any
  <math|N\<geqslant\>max<around*|{|x<rsub|1>,\<ldots\>,x<rsub|k>|}>>.
  Therefore, the <math|N> which maximises the likelihood is
  <math|max<around*|{|x<rsub|1>,\<ldots\>,x<rsub|k>|}>>, giving the estimator

  <\eqnarray>
    <tformat|<table|<row|<cell|<wide|N|^><rsub|<text|MLE>>>|<cell|=>|<cell|max<around*|{|X<rsub|1>,\<ldots\>,X<rsub|k>|}>,>>>>
  </eqnarray>

  which we have covered above.

  <subsection*|\PBest\Q Estimators>

  A question one can ask themselves is, what is the
  <with|font-shape|italic|best> estimator to <math|N>? Well, this entirely
  depends on what is mean't by <with|font-shape|italic|best>. One common
  technique that is used in literature is finding estimators that minimise
  the mean squared error (MSE), although other loss functions can also be
  used, see Chapter 7.3.4 of <cite|Casella2002> for a discussion on the use
  of alternative loss functions.

  <\folded-env>
    <\definition*>
      The <em|mean squared error> of an estimator <math|W> of a parameter
      <math|\<theta\>> is

      <\eqnarray>
        <tformat|<table|<row|<cell|<text|MSE><around*|(|\<theta\>|)>>|<cell|\<assign\>>|<cell|\<bbb-E\><rsub|\<theta\>><around*|[|<around*|(|W-\<theta\>|)><rsup|2>|]>>>|<row|<cell|>|<cell|=>|<cell|\<bbb-V\><rsub|\<theta\>><around*|(|W|)>+<text|Bias><rsub|\<theta\>><around*|(|W|)><rsup|2>>>>>
      </eqnarray>

      where <math|<text|Bias><rsub|\<theta\>><around*|(|W|)>\<assign\>\<bbb-E\><rsub|\<theta\>><around*|(|W|)>-\<theta\>>.
    </definition*>
  <|folded-env>
    We prove the variance-bias identity via a simple expansion

    <\eqnarray>
      <tformat|<table|<row|<cell|<text|MSE><around*|(|\<theta\>|)>>|<cell|\<assign\>>|<cell|\<bbb-E\><rsub|\<theta\>><around*|[|<around*|(|W-\<theta\>|)><rsup|2>|]>>>|<row|<cell|>|<cell|=>|<cell|\<bbb-E\><rsub|\<theta\>><around*|[|<around*|(|W-\<bbb-E\><around*|(|W|)>+\<bbb-E\><around*|(|W|)>-\<theta\>|)><rsup|2>|]>>>|<row|<cell|>|<cell|=>|<cell|\<bbb-E\><rsub|\<theta\>><around*|[|<around*|(|W-\<bbb-E\><around*|(|W|)>|)><rsup|2>+<around*|(|\<bbb-E\><around*|(|W|)>-\<theta\>|)><rsup|2>+2<around*|(|W-\<bbb-E\><around*|(|W|)>|)><around*|(|\<bbb-E\><around*|(|W|)>-\<theta\>|)>|]>>>|<row|<cell|>|<cell|=>|<cell|\<bbb-E\><rsub|\<theta\>><around*|[|<around*|(|W-\<bbb-E\><around*|(|W|)>|)><rsup|2>|]>+<around*|(|\<bbb-E\><around*|(|W|)>-\<theta\>|)><rsup|2>+2\<bbb-E\><around*|[|<around*|(|W-\<bbb-E\><around*|(|W|)>|)><around*|(|\<bbb-E\><around*|(|W|)>-\<theta\>|)>|]>>>|<row|<cell|>|<cell|=>|<cell|\<bbb-V\><rsub|\<theta\>><around*|(|W|)>+<text|Bias><rsub|\<theta\>><around*|(|W|)><rsup|2>+2<around*|(|\<bbb-E\><around*|(|W|)>-\<bbb-E\><around*|(|W|)>|)><around*|(|\<bbb-E\><around*|(|W|)>-\<theta\>|)>>>|<row|<cell|>|<cell|=>|<cell|\<bbb-V\><rsub|\<theta\>><around*|(|W|)>+<text|Bias><rsub|\<theta\>><around*|(|W|)><rsup|2>>>>>
    </eqnarray>

    as required.
  </folded-env>

  Having defined the MSE, we can now search for an estimator that has the
  best MSE across all parameters <math|\<theta\>>. But this is not always
  possible, in fact, one can often find two estimators that outperform each
  other with respect to the MSE across different parameter ranges. The reason
  for this difficulty is that the space of all estimators is quite large.

  <subsubsection*|UMVUE>

  To obtain a <em|recommended> estimator, many resort to restricting to the
  space of unbiased estimators, i.e. those such that
  <math|\<bbb-E\><rsub|\<theta\>><around*|(|W|)>=\<theta\>>. In such a
  scenario, the MSE simply corresponds to the variance of the estimators, and
  therefore the estimators we seek are those that have uniformly smallest
  variance.

  Should I always use an unbiased estimator? No. In many cases, one can make
  a large improvement on the variance by forgiving some unbiasedness, and
  with that achieve a much better MSE. Although unbiased estimators as ideal,
  they are not always the best!

  <\definition*>
    <dueto|UMVUE>An estimator <math|W<rsup|\<ast\>>> is the
    <with|font-shape|italic|uniform minimum variance unbiased estimator>
    (UMVUE) of <math|\<theta\>> if it satisfies
    <math|\<bbb-E\><rsub|\<theta\>><around*|(|W<rsup|\<ast\>>|)>=\<theta\>>
    for all <math|\<theta\>>, and for any other estimator <math|W> with
    <math|\<bbb-E\><rsub|\<theta\>><around*|(|W|)>=\<theta\>>, we have
    <math|\<bbb-V\><rsub|\<theta\>><around*|(|W<rsup|\<ast\>>|)>\<leqslant\>\<bbb-V\><rsub|\<theta\>><around*|(|W|)>>
    for all <math|\<theta\>>.
  </definition*>

  Finding the UMVUE is not an easy task, it may not exist, and even if it
  does, it is difficult to know from first principles how to obtain one. It
  could be possible that from the estimators already obtained for a given
  problem, that at one of them is the UMVUE, but how can one know unless the
  inequality can be proven across all possible estimators.

  <subsubsection*|Cramér-Rao Inequality - A Short Detour>

  One way to get around the issue of knowing when to stop is to know first
  what is the lowest possible variance one could possible strive to obtain,
  and then check if your estimator attains this bound \U this is where the
  Cramér-Rao inequality comes in.

  <\theorem*>
    <dueto|Cramér-Rao Inequality>Let <math|X<rsub|1>,\<ldots\>,X<rsub|n>> be
    a sample with pdf <math|f<around*|(|<with|font-series|bold|x>\|\<theta\>|)>>,
    sample space <math|\<cal-X\>>, and parameter <math|\<theta\>>, and let
    <math|W<around*|(|\<b-X\>|)>=W<around*|(|X<rsub|1>,\<ldots\>,X<rsub|n>|)>>
    be any estimator satisfying

    <\eqnarray>
      <tformat|<table|<row|<cell|<frac|\<mathd\>|\<mathd\>\<theta\>>\<bbb-E\><rsub|\<theta\>><around*|(|W<around*|(|\<b-X\>|)>|)>>|<cell|=>|<cell|<big|int><rsub|\<cal-X\>><frac|\<partial\>|\<partial\>\<theta\>><around*|[|W<around*|(|<with|font-series|bold|x>|)>f<around*|(|<with|font-series|bold|x>\|\<theta\>|)>|]>
      \<mathd\><with|font-series|bold|x>,>>|<row|<cell|\<bbb-V\><rsub|\<theta\>><around*|(|W<around*|(|\<b-X\>|)>|)>>|<cell|\<less\>>|<cell|\<infty\>,>>>>
    </eqnarray>

    or equivalent for discrete random variables. Then

    <\eqnarray>
      <tformat|<table|<row|<cell|\<bbb-V\><rsub|\<theta\>><around*|(|W<around*|(|\<b-X\>|)>|)>>|<cell|\<geqslant\>>|<cell|<frac|<around*|(|<frac|\<mathd\>|\<mathd\>\<theta\>>\<bbb-E\><rsub|\<theta\>><around*|(|W<around*|(|\<b-X\>|)>|)>|)><rsup|2>|\<bbb-I\><rsub|\<theta\>><around*|(|\<b-X\>|)>>,>>>>
    </eqnarray>

    where <math|\<bbb-I\><rsub|\<theta\>>> is called the
    <with|font-shape|italic|information number>, or
    <with|font-shape|italic|Fischer information> of the sample, and is
    defined as

    <\eqnarray>
      <tformat|<table|<row|<cell|\<bbb-I\><rsub|\<theta\>><around*|(|\<b-X\>|)>>|<cell|\<assign\>>|<cell|\<bbb-E\><rsub|\<theta\>><around*|(|<around*|(|<frac|\<partial\>|\<partial\>\<theta\>>log
      f<around*|(|\<b-X\>\|\<theta\>|)>|)><rsup|2>|)>>>|<row|<cell|>|<cell|=>|<cell|\<bbb-E\><rsub|\<theta\>><around*|(|-<frac|\<partial\><rsup|2>|\<partial\>\<theta\><rsup|2>>log
      f<around*|(|\<b-X\>\|\<theta\>|)>|)>>>>>
    </eqnarray>
  </theorem*>

  <\corollary*>
    <dueto|Cramér-Rao Inequality - Unbiased Case>Let
    <math|X<rsub|1>,\<ldots\>,X<rsub|n>> be a sample with pdf
    <math|f<around*|(|<with|font-series|bold|x>\|\<theta\>|)>> and let
    <math|W<around*|(|\<b-X\>|)>=W<around*|(|X<rsub|1>,\<ldots\>,X<rsub|n>|)>>
    be an unbiased estimator with <math|\<bbb-V\><rsub|\<theta\>><around*|(|W<around*|(|\<b-X\>|)>|)>\<less\>\<infty\>>.
    Then

    <\eqnarray>
      <tformat|<table|<row|<cell|\<bbb-V\><rsub|\<theta\>><around*|(|W<around*|(|\<b-X\>|)>|)>>|<cell|\<geqslant\>>|<cell|<frac|1|\<bbb-I\><rsub|\<theta\>><around*|(|\<b-X\>|)>>.>>>>
    </eqnarray>
  </corollary*>

  The Cramér-Rao inequality is quite remarkable and also quite intuitive - it
  tells us that as more information is made available (i.e. as
  <math|\<bbb-I\><rsub|\<theta\>>> increases), we can, in theory, obtain
  estimators that have smaller and smaller variances. Although, the
  attainment is not guaranteed.

  If we have found an estimators that attains this bound, then we know
  (assuming that the conditions are met) that our estimator is optimal with
  respect to the variance, and is a UMVUE if it is also unbiased. Thankfully,
  the requirements for attainment of the Cramér-Rao bound are simple,
  although again, these requirements do not provide a means of constructing
  the optimal estimator.

  <\corollary*>
    <dueto|Attainment>Let <math|X<rsub|1>,\<ldots\>,X<rsub|n>> be a sample
    with pdf <math|f<around*|(|<with|font-series|bold|x>\|\<theta\>|)>> and
    let <math|W<around*|(|\<b-X\>|)>=W<around*|(|X<rsub|1>,\<ldots\>,X<rsub|n>|)>>
    be any estimator satisfying the Cramér-Rao conditions. Then
    <math|W<around*|(|\<b-X\>|)>> attains the Cramér-Rao lower bound if and
    only if there exists a function <math|a<around*|(|\<theta\>|)>> such that

    <\eqnarray>
      <tformat|<table|<row|<cell|a<around*|(|\<theta\>|)><around*|[|W<around*|(|<with|font-series|bold|x>|)>-\<theta\>|]>>|<cell|=>|<cell|<frac|\<partial\>|\<partial\>\<theta\>>log
      f<around*|(|<with|font-series|bold|x>\|\<theta\>|)><space|2em><text|for
      all >\<theta\>.>>>>
    </eqnarray>
  </corollary*>

  We should note that the key assumption of the Cramér-Rao theorem is the
  requirement that we can differentiate under the integral sign, a condition
  that needs to be checked and is not always true.

  Can we obtain a Cramér-Rao bound for our German tank problem?
  Unfortunately, no. For the German tank problem, we have

  <\eqnarray>
    <tformat|<table|<row|<cell|f<around*|(|x<rsub|1>,\<ldots\>,x<rsub|k>\|N|)>>|<cell|=>|<cell|<frac|1|<choose|N|k>><with|font-series|bold|1><rsub|<around*|{|max<around*|{|x<rsub|1>,\<ldots\>,x<rsub|k>|}>\<leqslant\>N|}>>,>>>>
  </eqnarray>

  in particular, the support of our density depends on our parameter
  <math|N>. Due to this, we cannot simply differentiate under the integral
  without taking into consideration the boundary terms of the support. Let
  <math|S<rsub|N>\<assign\><around*|{|<with|font-series|bold|x>=<around*|{|x<rsub|1>,\<ldots\>,x<rsub|k>|}>\|max<around*|(|<with|font-series|bold|x>|)>\<leqslant\>N|}>>
  denote the support of <math|f>, then, by the Leibniz rule for
  differentiating an integral (apply counting measure and proceed usually),
  for any estimator <math|W> of <math|N>

  <\eqnarray>
    <tformat|<table|<row|<cell|<frac|\<mathd\>|\<mathd\>N>\<bbb-E\><around*|(|W<around*|(|<with|font-series|bold|x>|)>|)>>|<cell|=>|<cell|
    <big|sum><rsub|<with|font-series|bold|x>\<in\>S<rsub|N>>W<around*|(|<with|font-series|bold|x>|)><frac|\<mathd\>|\<mathd\>N>f<around*|(|<with|font-series|bold|x>\|N|)>+<text|Boundary
    Terms>>>>>
  </eqnarray>

  where the Boundary Terms come from the dependence of the support on the
  parameter <math|N>, and are non-zero. As such, the Cramér-Rao bounds do not
  apply.

  <subsubsection*|Constructing the UMVUE>

  Thankfully, there exists some developed theory for constructing
  <with|font-shape|italic|better> unbiased estimators (those with lower
  variance), and also the UMVUE. Before we state these results, we need to
  understand what is a <with|font-shape|italic|sufficient statistic>.

  A sufficient statistic for a parameter <math|\<theta\>> is a statistic
  that, in a certain sense, captures all the information about
  <math|\<theta\>> contained in the sample, i.e. if
  <math|T<around*|(|\<b-X\>|)>> is a sufficient statistic for
  <math|\<theta\>>, then any inference about <math|\<theta\>> should depend
  on the sample <math|\<b-X\>> only through the value of
  <math|T<around*|(|\<b-X\>|)>>.

  <\definition*>
    <dueto|Sufficient Statistic>A statistic <math|T<around*|(|\<b-X\>|)>> is
    a <with|font-shape|italic|sufficient statistic> for <math|\<theta\>> if
    the conditional distribution of the sample <math|\<b-X\>> given the value
    of <math|T<around*|(|\<b-X\>|)>> does not depend on <math|\<theta\>>.
  </definition*>

  How can we know if we have a sufficient statistic? For this, there is a
  simple result called the Factorisation Theorem, see
  <cite-detail|Casella2002|Theorem 6.2.6>, that allows to us to quickly
  identify such statistics.

  <\theorem*>
    <dueto|Factorisation Theorem>Let <math|f<around*|(|<with|font-series|bold|x>\|\<theta\>|)>>
    denote the joint pdf of a sample <math|\<b-X\>>. A statistic
    <math|T<around*|(|\<b-X\>|)>> is a sufficient statistic for
    <math|\<theta\>> if and only if there exists functions
    <math|g<around*|(|t\|\<theta\>|)>> and
    <math|h<around*|(|<with|font-series|bold|x>|)>> such that, for all sample
    points <math|<with|font-series|bold|x>> and all parameters
    <math|\<theta\>>

    <\equation*>
      f<around*|(|<with|font-series|bold|x>\|\<theta\>|)>=g<around*|(|T<around*|(|<with|font-series|bold|x>|)>\|\<theta\>|)>
      h<around*|(|<with|font-series|bold|x>|)>.
    </equation*>
  </theorem*>

  Through the concept of sufficiency, we arrive at the remarkable result by
  Rao-Blackwell, see <cite-detail|Casella2002|Theorem 7.3.17>, which allows
  us to improve upon <with|font-series|bold|any> unbiased estimator if one
  has access to any sufficient statistic for <math|\<theta\>>, no matter how
  crude. This process of applying the Rao-Blackwell theorem is called
  <with|font-shape|italic|Rao-Blackwellisation>.

  <\theorem*>
    <dueto|Rao-Blackwell>Let <math|W> be any unbiased estimator of
    <math|\<theta\>>, and <math|T> be a sufficient statistic for
    <math|\<theta\>>. Define by <math|\<phi\><around*|(|T|)>\<assign\>\<bbb-E\><around*|(|W\|T|)>>.
    Then <math|\<bbb-E\><rsub|\<theta\>><around*|(|\<phi\><around*|(|T|)>|)>=\<theta\>>
    and <math|\<bbb-V\><rsub|\<theta\>><around*|(|\<phi\><around*|(|T|)>|)>\<leqslant\>\<bbb-V\><rsub|\<theta\>><around*|(|W|)>>
    for all <math|\<theta\>>, that is <math|\<phi\><around*|(|T|)>> is a
    uniformly <with|font-series|bold|better> unbiased estimator of
    <math|\<theta\>> (note, <math|\<phi\>> is not necessarily the UMVUE).\ 
  </theorem*>

  How about if I wanted to construct the UMVUE, and not just improve upon my
  estimator? For that, we rely on the concept of
  <with|font-shape|italic|completeness> and the Lehmann-Scheffé theorem, see
  <cite-detail|Casella2002|Theorem 7.3.19, Theorem 7.3.23, Theorem 7.5.1>
  which also tells us that any UMVUE is <with|font-series|bold|unique>!

  <\definition*>
    <dueto|Completeness>Let <math|f<around*|(|t\|\<theta\>|)>> be a family of
    densities for a statistic <math|T<around*|(|\<b-X\>|)>>. The family of
    probability distributions is called <with|font-shape|italic|complete> if
    <math|\<bbb-E\><rsub|\<theta\>><around*|(|g<around*|(|T|)>|)>=0> for all
    <math|\<theta\>> implies <math|\<bbb-P\><rsub|\<theta\>><around*|(|g<around*|(|T|)>=0|)>=1>
    for all <math|\<theta\>>. Equivalently, <math|T<around*|(|\<b-X\>|)>> is
    called a <with|font-shape|italic|complete statistic>.
  </definition*>

  <\theorem*>
    <dueto|Lehmann-Scheffé>Let <math|T> be a complete sufficient statistic
    for a parameter <math|\<theta\>>, and let <math|\<phi\><around*|(|T|)>>
    be any estimator based only on <math|T> such that
    <math|\<bbb-E\><around*|(|\<phi\><around*|(|T|)>|)>=\<theta\>>. Then
    <math|\<phi\><around*|(|T|)>> is the <with|font-series|bold|unique> UMVUE
    of <math|\<theta\>>.
  </theorem*>

  That is, if we are able to find a complete sufficient statistic of our
  parameter <math|\<theta\>>, then by conditioning any estimator on this
  statistic will necessarily yield the UMVUE.

  <subsubsection*|Back to the German Tank Problem>

  Having determined how to obtain the UMVUE, we now move to construct it for
  the German tank problem. Recall the estimators that we determined for
  <math|N>, in particular <math|<wide|N|^><rsub|MoM>> and
  <math|<wide|N|^><rsub|max>>,

  <\eqnarray>
    <tformat|<table|<row|<cell|<wide|N|^><rsub|MoM>>|<cell|=>|<cell|2<wide|X|\<bar\>>-1,>>|<row|<cell|\<bbb-E\><around*|(|<wide|N|^><rsub|MoM>|)>>|<cell|=>|<cell|N,>>|<row|<cell|\<bbb-V\><around*|(|<wide|N|^><rsub|MoM>|)>>|<cell|=>|<cell|<frac|<around*|(|N+1|)><around*|(|N-k|)>|3k>.>>>>
  </eqnarray>

  and

  <\eqnarray>
    <tformat|<table|<row|<cell|<wide|N|^><rsub|max>>|<cell|=>|<cell|max<around*|{|x<rsub|1>,\<ldots\>,x<rsub|k>|}>,>>|<row|<cell|\<bbb-E\><around*|(|<wide|N|^><rsub|max>|)>>|<cell|=>|<cell|N-<around*|(|<frac|N-k|k+1>|)>,>>|<row|<cell|\<bbb-V\><around*|(|<wide|N|^><rsub|max>|)>>|<cell|=>|<cell|<frac|k<around*|(|N+1|)><around*|(|N-k|)>|<around*|(|k+1|)><rsup|2><around*|(|k+2|)>>.>>>>
  </eqnarray>

  The first question we ask is, can we improve either of these via
  conditioning, i.e. via Rao-Blackwellisation? We can if at least one of our
  estimators is sufficient.

  We start with checking <math|<wide|N|^><rsub|MoM>>. Recalling the
  Factorisation Theorem, to show that an estimator is sufficient, it suffices
  to determine if we can factorise the density
  <math|f<around*|(|<with|font-series|bold|x>\|N|)>> into

  <\eqnarray>
    <tformat|<table|<row|<cell|f<around*|(|<with|font-series|bold|x>\|N|)>>|<cell|=>|<cell|h<around*|(|<with|font-series|bold|x>|)>
    g<around*|(|<with|font-series|bold|x>,<wide|N|^><rsub|MoM>|)>>>>>
  </eqnarray>

  for some <math|h,g>. Knowing that

  <\eqnarray>
    <tformat|<table|<row|<cell|f<around*|(|<with|font-series|bold|x>\|N|)>>|<cell|=>|<cell|\<bbb-P\><around*|(|X<rsub|<around*|(|1|)>>=x<rsub|1>,\<ldots\>,X<rsub|<around*|(|k|)>>=x<rsub|k>\|N|)>=<frac|1|<choose|N|k>><with|font-series|bold|1><rsub|<around*|{|max<around*|{|x<rsub|1>,\<ldots\>,x<rsub|k>|}>\<leqslant\>N|}>>>>>>
  </eqnarray>

  we see that it is not possible to write the indicator
  <math|><math|<with|font-series|bold|1><rsub|<around*|{|max<around*|{|x<rsub|1>,\<ldots\>,x<rsub|k>|}>\<leqslant\>N|}>>>
  solely in terms of <math|<wide|X|\<bar\>>>, and therefore also not solely
  in terms of <math|<wide|N|^><rsub|MoM>>, therefore
  <math|<wide|N|^><rsub|MoM>> is <with|font-series|bold|not> sufficient.

  Although, looking at the density, we see that the estimator
  <math|<wide|N|^><rsub|max>> is sufficient, as one can write

  <\eqnarray>
    <tformat|<table|<row|<cell|f<around*|(|<with|font-series|bold|x>\|N|)>>|<cell|=>|<cell|<frac|1|<choose|N|k>><with|font-series|bold|1><rsub|<around*|{|<wide|N|^><rsub|max><around*|(|<with|font-series|bold|x>|)>\<leqslant\>N|}>>>>>>
  </eqnarray>

  and choosing <math|h\<equiv\>1> and <math|g<around*|(|<with|font-series|bold|x>,<wide|N|^><rsub|max>|)>=<frac|1|<choose|N|k>><with|font-series|bold|1><rsub|<around*|{|<wide|N|^><rsub|max><around*|(|<with|font-series|bold|x>|)>\<leqslant\>N|}>>>
  gives us the required factorisation.

  So what does this all mean? Although <math|<wide|N|^><rsub|MoM>> is not a
  sufficient statistic, it is unbiased (unlike <math|<wide|N|^><rsub|max>>),
  so we can condition it with the sufficient statistic
  <math|<wide|N|^><rsub|max>> to obtain a uniformly better unbiased estimate
  than <math|<wide|N|^><rsub|MoM>>.

  For brevity, let <math|M=<wide|N|^><rsub|max>> and define
  <math|\<phi\><around*|(|m|)>\<assign\>\<bbb-E\><around*|(|<wide|N|^><rsub|MoM>\|M=m|)>>
  for some <math|m\<in\><around*|{|k,k+1,\<ldots\>|}>>. Then, as an
  estimator, <math|\<phi\>> can be written as

  <\eqnarray>
    <tformat|<table|<row|<cell|\<phi\><around*|(|M|)>>|<cell|=>|<cell|\<bbb-E\><around*|(|2<wide|X|\<bar\>>-1\|M|)>,>>|<row|<cell|>|<cell|=>|<cell|<frac|2|k><big|sum><rsub|i=1><rsup|k>\<bbb-E\><around*|(|X<rsub|i>\|M|)>-1.>>>>
  </eqnarray>

  By the law of total expectation,

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|(|X<rsub|i>\|M=m|)>>|<cell|=>|<cell|\<bbb-E\><around*|(|X<rsub|i>\|M=m,X<rsub|i>=m|)>\<bbb-P\><around*|(|X<rsub|i>=m|)>+\<bbb-E\><around*|(|X<rsub|i>\|M=m,X<rsub|i>\<neq\>m|)>\<bbb-P\><around*|(|X<rsub|i>\<neq\>m|)>>>|<row|<cell|>|<cell|=>|<cell|m<frac|1|k>+<frac|1+<around*|(|m-1|)>|2><frac|k-1|k>>>|<row|<cell|>|<cell|=>|<cell|<frac|m<around*|(|k+1|)>|2k>,>>>>
  </eqnarray>

  which allows us to write the estimator <math|\<phi\><around*|(|M|)>> as

  <\eqnarray>
    <tformat|<table|<row|<cell|\<phi\><around*|(|M|)>>|<cell|=>|<cell|<frac|2|k><big|sum><rsub|i=1><rsup|k>\<bbb-E\><around*|(|X<rsub|i>\|M|)>-1,>>|<row|<cell|>|<cell|=>|<cell|M<around*|(|<frac|k+1|k>|)>-1.>>>>
  </eqnarray>

  In particular, by the Rao-Blackwell theorem, we have obtained the estimator
  <math|<wide|N|^><rsub|RB>\<assign\>\<phi\><around*|(|M|)>=M<around*|(|<frac|k+1|k>|)>-1>
  which provides a uniformly better unbiased estimator than
  <math|<wide|N|^><rsub|MoM>>.

  Indeed, we can see that

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|(|<with|font-series|bold|><wide|N|^><rsub|RB>|)>>|<cell|=>|<cell|\<bbb-E\><around*|(|M|)><around*|(|<frac|k+1|k>|)>-1,>>|<row|<cell|>|<cell|=>|<cell|N,>>|<row|<cell|\<bbb-V\><around*|(|<wide|N|^><rsub|RB>|)>>|<cell|=>|<cell|<around*|(|<frac|k+1|k>|)><rsup|2>\<bbb-V\><around*|(|M|)>,>>|<row|<cell|>|<cell|=>|<cell|<frac|<around*|(|N+1|)><around*|(|N-k|)>|k<around*|(|k+2|)>>,>>>>
  </eqnarray>

  i.e. <math|\<bbb-V\><around*|(|<wide|N|^><rsub|RB>|)>\<less\>\<bbb-V\><around*|(|<wide|N|^><rsub|MoM>|)>>
  for <math|k\<gtr\>1>.

  Now, the question then is, is <math|<wide|N|^><rsub|RB>> the UMVUE? For
  this, we need to check whether the family of densities for the estimator
  <math|M=<wide|N|^><rsub|max>> is <with|font-series|bold|complete>.

  Let <math|g> be any function of <math|M> such that
  <math|\<bbb-E\><around*|(|g<around*|(|M|)>|)>=0>, then it suffices to show
  that <math|\<bbb-P\><around*|(|g<around*|(|M|)>=0|)>=1> for all <math|N>.
  Applying the definition of the expectation, we see that, under <math|k>
  samples

  <\eqnarray>
    <tformat|<table|<row|<cell|0=\<bbb-E\><around*|(|g<around*|(|M|)>|)>>|<cell|=>|<cell|<big|sum><rsub|m=1><rsup|N>g<around*|(|m|)>
    \<bbb-P\><around*|(|M=m\|N|)>,>>|<row|<cell|>|<cell|=>|<cell|<big|sum><rsub|m=k><rsup|N>g<around*|(|m|)>
    \<bbb-P\><around*|(|M=m\|N|)>>>|<row|<cell|<text|from above
    >\<rightsquigarrow\>>|<cell|=>|<cell|<big|sum><rsub|m=k><rsup|N>g<around*|(|m|)>
    <frac|<choose|m-1|k-1>|<choose|N|k>>.>>>>
  </eqnarray>

  Since <math|<choose|N|k>\<gtr\>0>, we can multiply out to obtain

  <\eqnarray>
    <tformat|<table|<row|<cell|<big|sum><rsub|m=k><rsup|N>g<around*|(|m|)>
    <choose|m-1|k-1>>|<cell|=>|<cell|0<space|2em><text|for all
    >N\<in\><around*|{|k,k+1,\<ldots\>|}>.>>>>
  </eqnarray>

  We now show that <math|g<around*|(|m|)>=0> for
  <math|m\<in\><around*|{|k,\<ldots\>,N|}>> via an inductive argument. As a
  base case, consider <math|N=k>. Then

  <\eqnarray>
    <tformat|<table|<row|<cell|0=<big|sum><rsub|m=k><rsup|k>g<around*|(|m|)>
    <choose|m-1|k-1>>|<cell|=>|<cell|g<around*|(|k|)>,>>>>
  </eqnarray>

  and therefore <math|g<around*|(|k|)>=0>. Assume now that the statement
  holds true for an arbitrary <math|N>, then we wish to prove this for
  <math|N+1>. Indeed,

  <\eqnarray>
    <tformat|<table|<row|<cell|0=<big|sum><rsub|m=k><rsup|N+1>g<around*|(|m|)>
    <choose|m-1|k-1>>|<cell|=>|<cell|<big|sum><rsub|m=k><rsup|N>g<around*|(|m|)>
    <choose|m-1|k-1>+g<around*|(|N+1|)><choose|N|k-1>.>>>>
  </eqnarray>

  Since the case is assumed to hold true for <math|N>, we have that

  <\eqnarray>
    <tformat|<table|<row|<cell|<big|sum><rsub|m=k><rsup|N>g<around*|(|m|)>
    <choose|m-1|k-1>>|<cell|=>|<cell|0>>>>
  </eqnarray>

  and therefore

  <\eqnarray>
    <tformat|<table|<row|<cell|0>|<cell|=>|<cell|g<around*|(|N+1|)><choose|N|k-1>>>>>
  </eqnarray>

  and hence <math|g<around*|(|N+1|)>=0>, i.e. the case holds true also for
  <math|N+1>, which concludes the inductive proof, i.e.
  <math|g<around*|(|M|)>=0>. In particular, we have

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|(|g<around*|(|M|)>|)>=0>|<cell|\<Rightarrow\>>|<cell|\<bbb-P\><around*|(|g<around*|(|M|)>=0|)>=1,>>>>
  </eqnarray>

  i.e. <math|M> is also a complete statistic. In particular, that
  <math|<wide|N|^><rsub|RB>\<assign\>\<phi\><around*|(|<wide|N|^><rsub|max>|)>=M<around*|(|<frac|k+1|k>|)>-1>
  is the UMVUE.

  <\bibliography|bib|tm-plain|../../../../../../Library/CloudStorage/Dropbox/Education/University_of_Warwick/BibliographyBibTex>
    <\bib-list|3>
      <bibitem*|1><label|bib-Casella2002>George Casella<localize| and
      >Roger<nbsp>L.<nbsp>Berger. <newblock><with|font-shape|italic|Statistical
      Inference>. <newblock>Duxbury, Pacific Grove, Calif, 2. ed<localize|
      edition>, 2002.<newblock>

      <bibitem*|2><label|bib-Goodman1952>Leo<nbsp>A.<nbsp>Goodman.
      <newblock>Serial Number Analysis. <newblock><with|font-shape|italic|Journal
      of the American Statistical Association>, 47(260):622-634, dec
      1952.<newblock>

      <bibitem*|3><label|bib-Ruggles1947>Richard Ruggles<localize| and >Henry
      Brodie. <newblock>An Empirical Approach to Economic Intelligence in
      World War II. <newblock><with|font-shape|italic|Journal of the American
      Statistical Association>, 42(237):72-91, mar 1947.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|info-flag|minimal>
    <associate|page-screen-margin|false>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|?>>
    <associate|auto-10|<tuple|1|?>>
    <associate|auto-11|<tuple|1|?>>
    <associate|auto-12|<tuple|1|?>>
    <associate|auto-13|<tuple|1|?>>
    <associate|auto-14|<tuple|1|?>>
    <associate|auto-2|<tuple|1|?>>
    <associate|auto-3|<tuple|1|?>>
    <associate|auto-4|<tuple|1|?>>
    <associate|auto-5|<tuple|1|?>>
    <associate|auto-6|<tuple|1|?>>
    <associate|auto-7|<tuple|1|?>>
    <associate|auto-8|<tuple|1|?>>
    <associate|auto-9|<tuple|1|?>>
    <associate|bib-Casella2002|<tuple|1|?>>
    <associate|bib-Goodman1952|<tuple|2|?>>
    <associate|bib-Ruggles1947|<tuple|3|?>>
    <associate|fig:RGtable|<tuple|1|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Ruggles1947

      Goodman1952

      Ruggles1947

      Casella2002

      Casella2002

      Casella2002

      Casella2002

      Casella2002
    </associate>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||A table depicting
      estimated monthly German tank production via the use of statistics
      (Serial Number Estimate) and through American and British intelligence
      estimates (Munitions Record) versus the actual monthly production
      recorded by the German Speer Ministry, see
      [<write|bib|Ruggles1947><reference|bib-Ruggles1947>, pg.
      89].>|<pageref|auto-2>>
    </associate>
    <\associate|toc>
      <with|par-left|<quote|1tab>|Introduction
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|2tab>|Problem Statement
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|Estimation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|2tab>|Maximum Observed Value
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <with|par-left|<quote|2tab>|Method of Moments
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|2tab>|Maximum Likelihood
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|1tab>|\PBest\Q Estimators
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|2tab>|UMVUE <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9>>

      <with|par-left|<quote|2tab>|Cramér-Rao Inequality - A Short Detour
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|2tab>|Constructing the UMVUE
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|2tab>|Back to the German Tank Problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|1tab>|Should I Always Use an Unbiased Estimator?
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-13>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>