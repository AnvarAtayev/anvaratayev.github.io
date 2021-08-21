<TeXmacs|2.1>

<style|<tuple|generic|british|preview-ref|python>>

<\body>
  <\hide-preamble>
    <assign|ip|<macro|first|second|\<langle\><arg|first>,<arg|second>\<rangle\>>>

    <assign|av|<macro|arg|\<langle\><arg|arg>\<rangle\>>>

    <assign|to|<macro|\<rightarrow\>>>

    <assign|R|<macro|<with|font|Bbb|R>>>

    <assign|C|<macro|<with|font|Bbb|C>>>

    <assign|Z|<macro|<with|font|Bbb|Z>>>

    <assign|N|<macro|<with|font|Bbb|N>>>

    <assign|T|<macro|<with|font|Bbb|T>>>

    <assign|A|<macro|<with|font|Bbb|A>>>

    <assign|cA|<macro|<with|font|cal|A>>>

    <assign|cB|<macro|<with|font|cal|B>>>

    <assign|cD|<macro|<with|font|cal|D>>>

    <assign|cE|<macro|<with|font|cal|E>>>

    <assign|cF|<macro|<with|font|cal|F>>>

    <assign|cG|<macro|<with|font|cal|G>>>

    <assign|cH|<macro|<with|font|cal|H>>>

    <assign|cK|<macro|<with|font|cal|K>>>

    <assign|cL|<macro|<with|font|cal|L>>>

    <assign|cM|<macro|<with|font|cal|M>>>

    <assign|cP|<macro|<with|font|cal|P>>>

    <assign|cS|<macro|<with|font|cal|S>>>

    <assign|sD|<macro|<with|font|Euler|D>>>

    <assign|bx|<macro|<with|font-series|bold|x>>>

    <assign|br|<macro|<with|font-series|bold|r>>>

    <assign|bh|<macro|<with|font-series|bold|h>>>

    <assign|bv|<macro|<with|font-series|bold|v>>>

    <assign|ba|<macro|<with|font-series|bold|a>>>

    <assign|bF|<macro|<with|font-series|bold|F>>>

    \;

    \;
  </hide-preamble>

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

  where <math|<with|font-series|bold|r><rsub|i,j>=<with|font-series|bold|r><rsub|j>-<with|font-series|bold|r><rsub|i>>
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
    <label|Equation of Motion With Constant
    Mass><wide|<with|font-series|bold|r>|\<ddot\>><rsub|i>+G<big|sum><rsub|j=1,j\<neq\>i><rsup|N><frac|m<rsub|j>|r<rsub|i,j><rsup|3>><around*|(|<with|font-series|bold|r><rsub|i>-<with|font-series|bold|r><rsub|j>|)><with|font-series|bold|>=0,
  </equation>

  a much simpler equation, with less varying terms.

  <subsubsection|The Motions of the Earth and Moon>

  Consider now the scenario that <math|m<rsub|1>> denotes the mass of the
  Earth, and <math|m<rsub|2>> denotes the mass of an Earth satellite. Then,
  since

  <\equation*>
    <br><rsub|1,2>\<assign\><br><rsub|2>-<br><rsub|1>=-<br><rsub|2,1>
  </equation*>

  it follows by Equation <reference|Equation of Motion With Constant Mass>

  <\eqnarray>
    <tformat|<table|<row|<cell|<wide|<br>|\<ddot\>><rsub|1,2>=<wide|<br>|\<ddot\>><rsub|2>-<wide|<br>|\<ddot\>><rsub|1>>|<cell|=>|<cell|-G<big|sum><rsub|<stack|<tformat|<table|<row|<cell|j=1>>|<row|<cell|j\<neq\>2>>>>>><rsup|N><frac|m<rsub|j>|r<rsub|j,2><rsup|3>><with|font-series|bold|r><rsub|j,2>+G<big|sum><rsub|<stack|<tformat|<table|<row|<cell|j=1>>|<row|<cell|j\<neq\>1>>>>>><rsup|N><frac|m<rsub|j>|r<rsub|j,1><rsup|3>><with|font-series|bold|r><rsub|j,1>>>|<row|<cell|>|<cell|=>|<cell|-G<frac|m<rsub|1>|r<rsub|1,2><rsup|3>><with|font-series|bold|r><rsub|1,2>+G<frac|m<rsub|2>|r<rsub|2,1><rsup|3>><with|font-series|bold|r><rsub|2,1>-G<big|sum><rsub|<stack|<tformat|<table|<row|<cell|j=3>>>>>><rsup|N>m<rsub|j><around*|(|<frac|<br><rsub|j,2>|r<rsub|j,2><rsup|3>>-<frac|<br><rsub|j,1>|r<rsub|j,1><rsup|3>>|)>>>|<row|<cell|>|<cell|=>|<cell|-G<frac|m<rsub|1>|r<rsub|1,2><rsup|3>><with|font-series|bold|r><rsub|1,2>-G<frac|m<rsub|2>|r<rsub|1,2><rsup|3>><with|font-series|bold|r><rsub|1,2>-G<big|sum><rsub|<stack|<tformat|<table|<row|<cell|j=3>>>>>><rsup|N>m<rsub|j><around*|(|<frac|<br><rsub|j,2>|r<rsub|j,2><rsup|3>>-<frac|<br><rsub|j,1>|r<rsub|j,1><rsup|3>>|)>>>|<row|<cell|>|<cell|=>|<cell|-<frac|G<around*|(|m<rsub|1>+m<rsub|2>|)>|r<rsub|1,2><rsup|3>><with|font-series|bold|r><rsub|1,2>-G<big|sum><rsub|<stack|<tformat|<table|<row|<cell|j=3>>>>>><rsup|N>m<rsub|j><around*|(|<frac|<br><rsub|j,2>|r<rsub|j,2><rsup|3>>-<frac|<br><rsub|j,1>|r<rsub|j,1><rsup|3>>|)>.<eq-number>>>>>
  </eqnarray>

  We note that the above equation for the acceleration between the Earth and
  an Earth satellite tells us that\ 

  <\equation>
    <label|Two Body Problem Plus Perturbations><wide|<br>|\<ddot\>><rsub|1,2>=-<frac|G<around*|(|m<rsub|1>+m<rsub|2>|)>|r<rsub|1,2><rsup|3>><with|font-series|bold|r><rsub|1,2>+perturbations,
  </equation>

  which is a very simple equation, plus some perturbations due to external
  influences. Now, to be able to use the simple form of the equation above,
  it becomes necessary to determine the magnitude of the perturbing effects,
  which will depend on the masses of the other bodies. For reference, let us
  write down the relative acceleration in <math|g>'s that the other bodies in
  the solar system would have for a satellite at 200 miles above the Earth
  surface.

  <big-table|<tabular|<tformat|<cwith|2|-1|2|2|cell-halign|r>|<table|<row|<cell|External
  Bodies>|<cell|Acceleration in <math|g>'s>>|<row|<cell|Sun>|<cell|<math|6\<times\>10<rsup|-4>>>>|<row|<cell|Mercury>|<cell|<math|2.6\<times\>10<rsup|-10>>>>|<row|<cell|Venus>|<cell|<math|1.9\<times\>10<rsup|-8>>>>|<row|<cell|Earth>|<cell|<math|0.89>>>|<row|<cell|Mars>|<cell|<math|7.1\<times\>10<rsup|-10>>>>|<row|<cell|Jupiter>|<math|3.2\<times\>10<rsup|-8>>>|<row|<cell|Saturn>|<cell|<math|2.3\<times\>10<rsup|-9>>>>|<row|<cell|Uranus>|<cell|<math|8\<times\>10<rsup|-11>>>>|<row|<cell|Neptune>|<cell|<math|3.6\<times\>10<rsup|-11>>>>|<row|<cell|Pluto>|<cell|<math|10<rsup|-12>>>>|<row|<cell|Moon>|<cell|<math|3.3\<times\>10<rsup|-6>>>>|<row|<cell|Earth
  Oblateness>|<cell|<math|10<rsup|-3>>>>>>>|>

  <subsection|The Two-Body Problem>

  Assume for now that we are dealing with only two bodies whose mass does not
  vary and that they are not acted on by any external forces. The letting
  <math|<br>\<assign\><br><rsub|1,2>>, <math|\<mu\>\<assign\>G<around*|(|m<rsub|1>+m<rsub|2>|)>>,
  the equation of motion can be simplified down from Equation <reference|Two
  Body Problem Plus Perturbations> to

  <\equation>
    <label|Two Body Problem><wide|<br>|\<ddot\>>+<frac|\<mu\>|r<rsup|3>><br>=0,
  </equation>

  which is an equation we shall solve. Before we do that, we shall first
  determine some properties of the solution.

  <subsubsection|Conservation of Mechanical Energy>

  We first determine the conservation of mechanical energy of the system. It
  is known that a graviational field is <with|font-series|bold|conservative>
  implying that for an object moving under the influence of gravity alone, it
  does not lose or gain mechanical energy, but only exchanges a form of
  energy for another.

  Taking the dot product of Equation <reference|Two Body Problem> with
  <math|<wide|<br>|\<dot\>>>, we have that

  <\eqnarray>
    <tformat|<table|<row|<cell|<wide|<br>|\<dot\>>\<cdot\><wide|<br>|\<ddot\>>+<frac|\<mu\>|r<rsup|3>><wide|<br>|\<dot\>>\<cdot\><br>>|<cell|=>|<cell|0.>>>>
  </eqnarray>

  <\note*>
    Let <math|<with|font-series|bold|><with|font-series|bold|a>=<with|font-series|bold|a><around*|(|t|)>>
    and <math|a=<around*|\||<with|font-series|bold|a>|\|>>, then wherever
    <math|<with|font-series|bold|a>> is differentiable, we have that

    <\equation*>
      <with|font-series|bold|a>\<cdot\><wide|<with|font-series|bold|a>|\<dot\>>=<frac|1|2><frac|\<mathd\>|\<mathd\>t><around*|(|*<with|font-series|bold|a>\<cdot\><with|font-series|bold|a>|)>=<frac|1|2><frac|\<mathd\>|\<mathd\>t><around*|(|*a<rsup|2>|)>=<frac|1|2><around*|(|a
      <wide|a|\<dot\>>+<wide|a|\<dot\>> a|)>=a <wide|a|\<dot\>>.
    </equation*>
  </note*>

  Using the note above, we have that

  <\eqnarray>
    <tformat|<table|<row|0|<cell|=>|<cell|<wide|<br>|\<dot\>>\<cdot\><wide|<br>|\<ddot\>>+<frac|\<mu\>|r<rsup|3>><wide|<br>|\<dot\>>\<cdot\><br>>>|<row|<cell|>|<cell|=>|<cell|<wide|r|\<dot\>>
    <wide|r|\<ddot\>>+<frac|\<mu\>|r<rsup|3>>r
    <wide|r|\<dot\>>>>|<row|<cell|>|<cell|=>|<cell|<wide|r|\<dot\>>
    <wide|r|\<ddot\>>+<frac|\<mu\>|r<rsup|2>>
    <wide|r|\<dot\>>>>|<row|<cell|>|<cell|=>|<cell|<frac|1|2><frac|\<mathd\>|\<mathd\>t><around*|(|<wide|r|\<dot\>><rsup|2>-<frac|\<mu\>|r>+c<rsub|1>|)>.>>>>
  </eqnarray>

  Therefore, we have that

  <\equation>
    <frac|<wide|r|\<dot\>><rsup|2>|2>+<around*|(|c<rsub|1>-<frac|\<mu\>|r>|)>=constant
  </equation>

  for some constant in time <math|c<rsub|1>>. Defining the constant
  expression as the <with|font-shape|italic|specific mechanical energy>
  denoted by <math|<cE>>, we have that

  <\equation>
    <cE>\<assign\><frac|v<rsup|2>|2>+<around*|(|c<rsub|1>-<frac|\<mu\>|r>|)>
  </equation>

  is a constant in time, where <math|v\<assign\><wide|r|\<dot\>>>.

  <\remark>
    The specific mechanical energy can simply be seen as the sum of the
    kinetic and potential energy of a body per unit mass. It is clear that
    the first term is the kinetic energy. Although to see that the second
    term describes the potential energy, it is useful to equate it with the
    work done in moving a satellite from one point in space to another.

    Furthermore, the constant <math|c<rsub|1>> simply is a constant that
    controls the reference of the potential energy, i.e. tells us where we
    set a zero potential energy to be. This is arbitrary and can be chosen as
    needed. One could choose this reference constant to be
    <math|<frac|\<mu\>|r<rsub|\<oplus\>>>>, where <math|r<rsub|\<oplus\>>>
    denotes the radius of the Earth, although then it would be difficult to
    compare these values between different bodies. An elegant choice would
    instead be to take <math|c<rsub|1>=0>, (which assumes that a zero
    potential occurs at <math|r=\<infty\>>). A drawback to this approach is
    that the potentital energy is then always seen as being negative.
  </remark>

  <\definition>
    <label|Specific Mechanical Energy><dueto|Specific Mechanical Energy>For a
    body of mass <math|m> orbiting another body of mass <math|M> at a
    distance <math|r> from its centre and orbiting at a tangential velocity
    of <math|v>, then the specific mechanical energy of the body of mass
    <math|m> is given by

    <\equation>
      <cE>\<assign\><frac|v<rsup|2>|2>-<frac|\<mu\>|r>
    </equation>

    where <math|\<mu\>\<assign\>G<around*|(|M+m|)>>.
  </definition>

  <subsubsection|Conservation of Angular Momentum>

  Recall the equation of motion for the two body problem as given in Equation
  <reference|Two Body Problem>. Then, if one takes the cross product of the
  equation, one obtains

  <\eqnarray>
    <tformat|<table|<row|<cell|0>|<cell|=>|<cell|<br>\<times\><around*|(|<wide|<br>|\<ddot\>>+<frac|\<mu\>|r<rsup|3>><br>|)>>>|<row|<cell|>|<cell|=>|<cell|<br>\<times\><wide|<br>|\<ddot\>>+<frac|\<mu\>|r<rsup|3>><br>\<times\><br>>>|<row|<cell|>|<cell|=>|<cell|<br>\<times\><wide|<br>|\<ddot\>>.>>>>
  </eqnarray>

  Noticing that

  <\eqnarray>
    <tformat|<table|<row|<cell|<frac|\<mathd\>|\<mathd\>
    t><around*|(|<br>\<times\><wide|<br>|\<dot\>>|)>>|<cell|=>|<cell|<wide|<br>|\<dot\>>\<times\><wide|<br>|\<dot\>>+<br>\<times\><wide|<br>|\<ddot\>>=<br>\<times\><wide|<br>,|\<ddot\>>>>>>
  </eqnarray>

  wehave that\ 

  <\eqnarray>
    <tformat|<table|<row|<frac|\<mathd\>|\<mathd\>
    t><around*|(|<br>\<times\><wide|<br>|\<dot\>>|)>|<cell|=>|<cell|0>>>>
  </eqnarray>

  and hence <math|<br>\<times\><wide|<br>|\<dot\>>=<br>\<times\><bv>=constant>.
  In particular, we have that the angular momentum of the object in orbit,
  i.e. <math|<bh>\<assign\><br>\<times\><bv>> is conserved.

  <\definition>
    <label|Specific Angular Momentum><dueto|Specific Angular Momentum>For an
    orbiting body with position <math|<br>> and velocity <math|<bv>>, we
    define its specific angular momentum <math|<bh>> as

    <\equation>
      <bh>\<assign\><br>\<times\><bv>.
    </equation>
  </definition>

  <\remark>
    <dueto|Orbital Plane>For an orbiting object with a constant specific
    angular momentum <math|<bh>>, position <math|<br>> and velcity
    <math|<bv>>. Since <math|<bh>> is perpendicular to both <math|<br>> and
    <math|<bv>>, if <math|<bh>> is constant over time, it must follow that
    <math|<br>> and <math|<bv>> lie in the same plane for all time. We refer
    to this plane as the <with|font-shape|italic|orbital plane>.
  </remark>

  <big-figure|<with|gr-mode|<tuple|edit|text-at>|gr-frame|<tuple|scale|1.41422cm|<tuple|0.5gw|0.5gh>>|gr-geometry|<tuple|geometry|1par|0.6par>|gr-grid|<tuple|empty>|gr-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-edit-grid-aspect|<tuple|<tuple|axes|none>|<tuple|1|none>|<tuple|10|none>>|gr-edit-grid|<tuple|empty>|gr-edit-grid-old|<tuple|cartesian|<point|0|0>|1>|gr-dash-style|11100|gr-arrow-end|\<gtr\>|magnify|1.41421356236662|<graphics||<point|0|0>|<carc|<point|-3|-1>|<point|-2.0|-2.0>|<point|-2.0|-1.0>>|<with|arrow-end|\|\<gtr\>|<line|<point|-2.5|-1.5>|<point|0.0|0.0>>>|<with|dash-style|11100|<line|<point|0|0>|<point|2.5|1.5>>>|<with|arrow-end|\|\<gtr\>|<line|<point|0.0|0.0>|<point|0.4|2.0>>>|<math-at|<br>|<point|-1.2|-0.5>>|<math-at|<bv>|<point|0.4|2.2>>|<with|arrow-end|\<gtr\>|dash-style|11100|<arc|<point|-0.6|1.2>|<point|-0.2|1.4>|<point|0.28|1.4>>>|<with|arrow-end|\<gtr\>|dash-style|11100|<arc|<point|1.1|0.66>|<point|0.9|1.0>|<point|0.28|1.4>>>|<math-at|\<phi\>|<point|-0.3|1.6>>|<math-at|\<gamma\>|<point|0.9|1.3>>|<with|dash-style|11100|<line|<point|-1.2|2.0>|<point|1.3|-2.0>>>|<text-at|local
  vertical|<point|2.6|1.5>>|<text-at|local
  horizontal|<point|0.60695565907204|-2.29278422843512>>|<text-at|Oribtal
  plane|<point|-5.12978098946458|2.80911121245074>>|<text-at||<point|3.23195|-0.644719>>>>|Depiction
  of the <with|font-shape|italic|orbital plane> and the flight path angle
  <math|\<phi\>> of the satellite.>

  The concept of <with|font-shape|italic|up> and
  <with|font-shape|italic|down> is arbitrary and depends on what you are up
  and down with respect to. So as long as you are refering to a specific
  point, no matter where you are in space, is it alway possible to define
  <with|font-shape|italic|up> and <with|font-shape|italic|down>. We can
  define the concept of <with|font-shape|italic|up> as being the direction(s)
  directly away from from the point of reference, and
  <with|font-shape|italic|down> as the direction directly towards the
  reference point.

  Choosing our reference point to be the centre of mass of the larger object
  with mass <math|M>, we find that <math|<br>> correponds with the
  <with|font-shape|italic|up> direction (and <math|-<br>> the
  <with|font-shape|italic|down> direction). Indeed, with this identification,
  we can define the <with|font-shape|italic|local horizonal> and
  <with|font-shape|italic|local vertical> to be the directions that are,
  respectively, perpendicular and parallel to
  <math|<with|font-series|bold|<br>>> in the oribtal plane. From this, we let
  the <with|font-shape|italic|zenith angle>
  <math|\<gamma\>\<in\><around*|[|-\<pi\>,\<pi\>|)>> specify the angle that
  the velocity makes with the local vertical, and the
  <with|font-shape|italic|flight (elevation) angle>
  <math|\<phi\>\<in\><around*|[|-\<pi\>,\<pi\>|)>> specify the angle that the
  velocity makes with the local horizonal.

  Indeed, with this identification, we can write the magnitude specific
  angular momentum of an orbiting body as

  <\equation*>
    h\<assign\><choice|<tformat|<table|<row|<cell|r v sin
    \<gamma\>>>|<row|<cell|r v cos \<phi\>>>>>>
  </equation*>

  where <math|h\<assign\><around*|\||<bh>|\|>,r\<assign\><around*|\||<br>|\|>>,
  and <math|v\<assign\><around*|\||<bv>|\|>>.

  <\example>
    Assume that in an instantaneous snapshot in time, in an inertial
    coordinate system, the position and velocity of a satellite are given by

    <\eqnarray>
      <tformat|<table|<row|<cell|<br>>|<cell|=>|<cell|<around*|(|4.1852,6.2778,10.4630|)>\<times\>10<rsup|7>
      ft>>|<row|<cell|<bv>>|<cell|=>|<cell|<around*|(|2.5936,5.1872,0.0000|)>\<times\>10<rsup|4>
      ft/sec.>>>>
    </eqnarray>

    Then, it follows that the specific angular momentum of the satellite is

    <\equation*>
      <bh>=<br>\<times\><bv>=<around*|(|-5.4274,2.7137,0.5427|)>\<times\>10<rsup|12>ft<rsup|2>/sec
    </equation*>
  </example>

  <\session|python|default>
    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      r=np.array([4.1852,6.2778,10.4630])
    </input>

    <\input>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|input>
      v=np.array([2.5936, 5.1872,0])
    </input>

    <\unfolded-io>
      \<gtr\>\<gtr\>\<gtr\>\ 
    <|unfolded-io>
      np.cross(r,v)
    <|unfolded-io>
      [-54.2736736 \ \ 27.1368368 \ \ \ 5.42736736]
    </unfolded-io>
  </session>

  Furthermore, we have that\ 

  <\eqnarray>
    <tformat|<table|<row|<cell|r>|<cell|=>|<cell|>>|<row|<cell|v>|<cell|=>|<cell|>>|<row|<cell|h>|<cell|=>|<cell|>>>>
  </eqnarray>

  <subsubsection|Trajectory Equation>

  \;

  \;

  \;

  \;
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|Equation of Motion With Constant Mass|<tuple|8|3>>
    <associate|Full Equation of Motion|<tuple|7|3>>
    <associate|NL2|<tuple|1|1>>
    <associate|NLG|<tuple|2|1>>
    <associate|Specific Angular Momentum|<tuple|3|6>>
    <associate|Specific Mechanical Energy|<tuple|2|5>>
    <associate|Sum Grav Forces|<tuple|3|2>>
    <associate|Total Force|<tuple|4|2>>
    <associate|Two Body Problem|<tuple|11|4>>
    <associate|Two Body Problem Plus Perturbations|<tuple|10|4>>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|2.2|4>>
    <associate|auto-11|<tuple|2.2.1|4>>
    <associate|auto-12|<tuple|2.2.2|5>>
    <associate|auto-13|<tuple|1|6>>
    <associate|auto-14|<tuple|2.2.3|7>>
    <associate|auto-2|<tuple|1.1|1>>
    <associate|auto-3|<tuple|1.2|1>>
    <associate|auto-4|<tuple|1.3|1>>
    <associate|auto-5|<tuple|1|1>>
    <associate|auto-6|<tuple|2|2>>
    <associate|auto-7|<tuple|2.1|3>>
    <associate|auto-8|<tuple|2.1.1|3>>
    <associate|auto-9|<tuple|1|4>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|figure>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||Depiction of the
      <with|font-shape|<quote|italic>|orbital plane> and the flight path
      angle <with|mode|<quote|math>|\<phi\>> of the
      satellite.>|<pageref|auto-13>>
    </associate>
    <\associate|table>
      <tuple|normal|<surround|<hidden-binding|<tuple>|1>||>|<pageref|auto-9>>
    </associate>
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

      <with|par-left|<quote|1tab>|2.1<space|2spc>Equations of Constant Mass
      and No External Forces <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <with|par-left|<quote|2tab>|2.1.1<space|2spc>The Motions of the Earth
      and Moon <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>The Two-Body Problem
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10>>

      <with|par-left|<quote|2tab>|2.2.1<space|2spc>Conservation of Mechanical
      Energy <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-11>>

      <with|par-left|<quote|2tab>|2.2.2<space|2spc>Conservation of Angular
      Momentum <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-12>>

      <with|par-left|<quote|2tab>|2.2.3<space|2spc>Trajectory Equation
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-14>>
    </associate>
  </collection>
</auxiliary>