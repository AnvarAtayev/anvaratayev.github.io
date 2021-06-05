<TeXmacs|1.99.21>

<style|<tuple|generic|british>>

<\body>
  <\wide-tabular>
    <tformat|<table|<row|<\cell>
      <\wide-tabular>
        <tformat|<cwith|1|1|1|-1|cell-hyphen|n>|<cwith|1|1|1|-1|cell-halign|c>|<cwith|1|1|1|-1|cell-width|10>|<cwith|1|1|1|-1|cell-hmode|exact>|<table|<row|<cell|<hlink|Home|main.tm>>|<cell|<hlink|About|about.tm>>|<cell|<hlink|Intro
        to Astrodynamics|intro-orbital-mechanics.tm>>>>>
      </wide-tabular>
    </cell>>>>
  </wide-tabular>

  \;

  <doc-data|<doc-title|Chapter 1 - Basics of Orbital Mechanics>>

  <section|Laws>

  We begin this chapter with the discussion of Kepler's and Netwon's Laws,
  which will form the basis of the discussion of the rest of the content of
  this chapter and this series.

  <subsection|Kepler's Laws>

  In 1609, Kepler published his first two laws of planetary motion, with a
  third law followed in 1619. In particular, they stated that for orbiting
  planets, the following rules held true:

  <with|font-series|bold|First Law:> The orbit of each planet is an ellpse,
  with the sun at a focus;

  <with|font-series|bold|Second Law:> The line joining the planet to the sun
  sweeps out equal areas in equal times;

  <with|font-series|bold|Third Law: >The square of the period of a planet is
  proportional to the cube of its mean distance from the sun.

  Kepler's laws provided a description of planetary motion, but not an
  explanation. But Isaac Newton later unravelled the mystery of the why.

  <subsection|Newton's Laws>

  In Book 1 of the <with|font-shape|italic|Principia>, Newton introduces the
  following three laws of motion:

  <with|font-series|bold|First Law:> Every body continues in its state of
  rest or of uniform motion in a straight line unless it is compelled to
  change that state by forces impressed upon it;

  <with|font-series|bold|Second Law:> The rate of change of momentum is
  proportional to the force impressed and is in the same direction as that
  force;

  <with|font-series|bold|Third Law:> To every action, there is always opposed
  an equal reaction.

  In particular, the second law can be expressed nicely in a mathematical
  format as

  <\equation>
    <label|NL2><big|sum><rsub|i><with|font-series|bold|F<rsub|>><rsub|i>=m<with|font-series|bold|<wide|r|\<ddot\>>>=<frac|\<mathd\>|dt><around*|(|m<with|font-series|bold|<wide|r|\<dot\>>>|)>
  </equation>

  where <math|<big|sum><rsub|i><with|font-series|bold|F><rsub|i>> denotes the
  vector sum of all the forces acting on the mass <math|m>, and
  <math|<with|font-series|bold|<wide|r|\<ddot\>>>> denotes the vector
  acceleration of the mass measured relative to an inertial reference frame.
  We note that the first equation given in Equation <reference|NL2> only
  applies for a fixed mass system in time, although the second equation can
  be used for changing mass systems.

  <subsection|Newton's Law of Universal Graviation>

  Besides eunciating his three laws of motion in the
  <with|font-shape|italic|Principia<with|font-series|bold|,>> Newton also
  formulated a law of graviation, which states the following:

  <paragraph|Newton's Law of Graviation:>Any two bodies attract one another
  with a force that is proportional to the product of their masses and
  inversely proportional to the square of the disctance between them, that is

  <\equation>
    <label|NLG><with|font-series|bold|F><rsub|g>=-<frac|G M
    m|r<rsup|2>><frac|<with|font-series|bold|r>|r>,
  </equation>

  where <math|<with|font-series|bold|F><rsub|g>> denotes the force on mass
  <math|m> due to mass <math|M>, <math|<with|font-series|bold|r>> denotes the
  vector from the centre of mass <math|M> to <math|m>, and
  <math|r=<around*|\||<with|font-series|bold|r>|\|>> denotes the distance
  betweent the two masses. Furthermore, <math|G> denotes the
  <with|font-shape|italic|universal graviational constant>, and has the value
  <math|6.670\<times\>10<rsup|-8>dyne cm<rsup|2>/gm<rsup|2>>.

  In the following sections, we will apply Equation <reference|NLG> to
  Equation <reference|NL2> to develop the equation of motion for planets and
  satellites.

  <section|The<math|> <math|N>-body Problem>

  Having described the various laws of physics in the previous section, we
  can now turn to the development of the equation of motion of a orbiting
  object. Take for example a satellite or planet in our solar system; due to
  the presence of various other bodies in the solar system (and outside it),
  the satellite is being acted upon by a number of graviational masses and
  may even be experiencing other forces such as drag, thurst, solar radiation
  pressue and so on.

  For the sake of simplicity, assume that in the system our satellite resides
  in, there exist only <math|N> bodies, each of mass <math|m<rsub|j>> for
  <math|j=1,\<ldots\>,N>, one of which is the body whose motion we wish to
  study; without loss of generality, assume that we index the object of
  interest with <math|i>, and that it has an associated mass
  <math|m<rsub|i>>.

  To be able to describe the motion of the <math|N> objects in our system, we
  first need to determine a set of equations for these bodies that is related
  to the object's motion/position. To obtain this set of equations, we use
  Newton's Second Law of Motion described in Equation <reference|NL2>. But to
  determine the equations of motion to a reasonable degree of accuracy, one
  must first know all the forces (at least the dominant ones) that act on the
  bodies.

  Before we proceed, we must first also choose a
  <with|font-shape|italic|suitable> coordinate system in which the positions
  of the <math|N> masses can be described. Without loss of generality, assume
  an orthogonal coordinate system with axes described by
  <math|<around*|(|X,Y,Z|)>>, such that in this coordinate system, the
  positions of the <math|N> masses are given by
  <math|<with|font-series|bold|r<rsub|<with|font-series|bold|>>><rsub|j>> for
  <math|j=1,\<ldots\>,N>.

  According to Newton's Law of Graviation, see <eqref|NLG>, the force of
  graviation exerted on mass <math|m<rsub|i>> by mass <math|m<rsub|j>> is
  given by

  <\equation*>
    <with|font-series|bold|F<rsub|>><rsub|g><rsup|i,j>=-<frac|G m<rsub|i>
    m<rsub|j>|r<rsub|i,j><rsup|3>><with|font-series|bold|r><rsub|i,j>,
  </equation*>

  where <math|<with|font-series|bold|r><rsub|i,j>=<with|font-series|bold|r><rsub|i>-<with|font-series|bold|r><rsub|j>>
  and <math|r<rsub|i,j>=<around*|\||<with|font-series|bold|r><rsub|i,j>|\|>>.
  The vector sum of all such graviation forces acting on the <math|i>th body
  can then be written as

  <\equation>
    <label|Sum Grav Forces><with|font-series|bold|F><rsub|g><rsup|i>\<assign\><big|sum><rsup|N><rsub|j=1,j\<neq\>i><with|font-series|bold|F<rsub|<with|font-series|bold|>>><rsub|g><rsup|i,j>=-G
    m<rsub|i><big|sum><rsub|j=1,j\<neq\>i><rsup|N><frac|m<rsub|j>|r<rsub|i,j><rsup|3>><with|font-series|bold|r><rsub|i,j>.
  </equation>

  One should note that the force of graviation from body <math|i> to body
  <math|i>, i.e. <math|<with|font-series|bold|F><rsub|g><rsup|i,i>>, is not
  included in the expression of Equation <reference|Sum Grav Forces> since we
  assume that a body cannot exert a graviational force on itself. Next, we
  can collect all the forces acting on body <math|i> due to any
  non-graviational forces by <math|<with|font-series|bold|F><rsub|other><rsup|i>>
  (e.g. forces due to drag, thrust, solar pressure, etc.), which would mean
  that the total force acting on body <math|i> in our system can be described
  by

  <\equation>
    <label|Total Force><with|font-series|bold|F><rsub|total><rsup|i>=<with|font-series|bold|F<rsub|>><rsub|g><rsup|i>+<with|font-series|bold|F><rsub|other><rsup|i>.
  </equation>

  We are now in a position to apply Newton's Second Law of Motion. Indeed, by
  Equation <reference|NL2>, the total force acting on body <math|i> is
  propotional to its acceleration, i.e.

  <\equation>
    <with|font-series|bold|F<rsub|<with|font-series|bold|>>><rsub|total><rsup|i>=<frac|\<mathd\>|dt><around*|(|m<rsub|i>
    <wide|<with|font-series|bold|r>|\<dot\>><rsub|i>|)>=m<rsub|i><wide|<with|font-series|bold|r<rsub|>><rsub|i>|\<ddot\>>+<wide|m|\<dot\>><rsub|i><wide|<with|font-series|bold|r>|\<dot\>><rsub|i>,
  </equation>

  where\ 

  <\itemize>
    <item><math|<with|font-series|bold|<wide|r|\<dot\>>><rsub|i><around*|(|t|)>>
    = <math|<frac|\<mathd\><with|font-series|bold|r><rsub|i><around*|(|t|)>|dt>>
    denotes the velocity of body <math|i>, often denoted as
    <math|<with|font-series|bold|v><rsub|i>>;

    <item><math|<wide|<with|font-series|bold|r><rsub|i>|\<ddot\>><around*|(|t|)>>
    =<math|<frac|\<mathd\><wide|<with|font-series|bold|r>|\<dot\>><rsub|i><around*|(|t|)>|dt>>
    denotes the acceleration of body <math|i>, often denoted as
    <math|<with|font-series|bold|a><rsub|i>;>

    <item><math|<wide|m<rsub|i>|\<dot\>><around*|(|t|)>> denotes the rate of
    change of mass of body <math|i>.
  </itemize>

  We note here that we are considering the change in mass in our equations
  since the body that is of interest may be expelling mass to produce thrust,
  otherwise, we can take the rate of change of mass to be zero. At high
  speeds, certain relativistic effects would also contribute to changes in
  mass over time.

  Then, the most general equation of motion for the <math|i>th body in our
  system (according to Newtonian mechanics) can be described by (assuming
  that mass is never zero)

  <\equation>
    <wide|<with|font-series|bold|r>|\<ddot\>><rsub|i><around*|(|t|)>+<frac|<wide|m|\<dot\>><rsub|i><around*|(|t|)>|m<rsub|i><around*|(|t|)>><wide|<with|font-series|bold|r>|\<dot\>><rsub|i><around*|(|t|)>-<frac|<with|font-series|bold|F><rsub|total><rsup|i><around*|(|t|)>|m<rsub|i><around*|(|t|)>>=0,
  </equation>

  or alternatively (losing the expression for <math|t> dependence for
  brevity) after using Equation <reference|Total Force>

  <\equation>
    <label|Full Equation of Motion><wide|<with|font-series|bold|r>|\<ddot\>><rsub|i>+<frac|<wide|m|\<dot\>><rsub|i>|m<rsub|i>><wide|<with|font-series|bold|r>|\<dot\>><rsub|i>+G<big|sum><rsub|j=1,j\<neq\>i><rsup|N><frac|m<rsub|j>|r<rsub|i,j><rsup|3>><around*|(|<with|font-series|bold|r><rsub|i>-<with|font-series|bold|r><rsub|j>|)><with|font-series|bold|>-<frac|<with|font-series|bold|F><rsub|other>|m<rsub|i>>=0.
  </equation>

  Now Equation <reference|Full Equation of Motion> is a second order
  nonlinear differential equation, which in its current form is a very
  difficult problem to solve. Not only that, the many body mechanics
  introduced in the sum term complicate the equation even more, and problems
  of this form are actively studied in the current mathematical landscape.

  <subsection|Equations of Constant Mass and No External Forces>

  Assume that we are in a situation that the mass of body <math|i> does not
  vary with time, i.e. <math|<wide|m|\<dot\>><rsub|i><around*|(|t|)>=0> for
  all <math|t>, and also that body <math|i> does not experience forces other
  than those imposed upon it by graviational forces, i.e.
  <math|<with|font-series|bold|F><rsub|other><rsup|i>=0>. Then, Equation
  <reference|Full Equation of Motion> reduces to

  <\equation>
    <label|Full Equation of Motion><wide|<with|font-series|bold|r>|\<ddot\>><rsub|i>+G<big|sum><rsub|j=1,j\<neq\>i><rsup|N><frac|m<rsub|j>|r<rsub|i,j><rsup|3>><around*|(|<with|font-series|bold|r><rsub|i>-<with|font-series|bold|r><rsub|j>|)><with|font-series|bold|>=0,
  </equation>

  a much simpler equation, with less varying terms.
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|Full Equation of Motion|<tuple|8|?>>
    <associate|NL2|<tuple|1|1>>
    <associate|NLG|<tuple|2|1>>
    <associate|Sum Grav Forces|<tuple|3|?>>
    <associate|Total Force|<tuple|4|?>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|1>>
    <associate|auto-4|<tuple|1.3|1>>
    <associate|auto-5|<tuple|1|1>>
    <associate|auto-6|<tuple|2|2>>
    <associate|auto-7|<tuple|2.1|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Laws>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|1tab>|1.1<space|2spc>Kepler's Laws
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2>>

      <with|par-left|<quote|1tab>|1.2<space|2spc>Newton's Laws
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|1.3<space|2spc>Newton's Law of Universal
      Graviation <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <with|par-left|<quote|4tab>|Newton's Law of Graviation:
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.15fn>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>The<with|mode|<quote|math>|>
      <with|mode|<quote|math>|N>-body Problem>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>