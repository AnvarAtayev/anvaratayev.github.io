<TeXmacs|2.1.4>

<style|<tuple|article|british|number-europe|padded-paragraphs|hugo>>

<\body>
  <doc-data|<doc-title|The Kelly Criterion>|<doc-date|November 6, 2025>>

  This is a short summary of the Kelly Criterion, initially developed by
  <name|J. Kelly Jr.> in their 1956 manuscript <cite|KellyJr.1956>, which
  describes the optimal way in which to size bets as to obtain the greatest
  expected logarithmic returns in a betting game. Plenty of further reading
  is available on this topic, one useful resource is <cite|Ferguson2009>,
  which is a short article on the Kelly Criterion from a course taught by
  <name|T. Ferguson> of UCLA in 2009. Ferguson also has a number of other
  interesting articles on his webpage, which you can find
  <hlink|here|https://www.math.ucla.edu/~tom/>. There also exist a plethora
  of other articles from the famous <name|E. Thorp> on the matter, see for
  example <cite|Thorp2006>. Note, for brevity, the notation used here aims to
  remain consistent with that of Thorp and Ferguson.

  <subsection*|The Game>

  Suppose you are asked to play a betting game where you undergo repeated
  trials against an infinitely wealthy opponent who will wager even-money
  bets. Suppose further that on each trial, you have a probability of winning
  of <math|p\<gtr\><frac|1|2>>, and of losing, <math|q\<assign\>1-p>.

  Let <math|X<rsub|0>> denote your initial wealth, and <math|X<rsub|k>> your
  wealth after the <math|k>th trial. Denote by
  <math|0\<leqslant\>B<rsub|k>\<leqslant\>X<rsub|k-1>> the bet made on the
  <math|k>th trial (we can assume that this is either deterministic or
  random). If you win the <math|k>th trial, your wealth increases to
  <math|X<rsub|k-1>+B<rsub|k>> and <math|X<rsub|k-1>-B<rsub|k>> if you lose,
  i.e.

  <\eqnarray>
    <tformat|<table|<row|<cell|X<rsub|k>>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|X<rsub|k-1>+B<rsub|k>>|<cell|<text|with
    probability >p,>>|<row|<cell|X<rsub|k-1>-B<rsub|k>>|<cell|<text|with
    probability >q=1-p.>>>>>>>>>
  </eqnarray>

  Letting <math|T<rsub|k>=+1> if the <math|k>th trial is won, and
  <math|T<rsub|k>=-1> otherwise, we can simplify and instead write

  <\eqnarray>
    <tformat|<table|<row|<cell|X<rsub|k>>|<cell|=>|<cell|X<rsub|k-1>+T<rsub|k>B<rsub|k>,>>>>
  </eqnarray>

  where <math|T<rsub|k>> is a Bernoulli random variable with success
  <math|p>, i.e. <math|T<rsub|k>\<sim\>Bernoilli<around*|(|p|)>>, and each
  <math|T<rsub|k>> is i.i.d. for <math|k\<in\>\<bbb-N\>>. Recursively
  expanding, and unravelling, we can further simplify the expression for our
  wealth after the <math|k>th trail to

  <\eqnarray>
    <tformat|<table|<row|<cell|X<rsub|k>>|<cell|=>|<cell|X<rsub|0>+<big|sum><rsub|i=1><rsup|k>T<rsub|i>B<rsub|i>.>>>>
  </eqnarray>

  <subsection*|Maximising Wealth After <math|k> Trials>

  The question we now ask ourselves is, how can we best maximise our wealth,
  in whatever manner we mean <with|font-shape|italic|best>.

  From a naïve point of view, a gambler will aim to determine how to size
  bets <math|B<rsub|i>> to maximise <math|\<bbb-E\><around*|(|X<rsub|k>|)>>
  given knowledge of the outcome of the previous bets. Indeed, doing so, we
  see that

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|(|X<rsub|k>|)>>|<cell|=>|<cell|X<rsub|0>+<big|sum><rsub|i=1><rsup|k>\<bbb-E\><around*|(|T<rsub|i>B<rsub|i>|)>.>>>>
  </eqnarray>

  <\folded-env>
    Expanding by the law of total expectation, and using the fact that
    <math|\<bbb-P\><around*|(|T<rsub|i>=+1|)>=p,\<bbb-P\><around*|(|T<rsub|i>=-1|)>=q>,

    <\eqnarray>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|(|X<rsub|k>|)>>|<cell|=>|<cell|X<rsub|0>+<big|sum><rsub|i=1><rsup|k><around*|(|p-q|)>\<bbb-E\><around*|(|B<rsub|i>|)>.>>>>
    </eqnarray>
  <|folded-env>
    <\proof>
      Expanding <math|\<bbb-E\><around*|(|T<rsub|i>B<rsub|i>|)>> for each
      <math|i>, we see that

      <\eqnarray>
        <tformat|<table|<row|<cell|\<bbb-E\><around*|(|T<rsub|i>B<rsub|i>|)>>|<cell|=>|<cell|\<bbb-E\><around*|(|T<rsub|i>B<rsub|i>\|T<rsub|i>=+1|)>\<bbb-P\><around*|(|T<rsub|i>=+1|)>+\<bbb-E\><around*|(|T<rsub|i>B<rsub|i>\|T<rsub|i>=-1|)>\<bbb-P\><around*|(|T<rsub|i>=-1|)>>>|<row|<cell|>|<cell|=>|<cell|\<bbb-E\><around*|(|B<rsub|i>\|T<rsub|i>=+1|)>p-\<bbb-E\><around*|(|B<rsub|i>\|T<rsub|i>=-1|)>q>>|<row|<cell|>|<cell|=>|<cell|\<bbb-E\><around*|(|B<rsub|i>|)>p-\<bbb-E\><around*|(|B<rsub|i>|)>q>>|<row|<cell|>|<cell|=>|<cell|<around*|(|p-q|)>\<bbb-E\><around*|(|B<rsub|i>|)>>>>>
      </eqnarray>

      as required.
    </proof>
  </folded-env>

  Since <math|p\<gtr\><frac|1|2>>, we have <math|p-q\<gtr\>0>, therefore to
  maximise <math|\<bbb-E\><around*|(|X<rsub|k>|)>>, we are simply required to
  maximise <math|\<bbb-E\><around*|(|B<rsub|i>|)>> for each
  <math|i=1,\<ldots\>,k>. As <math|0\<leqslant\>\<bbb-E\><around*|(|B<rsub|i>|)>\<leqslant\>max
  B<rsub|i>=X<rsub|i-1>>, one can maximise
  <math|\<bbb-E\><around*|(|B<rsub|i>|)>> by simply (in a deterministic
  manner) setting <math|B<rsub|i>=X<rsub|i-1>> for each
  <math|i=1,\<ldots\>,k>. That is, the optimal strategy to maximise
  <with|font-shape|italic|expected total wealth>
  <math|\<bbb-E\><around*|(|X<rsub|k>|)>> at stage <math|k>, is to simply
  wager your whole fortune at each trial.

  In doing so, in <math|k> trials, you will amass a wealth of

  <\eqnarray>
    <tformat|<table|<row|<cell|X<rsub|k>>|<cell|=>|<cell|<choice|<tformat|<table|<row|<cell|2<rsup|k>X<rsub|0>>|<cell|<text|with
    probability >p<rsup|k>,>>|<row|<cell|0>|<cell|<text|with probability
    >1-p<rsup|k>,>>>>>>>>>
  </eqnarray>

  with <math|\<bbb-E\><around*|(|X<rsub|k>|)>=<around*|(|2p|)><rsup|k>X<rsub|0>>.
  Note that the probability of ruin, <math|1-p<rsup|k>>, quickly tends to one
  as <math|k\<rightarrow\>\<infty\>>. Although this is a strategy that
  generates the greatest expected wealth, it is not a sensible strategy, as
  that wealth is not probable and chance of ruin is high.

  <\folded-env>
    Indeed, calculating the variance of your wealth with this strategy, we
    find that for any <math|k\<in\>\<bbb-N\>>

    <\eqnarray>
      <tformat|<table|<row|<cell|\<bbb-V\><around*|(|X<rsub|k>|)>>|<cell|=>|<cell|X<rsub|0><rsup|2><around*|(|4p|)><rsup|k><around*|(|1-p<rsup|k>|)>.>>>>
    </eqnarray>

    In particular, as <math|p\<gtr\><frac|1|2>>, <math|4p\<gtr\>2>, and as
    <math|p\<less\>1>, <math|p<rsup|k>\<rightarrow\>0> as
    <math|k\<rightarrow\>\<infty\>>, therefore
    <math|\<bbb-V\><around*|(|X<rsub|k>|)>> grows at least as fast as
    <math|X<rsub|0><rsup|2> 2<rsup|k>> as <math|k\<rightarrow\>\<infty\>>,
    which is exponentially fast, i.e. the strategy is not very stable.
  <|folded-env>
    <\proof>
      We calculate the variance from first principles. For
      <math|k\<in\>\<bbb-N\>>,

      <\eqnarray>
        <tformat|<table|<row|<cell|\<bbb-E\><around*|(|X<rsub|k><rsup|2>|)>>|<cell|=>|<cell|<big|sum><rsub|x\<in\><around*|{|2<rsup|k>X<rsub|0>,0|}>>x<rsup|2>
        \<bbb-P\><around*|(|X<rsub|k><around*|(|\<omega\>|)>=x|)>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|2<rsup|k>X<rsub|0>|)><rsup|2>\<cdot\>p<rsup|k>+0\<cdot\><around*|(|1-p<rsup|k>|)>>>|<row|<cell|>|<cell|=>|<cell|4<rsup|k>X<rsub|0><rsup|2>p<rsup|k>>>|<row|<cell|>|<cell|>|<cell|>>|<row|<cell|\<bbb-E\><around*|(|X<rsub|k>|)><rsup|2>>|<cell|=>|<cell|<around*|(|<big|sum><rsub|x\<in\><around*|{|2<rsup|k>X<rsub|0>,0|}>>x
        \<bbb-P\><around*|(|X<rsub|k><around*|(|\<omega\>|)>=x|)>|)><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|<around*|(|2<rsup|k>X<rsub|0>\<cdot\>p<rsup|k>+0\<cdot\><around*|(|1-p<rsup|k>|)>|)><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|4<rsup|k>X<rsub|0><rsup|2>p<rsup|2k>>>|<row|<cell|\<bbb-V\><around*|(|X<rsub|k>|)>>|<cell|=>|<cell|\<bbb-E\><around*|(|X<rsub|k><rsup|2>|)>-\<bbb-E\><around*|(|X<rsub|k>|)><rsup|2>>>|<row|<cell|>|<cell|=>|<cell|4<rsup|k>X<rsub|0><rsup|2>p<rsup|k>-4<rsup|k>X<rsub|0><rsup|2>p<rsup|2k>>>|<row|<cell|>|<cell|=>|<cell|X<rsub|0><rsup|2><around*|(|4p|)><rsup|k><around*|(|1-p<rsup|k>|)>,>>>>
      </eqnarray>

      as required.
    </proof>
  </folded-env>

  <\folded-env>
    One other metric that is interesting to calculate is the Sharpe of this
    strategy. Define by <math|R<rsub|i>\<assign\><frac|X<rsub|i>-X<rsub|i-1>|X<rsub|i-1>>>
    for <math|i=1,\<ldots\>,k>, the returns of this strategy after stage
    <math|i>. Then, using <math|B<rsub|i>=X<rsub|i-1>>,

    <\eqnarray>
      <tformat|<table|<row|<cell|R<rsub|i>>|<cell|=>|<cell|<frac|X<rsub|i-1>+T<rsub|i>X<rsub|i-1>-X<rsub|i-1>|X<rsub|i-1>>=T<rsub|i>>>>>
    </eqnarray>
  <|folded-env>
    <\proof>
      Expanding the definition, and assuming that <math|X<rsub|i>\<neq\>0>
      for <math|i=0,\<ldots\>,k-1>

      <\eqnarray>
        <tformat|<table|<row|<cell|R<rsub|i>>|<cell|=>|<cell|<frac|X<rsub|i>-X<rsub|i-1>|X<rsub|i-1>>>>|<row|<cell|>|<cell|=>|<cell|<frac|X<rsub|0>+<big|sum><rsub|j=1><rsup|i>T<rsub|j>B<rsub|j>-X<rsub|i-1>|X<rsub|i-1>>>>|<row|<cell|>|<cell|=>|<cell|<frac|X<rsub|i-1>+T<rsub|i>B<rsub|i>-X<rsub|i-1>|X<rsub|i-1>>>>|<row|<cell|>|<cell|=>|<cell|<frac|X<rsub|i-1>+T<rsub|i>X<rsub|i-1>-X<rsub|i-1>|X<rsub|i-1>>>>|<row|<cell|>|<cell|=>|<cell|T<rsub|i>,>>>>
      </eqnarray>

      as required.
    </proof>
  </folded-env>

  Since, for each <math|i=1,\<ldots\>,k>,
  <math|T<rsub|i>\<sim\>Bernoilli<around*|(|p|)>>, and is i.i.d., we have
  that

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|(|R<rsub|i>|)>>|<cell|=>|<cell|p-q=2p-1,>>|<row|<cell|\<bbb-E\><around*|(|R<rsub|i><rsup|2>|)>>|<cell|=>|<cell|p+q=1,>>|<row|<cell|\<bbb-V\><around*|(|R<rsub|i>|)>>|<cell|=>|<cell|\<bbb-E\><around*|(|R<rsub|i><rsup|2>|)>-\<bbb-E\><around*|(|R<rsub|i>|)><rsup|2>=4p<around*|(|1-p|)>,>>>>
  </eqnarray>

  and in particular the Sharpe ratio for this strategy is

  <\eqnarray>
    <tformat|<table|<row|<cell|Sharpe<around*|(|R<rsub|i>|)>>|<cell|=>|<cell|<frac|\<bbb-E\><around*|(|R<rsub|i>|)>|<sqrt|\<bbb-V\><around*|(|R<rsub|i>|)>>>=<frac|2p-1|2<sqrt|p<around*|(|1-p|)>>>>>>>
  </eqnarray>

  which is positive for <math|p\<gtr\><frac|1|2>>, approaches infinity as
  <math|p\<rightarrow\>+1> and zero as <math|p\<rightarrow\><frac|1|2>>.
  Surprisingly, this strategy has a relatively high Sharpe for <math|p> just
  above <math|0.5>.

  <subsection*|Avoiding Ruin>

  To avoid ruin, that is seeing your wealth <math|X<rsub|k>> go to zero, we
  can instead opt for a slightly modified strategy, where we restrict
  <math|0\<leqslant\>B<rsub|k>\<less\>X<rsub|k-1>>, and take a proportional
  approach and never invest our whole wealth (note that, although this avoids
  complete ruin, it does not avoid asymptotic ruin, i.e. there exists
  <math|k\<in\>\<bbb-N\>> such that <math|\<bbb-P\><around*|(|X<rsub|k>\<less\>\<varepsilon\>|)>>
  for any <math|\<varepsilon\>\<gtr\>0>, for which there are other results).
  For brevity, write <math|B<rsub|k>\<assign\>\<pi\><around*|(|p|)>X<rsub|k-1>>
  for <math|k\<in\>\<bbb-N\>> for some <math|\<pi\>\<of\><around*|[|0,1|]>\<rightarrow\><around*|[|0,1|)>>
  yet to be determined. Then, we can write

  <\eqnarray>
    <tformat|<table|<row|<cell|X<rsub|k>>|<cell|=>|<cell|X<rsub|0>+<big|sum><rsub|i=1><rsup|k>T<rsub|i>B<rsub|i>.>>|<row|<cell|>|<cell|=>|<cell|X<rsub|0><around*|(|1+\<pi\>|)><rsup|\<sharp\><around*|(|T<rsub|i>=+1,i=1,\<ldots\>,k|)>><around*|(|1-\<pi\>|)><rsup|\<sharp\><around*|(|T<rsub|i>=-1,i=1,\<ldots\>,k|)>>>>>>
  </eqnarray>

  where <math|\<sharp\><around*|(|T<rsub|i>=+1, i=1,\<ldots\>,k|)>> denotes
  the number of times <math|T<rsub|i>=+1> for <math|i=1,\<ldots\>,k>, and
  similarly for <math|\<sharp\><around*|(|T<rsub|i>=-1|)>>. The random
  variable <math|\<sharp\><around*|(|T<rsub|i>=+1, i=1,\<ldots\>,k|)>> can be
  understood as the Binomial random variable
  <math|Z<rsub|k>\<sim\>Binomial<around*|(|k,p|)>>, with success <math|p>,
  allowing us to rewrite

  <\eqnarray>
    <tformat|<table|<row|<cell|X<rsub|k>>|<cell|=>|<cell|X<rsub|0><around*|(|1+\<pi\>|)><rsup|Z<rsub|k>><around*|(|1-\<pi\>|)><rsup|k-Z<rsub|k>>.>>>>
  </eqnarray>

  Under this construction, we can see that under an appropriate choice of
  <math|\<pi\>>, our wealth could grow exponentially fast, without the chance
  of absolute ruin, in particular

  <\eqnarray>
    <tformat|<table|<row|<cell|X<rsub|k>>|<cell|=>|<cell|X<rsub|0><around*|(|1+\<pi\>|)><rsup|Z<rsub|k>><around*|(|1-\<pi\>|)><rsup|k-Z<rsub|k>>,>>|<row|<cell|>|<cell|=>|<cell|X<rsub|0>e<rsup|log<around*|(|<around*|(|1+\<pi\>|)><rsup|Z<rsub|k>><around*|(|1-\<pi\>|)><rsup|k-Z<rsub|k>>|)>>,>>|<row|<cell|>|<cell|=>|<cell|X<rsub|0>e<rsup|k
    <around*|[|<frac|Z<rsub|k>|k>log<around*|(|1+\<pi\>|)>+<frac|<around*|(|k-Z<rsub|k>|)>|k>log<around*|(|1-\<pi\>|)>|]>>,>>>>
  </eqnarray>

  which in conjunction with the estimator
  <math|<frac|Z<rsub|k>|k>\<rightarrow\>p> as <math|p\<rightarrow\>\<infty\>>
  for the Binomial random variable <math|Z<rsub|k>>, we find that for large
  <math|k\<gg\>1>

  <\equation*>
    X<rsub|k>\<approx\>X<rsub|0>e<rsup|k <around*|[|p
    log<around*|(|1+\<pi\>|)>+<around*|(|1-p|)>
    log<around*|(|1-\<pi\>|)>|]>>=X<rsub|0>e<rsup|G<around*|(|p|)> k>
  </equation*>

  where <math|G<around*|(|p|)>\<assign\>><math|p
  log<around*|(|1+\<pi\>|)>+<around*|(|1-p|)> log<around*|(|1-\<pi\>|)>>
  denotes the <with|font-shape|italic|growth rate>.

  <\folded-env|Indeed, which <math|\<pi\><around*|(|p|)>> attains maximal
  growth is known as the <with|font-shape|italic|Kelly proportion>, which can
  be calculated as <math|<wide|\<pi\>|\<bar\>><around*|(|p|)>\<assign\>p-q=2p-1>,
  for <math|q\<assign\>1-p>.>
    <\proof>
      The Kelly proportion can be calculated by maximising
      <math|f<around*|(|\<pi\>|)>\<assign\>p log<around*|(|1+\<pi\>|)>+q
      log<around*|(|1-\<pi\>|)>.>

      Indeed, we can write

      <\eqnarray>
        <tformat|<table|<row|<cell|f<rprime|'><around*|(|\<pi\>|)>>|<cell|=>|<cell|<frac|p|1+\<pi\>>-<frac|q|1-\<pi\>>>>|<row|<cell|f<rprime|''><around*|(|\<pi\>|)>>|<cell|=>|<cell|-<frac|p|<around*|(|1+\<pi\>|)><rsup|2>>-<frac|q|<around*|(|1-\<pi\>|)><rsup|2>>\<less\>0>>>>
      </eqnarray>

      where <math|f<rprime|'><around*|(|\<pi\>|)>=0> for
      <math|<wide|\<pi\>|\<bar\>>=p-q>, which maximises
      <math|f<around*|(|\<pi\>|)>>. In such a scenario,\ 

      <\eqnarray>
        <tformat|<table|<row|<cell|f<around*|(|<wide|\<pi\>|\<bar\>>|)>>|<cell|=>|<cell|p
        log<around*|(|1+<wide|\<pi\>|\<bar\>>|)>+q
        log<around*|(|1-<wide|\<pi\>|\<bar\>>|)>>>|<row|<cell|>|<cell|=>|<cell|p
        log<around*|(|1+2p-1|)>+q log<around*|(|1-<around*|(|2p-1|)>|)>>>|<row|<cell|>|<cell|=>|<cell|p
        log<around*|(|2p|)>+<around*|(|1-p|)>log<around*|(|2<around*|(|1-p|)>|)>>>|<row|<cell|>|<cell|=>|<cell|log<around*|(|2|)>+p
        log<around*|(|p|)>+<around*|(|1-p|)>log<around*|(|1-p|)>>>>>
      </eqnarray>

      <math|f<around*|(|<wide|\<pi\>|\<bar\>>|)>=log<around*|(|2|)>+p
      log<around*|(|p|)>+<around*|(|1-p|)>log<around*|(|1-p|)>>, which is
      positive for any <math|p\<in\><around*|[|0,1|]>>.
    </proof>
  </folded-env>

  In particular, the Kelly proportion suggests that for <math|k\<gg\>1>,
  <math|X<rsub|k>> would grow at a rate of

  <\eqnarray>
    <tformat|<table|<row|<cell|X<rsub|k>>|<cell|\<approx\>>|<cell|X<rsub|0>e<rsup|k<around*|[|log<around*|(|2|)>+p
    log<around*|(|p|)>+<around*|(|1-p|)>log<around*|(|1-p|)>|]>>>>|<row|<cell|>|<cell|=>|<cell|X<rsub|0><around*|(|2
    p<rsup|p><around*|(|1-p|)><rsup|<around*|(|1-p|)>>|)><rsup|k>>>>>
  </eqnarray>

  which grows exponentially for <math|p\<neq\><frac|1|2>>, and stays at the
  initial capital <math|X<rsub|0>> for <math|p=<frac|1|2>>, in which case the
  Kelly proportion, <math|\<pi\>>, is <math|0>, and no capital would be bet.
  I wish to state that the above strategy does not maximise
  <math|\<bbb-E\><around*|(|X<rsub|k>|)>>, as that would be the strategy of
  betting your whole wealth at each trial, but instead concerns maximising
  the asymptotic rate of growth, <math|G>, of your wealth as
  <math|k\<rightarrow\>\<infty\>>.

  <subsection*|Kelly Betting System: Maximising Expected Utility>

  Instead of aiming to maximise <math|\<bbb-E\><around*|(|X<rsub|k>|)>>,
  consider instead the want to maximise <math|\<bbb-E\><around*|(|log<around*|(|X<rsub|k>|)>|)>>
  at each <math|k\<in\>\<bbb-N\>>, where <math|log<around*|(|X<rsub|n>|)>> is
  often called the <with|font-shape|italic|utility>, see the work of <name|J.
  von Neumann> in <cite|VonNeumann2007> for the seminal work on utility
  theory.

  <\folded-env>
    Additionally, assume that <math|B<rsub|k>\<assign\>\<pi\><rsub|k><around*|(|p|)>
    X<rsub|k-1>> with <math|\<pi\><rsub|k>\<of\><around*|[|0,1|]>\<rightarrow\><around*|[|0,1|]>>
    which can vary at each step. Then, the expected wealth at trial <math|k>,
    given information at trial <math|k-1> can be written as

    <\eqnarray>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|(|log<around*|(|X<rsub|k>|)>\|X<rsub|k-1>|)>>|<cell|=>|<cell|log<around*|(|X<rsub|k-1>|)>+p
      log<around*|(|1+\<pi\><rsub|k>|)>p+q
      log<around*|(|1-\<pi\><rsub|k>|)>.>>>>
    </eqnarray>
  <|folded-env>
    <\proof>
      We proceed by simple expansion and the law of total expectation

      <\eqnarray>
        <tformat|<table|<row|<cell|\<bbb-E\><around*|(|log<around*|(|X<rsub|k>|)>\|X<rsub|k-1>|)>>|<cell|=>|<cell|\<bbb-E\><around*|(|log<around*|(|X<rsub|k-1>+\<pi\><rsub|k>X<rsub|k-1>T<rsub|k>|)>\|X<rsub|k-1>|)>>>|<row|<cell|>|<cell|=>|<cell|\<bbb-E\><around*|(|log<around*|(|X<rsub|k-1><around*|(|1+\<pi\><rsub|k>T<rsub|k>|)>|)>\|X<rsub|k-1>|)>>>|<row|<cell|>|<cell|=>|<cell|\<bbb-E\><around*|(|log<around*|(|X<rsub|k-1>|)>+log<around*|(|1+\<pi\><rsub|k>T<rsub|k>|)>\|X<rsub|k-1>|)>>>|<row|<cell|>|<cell|=>|<cell|\<bbb-E\><around*|(|log<around*|(|X<rsub|k-1>|)>\|X<rsub|k-1>|)>+\<bbb-E\><around*|(|log<around*|(|1+\<pi\><rsub|k>T<rsub|k>|)>\|X<rsub|k-1>|)>>>|<row|<cell|>|<cell|=>|<cell|log<around*|(|X<rsub|k-1>|)>+\<bbb-E\><around*|(|log<around*|(|1+\<pi\><rsub|k>T<rsub|k>|)>\|X<rsub|k-1>,T<rsub|k>=+1|)>\<bbb-P\><around*|(|T<rsub|k>=+1|)>+\<bbb-E\><around*|(|log<around*|(|1+\<pi\><rsub|k>T<rsub|k>|)>\|X<rsub|k-1>,T<rsub|k>=-1|)>\<bbb-P\><around*|(|T<rsub|k>=-1|)>>>|<row|<cell|>|<cell|=>|<cell|log<around*|(|X<rsub|k-1>|)>+\<bbb-E\><around*|(|log<around*|(|1+\<pi\><rsub|k>|)>\|X<rsub|k-1>,T<rsub|k>=+1|)>p+\<bbb-E\><around*|(|log<around*|(|1-\<pi\><rsub|k>|)>\|X<rsub|k-1>,T<rsub|k>=-1|)>q>>|<row|<cell|>|<cell|=>|<cell|log<around*|(|X<rsub|k-1>|)>+p
        log<around*|(|1+\<pi\><rsub|k>|)>p+q
        log<around*|(|1-\<pi\><rsub|k>|)>,>>>>
      </eqnarray>

      as required.
    </proof>
  </folded-env>

  At each stage <math|k>, <math|\<bbb-E\><around*|(|log<around*|(|X<rsub|k>|)>\|X<rsub|k-1>|)>>
  is maximised by the <with|font-shape|italic|Kelly proportion> discussed
  above

  <\equation*>
    \<pi\><rsub|k><around*|(|p|)>\<assign\>p-q=2p-1.
  </equation*>

  This gives a small justification of the Kelly betting system (i.e. it
  maximises the expectation of the log utility, whereas for the non
  log-utility approach, it only maximises the rate of increase of wealth).

  This betting system can also be used if the win probabilities change from
  stage to stage. If there are <math|n> stages, and the win probability at
  stage <math|k> is <math|p<rsub|k>>, then the Kelly betting system at each
  stage uses the rule of maximising the expected <math|log> of fortune one
  step ahead, as done above. Thus at stage <math|k>, you bet the proportion
  <math|\<pi\><rsub|k><around*|(|p<rsub|k>|)>> of your fortune.

  For further reading on the matter, one can also review the good and bad
  properties of the Kelly betting system, <cite|MacLean2010>, and the
  application of the Kelly criterion for sports betting and Wall Street, see
  <cite|Thorp2006> and references therein.

  <\bibliography|bib|tm-plain|../../../../../../Library/CloudStorage/Dropbox/Education/University_of_Warwick/BibliographyBibTex>
    <\bib-list|5>
      <bibitem*|1><label|bib-Ferguson2009>Thomas Ferguson. <newblock>The
      Kelly Betting System for Favorable Games.
      <newblock><with|font-shape|italic|Game Theory for Statisticians>,
      2009.<newblock>

      <bibitem*|2><label|bib-KellyJr.1956>J.<nbsp>L.<nbsp>Kelly Jr.
      <newblock>A New Interpretation of Information Rate.
      <newblock><with|font-shape|italic|Bell System Technical Journal>,
      35(4):917\U926, 1956.<newblock>

      <bibitem*|3><label|bib-MacLean2010>Leonard<nbsp>C MacLean,
      Herbert<nbsp>Lamb Chair, Edward<nbsp>O Thorp, Newport Beach<localize|,
      and >William<nbsp>T Ziemba. <newblock>Good and bad properties of the
      Kelly criterion. <newblock>2010.<newblock>

      <bibitem*|4><label|bib-Thorp2006>Edward<nbsp>O.<nbsp>Thorp.
      <newblock>Chapter 9 The Kelly Criterion in Blackjack Sports Betting,
      and the Stock Market. <newblock><localize|In
      ><with|font-shape|italic|Handbook of Asset and Liability Management>,
      <localize|volume><nbsp>1, <localize|pages >385\U428. Elsevier,
      2006.<newblock>

      <bibitem*|5><label|bib-VonNeumann2007>John Von Neumann<localize| and
      >Oskar Morgenstern. <newblock><with|font-shape|italic|Theory of Games
      and Economic Behavior>. <newblock>A Princeton Classic Edition.
      Princeton University Press, Princeton, NJ, 60. anniversary ed., 4.
      print., and 1. paperb. print<localize| edition>, 2007.<newblock>
    </bib-list>
  </bibliography>
</body>

<\initial>
  <\collection>
    <associate|font|roman>
    <associate|font-family|rm>
    <associate|markdown-auto-export|>
    <associate|math-font|roman>
    <associate|page-medium|beamer>
    <associate|page-screen-margin|false>
  </collection>
</initial>

<\attachments>
  <\collection>
    <\associate|bib-bibliography>
      <\db-entry|+AlY5Gkg1OzhzFIT|article|KellyJr.1956>
        <db-field|contributor|root>

        <db-field|modus|imported>

        <db-field|date|1763089693>
      <|db-entry>
        <db-field|author|J. L. <name|Kelly Jr.>>

        <db-field|title|A New Interpretation of Information Rate>

        <db-field|journal|Bell System Technical Journal>

        <db-field|year|1956>

        <db-field|volume|35>

        <db-field|number|4>

        <db-field|pages|917\U926>

        <db-field|issn|1538-7305>

        <db-field|doi|10.1002/j.1538-7305.1956.tb03809.x>

        <db-field|urldate|2025-11-06>

        <db-field|abstract|If the input symbols to a communication channel
        represent the outcomes of a chance event on which bets are available
        at odds consistent with their probabilities (i.e., \Pfair\Q odds), a
        gambler can use the knowledge given him by the received symbols to
        cause his money to grow exponentially. The maximum exponential rate
        of growth of the gambler's capital is equal to the rate of
        transmission of information over the channel. This result is
        generalized to include the case of arbitrary odds. Thus we find a
        situation in which the transmission rate is significant even though
        no coding is contemplated. Previously this quantity was given
        significance only by a theorem of Shannon's which asserted that, with
        suitable encoding, binary digits could be transmitted over the
        channel at this rate with an arbitrarily small probability of error.>

        <db-field|copyright|\<copyright\> 1956 The Bell System Technical
        Journal>

        <db-field|langid|english>

        <db-field|file|/Users/anvar/Zotero/storage/GSJZW8QW/Kelly - A New
        Interpretation of Information Rate.pdf;/Users/anvar/Zotero/storage/WJW362LE/j.1538-7305.1956.tb03809.html>
      </db-entry>

      <\db-entry|+AlY5Gkg1OzhzFGx|article|Ferguson2009>
        <db-field|contributor|root>

        <db-field|modus|imported>

        <db-field|date|1763089693>
      <|db-entry>
        <db-field|author|Thomas <name|Ferguson>>

        <db-field|title|The Kelly Betting System for Favorable Games.>

        <db-field|journal|Game Theory for Statisticians>

        <db-field|year|2009>

        <db-field|series|UCLA>

        <db-field|langid|english>

        <db-field|file|/Users/anvar/Zotero/storage/RYTTNH7V/Ferguson - The
        Kelly Betting System for Favorable Games..pdf>
      </db-entry>

      <\db-entry|+AlY5Gkg1OzhzFKv|incollection|Thorp2006>
        <db-field|contributor|root>

        <db-field|modus|imported>

        <db-field|date|1763089694>
      <|db-entry>
        <db-field|author|Edward O. <name|Thorp>>

        <db-field|title|Chapter 9 The Kelly Criterion in Blackjack Sports
        Betting, and the Stock Market>

        <db-field|booktitle|Handbook of Asset and Liability Management>

        <db-field|pages|385\U428>

        <db-field|publisher|Elsevier>

        <db-field|year|2006>

        <db-field|volume|1>

        <db-field|doi|10.1016/S1872-0978(06)01009-X>

        <db-field|urldate|2025-11-10>

        <db-field|abstract|The central problem for gamblers is to find
        positive expectation bets. But the gambler also needs to know how to
        manage his money, i.e., how much to bet. In the stock market (more
        inclusively, the securities markets) the problem is similar but more
        complex. The gambler, who is now an \Pinvestor\Q, looks for \Pexcess
        risk adjusted return\Q. In both these settings, we explore the use of
        the Kelly criterion, which is to maximize the expected value of the
        logarithm of wealth (\Pmaximize expected logarithmic utility\Q). The
        criterion is known to economists and financial theorists by names
        such as the \Pgeometric mean maximizing portfolio strategy\Q,
        maximizing logarithmic utility, the growth-optimal strategy, the
        capital growth criterion, etc. The author initiated the practical
        application of the Kelly criterion by using it for card counting in
        blackjack. We will present some useful formulas and methods to answer
        various natural questions about it that arise in blackjack and other
        gambling games. Then we illustrate its recent use in a successful
        casino sports betting system. Finally, we discuss its application to
        the securities markets where it has helped the author to make a
        thirty year total of 80 billion dollars worth of \Pbets\Q.>

        <db-field|isbn|978-0-444-50875-1>

        <db-field|langid|english>

        <db-field|file|/Users/anvar/Zotero/storage/JG3RUXID/Thorp - 2006 -
        Chapter 9 The Kelly Criterion in Blackjack Sports Betting, and the
        Stock Market.pdf>
      </db-entry>

      <\db-entry|+AlY5Gkg1OzhzFLG|book|VonNeumann2007>
        <db-field|contributor|root>

        <db-field|modus|imported>

        <db-field|date|1763089694>
      <|db-entry>
        <db-field|author|John <name|Von Neumann><name-sep>Oskar
        <name|Morgenstern>>

        <db-field|title|Theory of Games and Economic Behavior>

        <db-field|publisher|Princeton University Press>

        <db-field|year|2007>

        <db-field|series|A Princeton Classic Edition>

        <db-field|address|Princeton, NJ>

        <db-field|edition|60. anniversary ed., 4. print., and 1. paperb.
        print>

        <db-field|isbn|978-0-691-13061-3 978-1-4008-2946-0>

        <db-field|langid|english>

        <db-field|file|/Users/anvar/Zotero/storage/E59RCPRU/Neumann - Theory
        Of Games And Economic Behavior.pdf>
      </db-entry>

      <\db-entry|+1YglMJhk2Pe3R68b|article|MacLean2010>
        <db-field|contributor|root>

        <db-field|modus|imported>

        <db-field|date|1763092993>
      <|db-entry>
        <db-field|author|Leonard C <name|MacLean><name-sep>Herbert Lamb
        <name|Chair><name-sep>Edward O <name|Thorp><name-sep>Newport
        <name|Beach><name-sep>William T <name|Ziemba>>

        <db-field|title|Good and bad properties of the Kelly criterion>

        <db-field|year|2010>

        <db-field|abstract|We summarize what we regard as the good and bad
        properties of the Kelly criterion and its variants. Additional
        properties are discussed as observations.>

        <db-field|langid|english>

        <db-field|file|/Users/anvar/Zotero/storage/8I43JMS4/MacLean et al. -
        Good and bad properties of the Kelly criterion.pdf>
      </db-entry>
    </associate>
  </collection>
</attachments>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|?>>
    <associate|auto-2|<tuple|?|?>>
    <associate|auto-3|<tuple|?|?>>
    <associate|auto-4|<tuple|?|?>>
    <associate|auto-5|<tuple|?|?>>
    <associate|bib-Ferguson2009|<tuple|1|?>>
    <associate|bib-KellyJr.1956|<tuple|2|?>>
    <associate|bib-MacLean2010|<tuple|3|?>>
    <associate|bib-Thorp2006|<tuple|4|?>>
    <associate|bib-VonNeumann2007|<tuple|5|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      KellyJr.1956

      Ferguson2009

      Thorp2006

      VonNeumann2007

      MacLean2010

      Thorp2006
    </associate>
    <\associate|toc>
      <with|par-left|<quote|1tab>|The Game
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|1tab>|Maximising Wealth After
      <with|mode|<quote|math>|k> Trials <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|Avoiding Ruin
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|Kelly Betting System: Maximising Expected
      Utility <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>