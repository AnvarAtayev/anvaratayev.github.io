<TeXmacs|2.1.4>

<style|<tuple|article|british|number-europe|padded-paragraphs|preview-ref|hugo>>

<\body>
  <doc-data|<doc-title|Waiting Time and the Inspection
  Paradox>|<doc-date|<date>>>

  <abstract-data|<abstract|Faced with the choice of walking or waiting for a
  shuttle at Auckland Airport, we explore the optimal strategy in
  expectation. Starting from a simple deterministic model, we introduce
  uncertainty in bus headways and discover the inspection paradox: under any
  variance in arrival times, the expected wait is always longer than the
  naive estimate of half the mean headway.>>

  I was recently at Auckland Airport for some travelling, where I arrived at
  the Domestic Airport to drop off my car and had to transfer to the
  International Airport. To do so, I could walk, which would take me around
  15mins, according to the sings on the wall, or I could take a transfer bus
  that also, supposedly, comes every 15mins.

  As one would usually do, I arrived at the shuttle stop, to see if I can get
  to the International Terminal quickly, but there wasn't a bus in sight. So,
  I was faced with the following problem:\ 

  <\quotation>
    <with|font-shape|italic|Walk my way to the International Terminal, or
    wait, and have my time possibly reduced dramatically if a shuttle is
    about to appear.>
  </quotation>

  In the end, we ended up walking and beating the shuttle, but I wondered
  what is the best option in expectation, if you take into consideration some
  uncertainty around some of the claims the airport makes, and so on. Doing
  so, we discover the <with|font-shape|italic|inspection paradox>, on which
  you can read more about at <cite|Downey2024> and <cite|VanderPlas2018>.

  <subsection*|Problem Statement>

  Let <math|T<rsub|<text|walk>>,T<rsub|bus>>, and
  <math|T<rsub|<text|wait+bus>>> denote the random variables representing how
  long it takes, in minutes, to get from the Domestic Airport to the
  International Airport at Auckland Airport, via walking, via bus, and by
  first waiting and then taking the bus, respectively. Then, what is the
  optimal choice to minimise the expected time it takes to get from the
  Domestic Airport to the International Airport.

  <subsection*|Basic Problem>

  The basic problem is simple and easy to solve, and follows from assuming
  exactly what the signs suggest. Assume, we are sure that
  <math|T<rsub|walk>=15> and that the bus comes
  <with|font-series|bold|exactly> every <math|H>mins (<math|H> for
  <with|font-shape|italic|headway>) with <math|H=15>.

  As we're unsure how long the bus will take between terminals, let
  <math|T<rsub|bus>> be a random variable representing this quantity. I will
  assume that my walking pace is around 5km/h and that the bus travels at the
  speed limit enforced around the airport, which in New Zealand we expect to
  be 30-50km/h, in which case we can make the educated guess that
  <math|\<bbb-E\><around*|(|T<rsub|bus>|)>=\<lambda\>\<bbb-E\><around*|(|T<rsub|walk>|)>>
  with <math|\<lambda\>> likely in <math|<around*|(|0,<frac|1|6>|)>> and
  certainly <math|\<lambda\>\<less\>1/2>. Furthermore let <math|W> denote the
  random variable representing the <with|font-shape|italic|waiting time> that
  I have to endure before the next bus. Then, we may write

  <\eqnarray>
    <tformat|<table|<row|<cell|T<rsub|<text|walk>>>|<cell|=>|<cell|15,>>|<row|<cell|T<rsub|<text|wait+bus>>>|<cell|=>|<cell|W+T<rsub|<text|bus>>.>>>>
  </eqnarray>

  To answer our question, we wish to determine the sign of
  <math|\<bbb-E\><around*|(|T<rsub|wait+bus>|)>-\<bbb-E\><around*|(|T<rsub|walk>|)>>,
  a positive value implying that walking is faster than waiting and bussing,
  whilst a negative value implying the opposite.\ 

  <\folded-env>
    Indeed, using <math|\<bbb-E\><around*|(|T<rsub|bus>|)>=\<lambda\>\<bbb-E\><around*|(|T<rsub|walk>|)>>,

    <\equation*>
      \<bbb-E\><around*|(|T<rsub|wait+bus>|)>-\<bbb-E\><around*|(|T<rsub|walk>|)>=\<bbb-E\><around*|(|W|)>-<around*|(|1-\<lambda\>|)>\<bbb-E\><around*|(|T<rsub|walk>|)>.
    </equation*>
  <|folded-env>
    <\proof>
      The result follows from direct manipulation,

      <\eqnarray>
        <tformat|<table|<row|<cell|\<bbb-E\><around*|(|T<rsub|wait+bus>|)>-\<bbb-E\><around*|(|T<rsub|walk>|)>>|<cell|=>|<cell|\<bbb-E\><around*|(|W|)>+\<bbb-E\><around*|(|T<rsub|bus>|)>-\<bbb-E\><around*|(|T<rsub|walk>|)>>>|<row|<cell|>|<cell|=>|<cell|\<bbb-E\><around*|(|W|)>+\<lambda\>\<bbb-E\><around*|(|T<rsub|walk>|)>-\<bbb-E\><around*|(|T<rsub|walk>|)>>>|<row|<cell|>|<cell|=>|<cell|\<bbb-E\><around*|(|W|)>-<around*|(|1-\<lambda\>|)>\<bbb-E\><around*|(|T<rsub|walk>|)>.>>>>
      </eqnarray>
    </proof>

    \;
  </folded-env>

  As <math|\<bbb-E\><around*|(|T<rsub|walk>|)>=15> is known it suffices to
  determine <math|\<bbb-E\><around*|(|W|)>>.

  Intuition tells us that, if everything is running smoothly and as expected,
  <math|W> should follow <math|U<around*|(|0,H|)>>, which would give us
  <math|\<bbb-E\><around*|(|W|)>=<frac|H|2>>. Using the fact that
  <math|T<rsub|walk>=H>, gives

  <\eqnarray>
    <tformat|<table|<row|<cell|\<bbb-E\><around*|(|T<rsub|wait+bus>|)>-\<bbb-E\><around*|(|T<rsub|walk>|)>>|<cell|=>|<cell|<around*|(|\<lambda\>-<frac|1|2>|)>\<bbb-E\><around*|(|T<rsub|walk>|)>\<less\>0>>>>
  </eqnarray>

  where the inequality follows since <math|\<lambda\>\<less\><frac|1|2>>.
  That is, in expectation, it is better to <with|font-shape|italic|wait for
  the bus> rather than to walk, under this simple formulation.

  <\remark*>
    In the basic problem, we made a huge assumption that <math|H>, the time
    between buses, is <with|font-series|bold|exactly> 15mins. In reality,
    this is unlikely to be the case, either due to weather, road conditions,
    or simply drivers being late to their shift. Therefore one should really
    consider instead the problem where <math|H> is a random variable, and
    instead with <math|\<bbb-E\><around*|(|H|)>=15>.

    Interestingly, if one adds randomness into the mix for the headway, we
    immediately arrive at an interesting result known as the
    <with|font-shape|italic|inspection paradox>, which we will describe
    shortly.
  </remark*>

  <subsection*|Generalised Problem>

  We focus here on the waiting time, and prove results regarding
  <math|\<bbb-E\><around*|(|W|)>> under uncertainty.

  This problem sits within the realm of <with|font-shape|italic|renewal
  theory>, and as such we consider a generic renewal process
  <math|<around*|(|S<rsub|n>|)><rsub|n\<geqslant\>0>>, which denotes the time
  at which the <math|n>th bus arrives. Without loss of generality, we can
  assume that <math|S<rsub|0>=0> and write
  <math|S<rsub|n>\<assign\>H<rsub|1>+\<cdots\>+H<rsub|n>>, where
  <math|<around*|(|H<rsub|n>|)><rsub|n\<geqslant\>1>> denote the time between
  the <math|<around*|(|n-1|)>>th and <math|n>th buses. We assume that
  <math|<around*|(|H<rsub|n>|)><rsub|n\<geqslant\>1>> are i.i.d. non-negative
  random variables with a common distribution <math|F<rsub|H>> such that
  <math|\<bbb-E\><around*|(|H|)>=\<bbb-E\><around*|(|T<rsub|walk>|)>\<less\>\<infty\>>
  and <math|\<bbb-E\><around*|(|H<rsup|2>|)>\<less\>\<infty\>>.

  Let <math|t\<in\><around*|[|0,\<infty\>|)>> denote the time at which I
  arrive at the bus stop, <math|W<around*|(|t|)>\<assign\>S<rsub|N<around*|(|t|)>+1>-t>
  denote the <with|font-shape|italic|waiting time>, i.e. the time remaining
  until the next bus arrival, where <math|N<around*|(|t|)>\<assign\>sup<around*|{|n\<of\>S<rsub|n>\<leqslant\>t|}>>
  denotes the number of buses that have arrived by time <math|t>.

  Now, <math|W<around*|(|t|)>> represents the waiting time at a given time
  <math|t>, and is dependent on the entire history of the renewal process
  <math|<around*|(|S<rsub|n>|)><rsub|n\<geqslant\>0>>. Although, as an
  individual who does not organise the bus schedule, or collects data on bus
  arrival times, we do not know the entire history of the process when we
  arrive at the bus stop, and therefore the best bet for us is to question
  the long-run character of the system, and explore the distribution of
  <math|W<around*|(|t|)>> as <math|t\<rightarrow\>\<infty\>>, i.e. the
  steady-state waiting time. We denote the random variable sampled from the
  steady-state waiting time distribution by <math|W>. Then we get the
  following result.

  <\theorem*>
    <dueto|Inspection Paradox>Let <math|W<around*|(|t|)>> denote the waiting
    time at some t of a renewal process <math|<around*|(|S<rsub|n>|)><rsub|n\<geqslant\>0>>
    with i.i.d. headway <math|H>. Then

    <\equation>
      <label|eq:inspection paradox>lim<rsub|t\<rightarrow\>\<infty\>>\<bbb-E\><around*|(|W<around*|(|t|)>|)>=<frac|\<bbb-E\><around*|(|H<rsup|2>|)>|2\<bbb-E\><around*|(|H|)>>=<frac|\<bbb-E\><around*|(|H|)>|2>+<frac|\<bbb-V\><around*|(|H|)>|2
      \<bbb-E\><around*|(|H|)>>=<frac|\<bbb-E\><around*|(|H|)>|2><around*|(|1+<around*|(|<frac|\<sigma\><around*|(|H|)>|\<bbb-E\><around*|(|H|)>>|)><rsup|2>|)>.
    </equation>
  </theorem*>

  In particular, <eqref|eq:inspection paradox> tells us that under some
  uncertainty of the headway, the expected waiting time is greater than or
  equal to the <math|\<bbb-E\><around*|(|H|)>/2>, and only equal to
  <math|\<bbb-E\><around*|(|H|)>/2> (the intuitive result) when there is
  <with|font-series|bold|no variance> on the headway.

  What this states intuitively is that, under any variance in the headways,
  some intervals will be longer than others, and that if you were to land in
  any particular window, you would land preferentially in the longer ones
  than shorter ones, as they simply occupy a larger window in time. We refer
  the reader to the appendix for the proof of this result.

  <subsubsection*|Examples>

  We provide here some examples of the expected waiting time under different
  distribution assumptions for the headway <math|H>.

  <\example*>
    <dueto|Exponential>At first glance, one could assume that the headway can
    be modelled via an exponential distribution,
    <math|H\<sim\>Exp<around*|(|\<gamma\>|)>>, in which case
    <math|\<bbb-E\><around*|(|H|)>=\<sigma\><around*|(|H|)>=<frac|1|\<gamma\>>>,
    giving

    <\eqnarray>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|(|W|)>>|<cell|=>|<cell|\<bbb-E\><around*|(|H|)>.>>>>
    </eqnarray>

    That is, the expected wait time is precisely the expected headway. This
    is rather unintuitive and comes from the memoryless property of the
    exponential distribution, i.e. waiting tells you nothing about when the
    next bus arrives.

    Thinking a little more about the bus problem, tells us that this is
    indicative of a system where buses do not run on a particular schedule,
    which is not a common design of bus networks.

    Additionally, the exponential distribution places highest density at
    <math|H=0>, with arbitrarily short headways having the most common
    outcome. But this is not the case in the majority of real life
    situations, buses typically have schedules and are designed to operate at
    a fixed intervals, with the highest density of headways being at the
    designed interval values.

    Although, if one were to assume an exponential distribution for the bus
    arrival times, then given the transit time of the bus, we would certainly
    have <math|\<bbb-E\><around*|(|T<rsub|walk>|)>\<less\>\<bbb-E\><around*|(|T<rsub|wait+bus>|)>>
    as <math|\<bbb-E\><around*|(|W|)>=\<bbb-E\><around*|(|H|)>=\<bbb-E\><around*|(|T<rsub|walk>|)>>
    in our situation, with the last equality assumed to hold true. Therefore,
    one should always simply choose to walk.
  </example*>

  <\example*>
    <dueto|Log-Normal>In practice, measured bus headways are often
    well-modelled by a log-normal distribution. Assuming that
    <math|H\<sim\>LogNormal<around*|(|\<nu\>,\<tau\><rsup|2>|)>>, we have
    that <math|\<mu\>\<assign\>\<bbb-E\><around*|(|H|)>=e<rsup|\<nu\>+<frac|\<tau\><rsup|2>|2>>>
    and <math|\<sigma\><around*|(|H|)>=\<mu\><sqrt|e<rsup|\<tau\><rsup|2>>-1>>,
    yielding

    <\eqnarray>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|(|W|)>>|<cell|=>|<cell|<frac|\<bbb-E\><around*|(|H|)>|2>e<rsup|\<tau\><rsup|2>>.>>>>
    </eqnarray>

    <\folded-env>
      In particular, recalling that <math|\<bbb-E\><around*|(|H|)>=\<bbb-E\><around*|(|T<rsub|walk>|)>>,

      <\equation*>
        \<bbb-E\><around*|(|T<rsub|wait+bus>|)>-\<bbb-E\><around*|(|T<rsub|walk>|)>=<wide*|<around*|(|\<lambda\>+<frac|1|2>e<rsup|\<tau\><rsup|2>>-1|)>|\<wide-underbrace\>><rsub|\<kappa\>>\<bbb-E\><around*|(|T<rsub|walk>|)>.
      </equation*>
    <|folded-env>
      <\proof>
        The proof follows via direct manipulation

        <\eqnarray>
          <tformat|<table|<row|<cell|\<bbb-E\><around*|(|T<rsub|wait+bus>|)>-\<bbb-E\><around*|(|T<rsub|walk>|)>>|<cell|=>|<cell|\<bbb-E\><around*|(|W|)>-<around*|(|1-\<lambda\>|)>\<bbb-E\><around*|(|T<rsub|walk>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|\<bbb-E\><around*|(|H|)>|2>e<rsup|\<tau\><rsup|2>>-<around*|(|1-\<lambda\>|)>\<bbb-E\><around*|(|T<rsub|walk>|)>>>|<row|<cell|>|<cell|=>|<cell|<frac|\<bbb-E\><around*|(|T<rsub|walk>|)>|2>e<rsup|\<tau\><rsup|2>>-<around*|(|1-\<lambda\>|)>\<bbb-E\><around*|(|T<rsub|walk>|)>>>|<row|<cell|>|<cell|=>|<cell|<wide*|<around*|(|\<lambda\>+<frac|1|2>e<rsup|\<tau\><rsup|2>>-1|)>|\<wide-underbrace\>><rsub|\<kappa\>>\<bbb-E\><around*|(|T<rsub|walk>|)>>>>>
        </eqnarray>

        as required.
      </proof>
    </folded-env>

    In particular, for moderate variability, say <math|\<tau\>=0.3>,
    <math|e<rsup|\<tau\><rsup|2>>\<approx\>1.1>, and realistic ratios between
    walking and driving speeds, <math|\<lambda\>=0.1>, we get
    <math|\<sigma\><around*|(|H|)>\<approx\>4.6>, <math|\<kappa\>=-0.35>,
    i.e. waiting for and taking the bus is faster than walking, even with the
    slight bias we get from the inspection paradox.
  </example*>

  <\note*>
    Although we have shown, under somewhat general conditions, there are
    further complications one could add to this model, for example, including
    probabilities that the service is running on a given day, or that we have
    found the appropriate bus stop in the first place. We will not cover
    these in this blog post, but are factors that one should consider if one
    was to model this problem more thoroughly.
  </note*>

  <subsection*|Appendix>

  We now state the Key Renewal Theorem, a slight restatement of the result
  from <cite-detail|Grimmett2020|pg. 418>, and additionally provide a proof
  of the inspection paradox result.

  <\theorem*>
    <dueto|Key Renewal Theorem>Let <math|<around*|(|N<around*|(|t|)>|)><rsub|t\<geqslant\>0>>
    be a renewal process with i.i.d. inter-renewal times
    <math|<around*|(|H<rsub|n>|)><rsub|n\<geqslant\>1>> having distribution
    <math|F<rsub|H>> with mean <math|\<mu\>\<assign\>\<bbb-E\><around*|(|H|)>\<in\><around*|(|0,\<infty\>|)>>,
    and a renewal function <math|m<around*|(|t|)>\<assign\>\<bbb-E\><around*|(|N<around*|(|t|)>|)>>.
    Let <math|h\<assign\><around*|[|0,\<infty\>|)>\<rightarrow\>\<bbb-R\>> be
    a directly Riemann integrable function. Then the solution to the renewal
    equation

    <\equation*>
      Z<around*|(|t|)>=h<around*|(|t|)>+<big|int><rsub|0><rsup|t>Z<around*|(|t-s|)>
      \<mathd\>F<rsub|H><around*|(|s|)>
    </equation*>

    satisfies

    <\equation*>
      lim<rsub|t\<rightarrow\>\<infty\>>Z<around*|(|t|)>=<frac|1|\<mu\>><big|int><rsub|0><rsup|\<infty\>>h<around*|(|s|)>
      \<mathd\>s<rsub|>
    </equation*>

    provided <math|F<rsub|H>> is non-lattice (i.e. the support of <math|H> is
    not contained in <math|d\<bbb-N\>> for any <math|d\<gtr\>0>).
  </theorem*>

  <\proof>
    <dueto|Inspection Paradox>The result follows by an application of the
    <with|font-shape|italic|Key Renewal Theorem>

    <\folded-env>
      Let <math|x\<geqslant\>0> and define by
      <math|Z<around*|(|t|)>\<assign\>\<bbb-P\><around*|(|W<around*|(|t|)>\<gtr\>x|)>>
      the probability that the waiting time at <math|t> is greater than
      <math|x>. Then, by the law of total probability and conditioning on
      <math|H<rsub|1>\<less\>t>, one can show that

      <\eqnarray>
        <tformat|<table|<row|<cell|Z<around*|(|t|)>>|<cell|=>|<cell|\<bbb-P\><around*|(|H\<gtr\>t+x|)>+<big|int><rsub|0><rsup|t>Z<around*|(|t-s|)>
        \<mathd\>F<rsub|H><around*|(|s|)>.>>>>
      </eqnarray>
    <|folded-env>
      This following by conditioning on <math|H<rsub|1>> and using the law of
      total probability. We partition the space into the events
      <math|<around*|{|H<rsub|1>\<gtr\>t|}>> and
      <math|<around*|{|H<rsub|1>\<leqslant\>t|}>> and unravel

      <\eqnarray>
        <tformat|<table|<row|<cell|Z<around*|(|t|)>>|<cell|=>|<cell|\<bbb-P\><around*|(|W<around*|(|t|)>\<gtr\>x,H<rsub|1>\<gtr\>t|)>+\<bbb-P\><around*|(|W<around*|(|t|)>\<gtr\>x,H<rsub|1>\<leqslant\>t|)>.>>>>
      </eqnarray>

      <with|font-shape|italic|Case 1: <math|H<rsub|1>\<gtr\>t>>

      If <math|H<rsub|1>\<gtr\>t>, then <math|S<rsub|1>=H<rsub|1>\<gtr\>t>,
      and therefore <math|N<around*|(|t|)>=0>. Hence,

      <\eqnarray>
        <tformat|<table|<row|<cell|W<around*|(|t|)>>|<cell|=>|<cell|S<rsub|N<around*|(|t|)>+1>-t=S<rsub|1>-t=H<rsub|1>-t>>>>
      </eqnarray>

      and <math|W<around*|(|t|)>\<gtr\>x> if and only if
      <math|H<rsub|1>\<gtr\>t+x>. Hence

      <\eqnarray>
        <tformat|<table|<row|<cell|\<bbb-P\><around*|(|W<around*|(|t|)>\<gtr\>x,H<rsub|1>\<gtr\>t|)>>|<cell|=>|<cell|\<bbb-P\><around*|(|H<rsub|1>\<gtr\>t+x|)>>>>>
      </eqnarray>

      <with|font-shape|italic|Case 2: <math|H<rsub|1>\<leqslant\>t>>

      If <math|H<rsub|1>=s\<leqslant\>t> for some
      <math|s\<in\><around*|[|0,t|]>>, i.e. the first bus arrives at some
      time before <math|t>, then a renewal occurs at time <math|s>. At this
      renewal point, <math|s>, the process restarts, and one can define a new
      renewal process <math|<around*|(|<wide|S|~><rsub|n>|)><rsub|n\<geqslant\>0>>
      such that <math|<wide|S|~><rsub|0>=0>,
      <math|<wide|S|~><rsub|k>=H<rsub|2>+\<cdots\>+H<rsub|k+1>>.
      Equivalently, the waiting time at time <math|t> can be described as
      <math|<wide|W|~><around*|(|t|)>\<assign\>W<around*|(|t+s|)>>, which has
      the same distribution as <math|W<around*|(|t|)>>. In particular, we can
      write

      <\eqnarray>
        <tformat|<table|<row|<cell|\<bbb-P\><around*|(|W<around*|(|t|)>\<gtr\>x,H<rsub|1>\<leqslant\>t|)>>|<cell|=>|<cell|<big|int><rsub|0><rsup|t>\<bbb-P\><around*|(|W<around*|(|t|)>\<gtr\>x,H<rsub|1>=s|)>\<mathd\>F<rsub|H><around*|(|s|)>>>|<row|<cell|>|<cell|=>|<cell|<big|int><rsub|0><rsup|t>\<bbb-P\><around*|(|W<rprime|'><around*|(|t-s|)>\<gtr\>x,H<rsub|1>=s|)>\<mathd\>F<rsub|H><around*|(|s|)>>>|<row|<cell|>|<cell|=>|<cell|<big|int><rsub|0><rsup|t>\<bbb-P\><around*|(|W<rprime|'><around*|(|t-s|)>\<gtr\>x,<wide|H|~><rsub|0>=s|)>\<mathd\>F<rsub|H><around*|(|s|)>>>|<row|<cell|>|<cell|=>|<cell|<big|int><rsub|0><rsup|t>\<bbb-P\><around*|(|W<rprime|'><around*|(|t-s|)>\<gtr\>x|)>\<mathd\>F<rsub|H><around*|(|s|)>>>|<row|<cell|>|<cell|=>|<cell|<big|int><rsub|0><rsup|t>\<bbb-P\><around*|(|W<around*|(|t-s|)>\<gtr\>x|)>\<mathd\>F<rsub|H><around*|(|s|)>>>|<row|<cell|>|<cell|=>|<cell|<big|int><rsub|0><rsup|t>Z<around*|(|t-s|)>\<mathd\>F<rsub|H><around*|(|s|)>.>>>>
      </eqnarray>

      Combining both of the above cases, we get the desired result, after
      dropping the subscript on <math|H<rsub|1>>, which is allowed as all
      <math|H<rsub|i>> are identically distributed.
    </folded-env>

    Letting

    <\equation*>
      h<around*|(|t|)>\<assign\>\<bbb-P\><around*|(|H\<gtr\>t+x|)>=1-F<rsub|H><around*|(|t+x|)>,
    </equation*>

    places us in the format of the Key Renewal Theorem, which yields

    <\eqnarray>
      <tformat|<table|<row|<cell|lim<rsub|t\<rightarrow\>\<infty\>>Z<around*|(|t|)>>|<cell|=>|<cell|<frac|1|\<mu\>><big|int><rsub|0><rsup|\<infty\>>h<around*|(|s|)>
      \<mathd\>s=<frac|1|\<mu\>><big|int><rsub|x><rsup|\<infty\>>\<bbb-P\><around*|(|H\<gtr\>u|)>
      \<mathd\>u.>>>>
    </eqnarray>

    In particular,

    <\eqnarray>
      <tformat|<table|<row|<cell|lim<rsub|t\<rightarrow\>\<infty\>>\<bbb-P\><around*|(|W<around*|(|t|)>\<leqslant\>x|)>>|<cell|=>|<cell|1-lim<rsub|t\<rightarrow\>\<infty\>>\<bbb-P\><around*|(|W<around*|(|t|)>\<gtr\>x|)>>>|<row|<cell|>|<cell|=>|<cell|1-<frac|1|\<mu\>><big|int><rsub|x><rsup|\<infty\>>\<bbb-P\><around*|(|H\<gtr\>u|)>
      \<mathd\>u>>|<row|<cell|>|<cell|=>|<cell|<frac|1|\<mu\>><big|int><rsub|0><rsup|x>\<bbb-P\><around*|(|H\<gtr\>u|)>
      \<mathd\>u>>|<row|<cell|>|<cell|=>|<cell|<frac|1|\<mu\>><big|int><rsub|0><rsup|x><around*|(|1-F<rsub|H><around*|(|u|)>|)>
      \<mathd\>u\<backassign\>F<rsub|e><around*|(|x|)>>>>>
    </eqnarray>

    where we denote by <math|F<rsub|e>> the equilibrium distribution of the
    waiting time. The density of <math|F<rsub|e>> is

    <\equation*>
      f<rsub|e><around*|(|x|)>\<assign\><frac|1-F<rsub|H><around*|(|x|)>|\<mu\>>=<frac|\<bbb-P\><around*|(|H\<gtr\>x|)>|\<mu\>><space|2em>x\<geqslant\>0.
    </equation*>

    Now, let <math|W> denote a random variable with distribution
    <math|F<rsub|e>>, i.e. the equilibrium waiting time. Then

    <\eqnarray>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|(|W|)>>|<cell|=>|<cell|<big|int><rsub|0><rsup|\<infty\>>u
      f<rsub|e><around*|(|u|)> \<mathd\>u,>>|<row|<cell|>|<cell|=>|<cell|<frac|1|\<mu\>><big|int><rsub|0><rsup|\<infty\>>u
      \<bbb-P\><around*|(|H\<gtr\>u|)> \<mathd\>u.>>>>
    </eqnarray>

    By Fubini's Theorem

    <\equation*>
      \<bbb-E\><around*|[|X<rsup|2>|]>=\<bbb-E\><around*|[|<big|int><rsub|0><rsup|X>2u
      \<mathd\>u|]>=\<bbb-E\><around*|[|<big|int><rsub|0><rsup|\<infty\>>2u
      <with|font-series|bold|1><rsub|<around*|{|u\<less\>X|}>>\<mathd\>u|]>=<big|int><rsub|0><rsup|\<infty\>>2u\<bbb-P\><around*|(|X\<gtr\>u|)>
      \<mathd\>u
    </equation*>

    which allows us to write

    <\eqnarray>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|(|W|)>>|<cell|=>|<cell|<frac|1|\<mu\>><big|int><rsub|0><rsup|\<infty\>>u
      \<bbb-P\><around*|(|H\<gtr\>u|)> \<mathd\>u>>|<row|<cell|>|<cell|=>|<cell|<frac|\<bbb-E\><around*|[|H<rsup|2>|]>|2\<bbb-E\><around*|(|H|)>>.>>>>
    </eqnarray>

    Finally, using the fact that <math|\<bbb-E\><around*|[|H<rsup|2>|]>=\<bbb-V\><around*|(|H|)>+\<bbb-E\><around*|(|H|)><rsup|2>>,
    we get

    <\eqnarray>
      <tformat|<table|<row|<cell|\<bbb-E\><around*|(|W|)>>|<cell|=>|<cell|<frac|\<bbb-E\><around*|(|H|)>|2>+<frac|\<bbb-V\><around*|(|H|)>|2\<bbb-E\><around*|(|H|)>>,>>>>
    </eqnarray>

    precisely as required.
  </proof>

  <\bibliography|bib|tm-plain|../../../../../../Library/CloudStorage/Dropbox/Education/University_of_Warwick/PhD/BibliographyBibTex>
    <\bib-list|3>
      <bibitem*|1><label|bib-Downey2024>Allen Downey. <newblock>The
      Inspection Paradox is Everywhere. <newblock>2024.<newblock>

      <bibitem*|2><label|bib-Grimmett2020>Geoffrey Grimmett, David Stirzaker,
      Geoffrey Grimmett<localize|, and >David Stirzaker.
      <newblock><with|font-shape|italic|Probability and Random Processes>.
      <newblock>Oxford University Press, Oxford, New York, 2020.<newblock>

      <bibitem*|3><label|bib-VanderPlas2018>Jake VanderPlas. <newblock>The
      Waiting Time Paradox, or, Why Is My Bus Always Late?
      <newblock>2018.<newblock>
    </bib-list>
  </bibliography>

  \;
</body>

<\initial>
  <\collection>
    <associate|info-flag|minimal>
    <associate|page-screen-margin|false>
    <associate|preamble|false>
  </collection>
</initial>

<\attachments>
  <\collection>
    <\associate|bib-bibliography>
      <\db-entry|+2Zt4XIVFn6zDniV|misc|Downey2024>
        <db-field|contributor|root>

        <db-field|modus|imported>

        <db-field|date|1770685445>
      <|db-entry>
        <db-field|author|Allen <name|Downey>>

        <db-field|title|The Inspection Paradox is Everywhere>

        <db-field|year|2024>

        <db-field|journal|TDS Archive>

        <db-field|urldate|2026-02-09>

        <db-field|abstract|The inspection paradox is a statistical illusion
        you've probably never heard of. But once you learn about it, you see
        it everywhere.>

        <db-field|langid|english>

        <db-field|file|/Users/anvar/Zotero/storage/TG7B93HP/the-inspection-paradox-is-everywhere-2ef1c2e9d709.html>
      </db-entry>

      <\db-entry|+2Zt4XIVFn6zDno7|misc|VanderPlas2018>
        <db-field|newer|+2Zt4XIVFn6zDnnR>

        <db-field|contributor|root>

        <db-field|modus|imported>

        <db-field|date|1770685506>
      <|db-entry>
        <db-field|author|Jake <name|VanderPlas>>

        <db-field|title|The Waiting Time Paradox, or, Why Is My Bus Always
        Late?>

        <db-field|year|2018>

        <db-field|journal|Pythonic Perambulations>

        <db-field|urldate|2026-02-09>

        <db-field|file|/Users/anvar/Zotero/storage/HZSJF8NW/waiting-time-paradox.html>
      </db-entry>

      <\db-entry|+2Zt4XIVFn6zDnoA|book|Grimmett2020>
        <db-field|newer|+2Zt4XIVFn6zDno9>

        <db-field|contributor|root>

        <db-field|modus|imported>

        <db-field|date|1770685581>
      <|db-entry>
        <db-field|author|Geoffrey <name|Grimmett><name-sep>David
        <name|Stirzaker><name-sep>Geoffrey <name|Grimmett><name-sep>David
        <name|Stirzaker>>

        <db-field|title|Probability and Random Processes>

        <db-field|publisher|Oxford University Press>

        <db-field|year|2020>

        <db-field|address|Oxford, New York>

        <db-field|abstract|The fourth edition of this successful text
        provides an introduction to probability and random processes, with
        many practical applications. It is aimed at mathematics
        undergraduates and postgraduates, and has four main aims. To provide
        a thorough but straightforward account of basic probability theory,
        giving the reader a natural feel for the subject unburdened by
        oppressive technicalities. To discuss important random processes in
        depth with many examples. To cover a range of topics that are
        significant and interesting but less routine. To impart to the
        beginner some flavour of advanced work. The book begins with the
        basic ideas common to most undergraduate courses in mathematics,
        statistics, and science. It ends with material usually found at
        graduate level, for example, Markov processes, (including Markov
        chain Monte Carlo), martingales, queues, diffusions, (including
        stochastic calculus with Itô's formula), renewals, stationary
        processes (including the ergodic theorem), and option pricing in
        mathematical finance using the Black-Scholes formula. Further, in
        this new revised fourth edition, there are sections on coupling from
        the past, Lévy processes, self-similarity and stability, time
        changes, and the holding-time/jump-chain construction of
        continuous-time Markov chains. Finally, the number of exercises and
        problems has been increased by around 300 to a total of about 1300,
        and many of the existing exercises have been refreshed by additional
        parts. The solutions to these exercises and problems can be found in
        the companion volume, One Thousand Exercises in Probability, third
        edition, (OUP 2020). , The fourth edition of this successful text
        provides an introduction to probability and random processes, with
        many practical applications. It is aimed at mathematics
        undergraduates and postgraduates, and has four main aims. To provide
        a thorough but straightforward account of basic probability theory,
        giving the reader a natural feel for the subject unburdened by
        oppressive technicalities. To discuss important random processes in
        depth with many examples. To cover a range of topics that are
        significant and interesting but less routine. To impart to the
        beginner some flavour of advanced work. The book begins with the
        basic ideas common to most undergraduate courses in mathematics,
        statistics, and science. It ends with material usually found at
        graduate level, for example, Markov processes, (including Markov
        chain Monte Carlo), martingales, queues, diffusions, (including
        stochastic calculus with Itô's formula), renewals, stationary
        processes (including the ergodic theorem), and option pricing in
        mathematical finance using the Black-Scholes formula. Further, in
        this new revised fourth edition, there are sections on coupling from
        the past, Lévy processes, self-similarity and stability, time
        changes, and the holding-time/jump-chain construction of
        continuous-time Markov chains. Finally, the number of exercises and
        problems has been increased by around 300 to a total of about 1300,
        and many of the existing exercises have been refreshed by additional
        parts. The solutions to these exercises and problems can be found in
        the companion volume, One Thousand Exercises in Probability, third
        edition, (OUP 2020).>

        <db-field|isbn|978-0-19-884759-5>
      </db-entry>
    </associate>
  </collection>
</attachments>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|?>>
    <associate|auto-2|<tuple|?|?>>
    <associate|auto-3|<tuple|?|?>>
    <associate|auto-4|<tuple|1|?>>
    <associate|auto-5|<tuple|1|?>>
    <associate|auto-6|<tuple|1|?>>
    <associate|bib-Downey2024|<tuple|1|?>>
    <associate|bib-Grimmett2020|<tuple|2|?>>
    <associate|bib-VanderPlas2018|<tuple|3|?>>
    <associate|eq:inspection paradox|<tuple|1|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Downey2024

      VanderPlas2018

      Grimmett2020
    </associate>
    <\associate|toc>
      <with|par-left|<quote|1tab>|Problem Statement
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1>>

      <with|par-left|<quote|1tab>|Basic Problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|Generalised Problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|2tab>|Examples
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|1tab>|Appendix
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>