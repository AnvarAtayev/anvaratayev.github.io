---
title: "Higher or Lower"
date: 2026-08-26
math: true
tags: 'general'
summary: "We discuss the game of higher or lower and an optimal strategy when playing."
---

Consider the following card game. A dealer holds a shuffled deck of cards numbered $1$ through $13$ and turns them over one at a time, without replacement. Before each new card is revealed, you wager on whether it will be *higher* or *lower* than the one currently showing, at even money. You start with a bankroll of $1000$ and may only stake multiples of $100$. What is your strategy for maximising your wealth?

This is a Kelly betting problem, see [earlier post](/posts/mathematics/20251006_kelly_criterion.md), but with the win probability $p$ changing each round. As an optimal strategy, Kelly says to stake a fraction $2p - 1$ of your bankroll, where $p$ is the current probability of winning. We demonstrate the approach below, and then argue formally that it is optimal.

## Example

Suppose the dealer opens with a $2$, and the game runs as follows. Shaded cards are still in the deck, the black card is the one showing, and struck-out cards have already been dealt.

{{< deckstrip sequence="2,10,5,3" round=1 >}}

Of the twelve cards left, only the $1$ is below the $2$ and the other 11 are above it, giving $p = 11/12$ of a higher card on the next reveal. Kelly suggests we stake $2p - 1 = \frac{5}{6}$ of the bankroll, which is $800$ at $100$ lot size. A $10$ is drawn, so the bet wins and the bankroll becomes $1800$.

{{< deckstrip sequence="2,10,5,3" round=2 >}}

The $2$ has already gone, so eight cards lie below the $10$ rather than nine, and the probability of a lower card is $p = 8/11$. The Kelly stake is then again $800$. A $5$ is drawn, taking the bankroll to $2600$.

{{< deckstrip sequence="2,10,5,3" round=3 >}}

Here, the probability of a higher card is $p = 7/10$. The Kelly stake is now $1000$, purely because the bankroll has grown. This time a $3$ is drawn and the bet loses, bringing the bankroll back down to $1600$.

Play continues in this way for twelve rounds, until the deck is exhausted.

## Game

Below is the game that you can play through. During the game, try to keep tabs on your current bankroll, cards dealt, and the probability of winning each round. All of that is hidden by default, but revealed along with the deck if you would rather read it off than count it.

{{< deckgame >}}

## Formalising the Game

Let $(c_{0}, c_{1}, \ldots, c_{12})$ be a uniformly random ordering of $\{1, \ldots, 13\}$, where $c_{j}$ is the $j$th card turned over and $c_{0}$ is the dealer's opening card. Write $\mathcal{F}_{j} := \sigma (c_{0}, \ldots, c_{j})$ for the information available once $c_{j}$ has been seen. All randomness is carried by this initial shuffle.

There are twelve betting rounds, the opening reveal not being a bet: **round $k$ is placed on the face-up card $c_{k - 1}$ and settled by the next reveal $c_{k}$**, for $k = 1, \ldots, 12$. Everything known at the moment of betting therefore carries the card index $k - 1$, which is easier to read relabelled by the round,

$$
f_{k} := c_{k - 1}, \qquad
R_{k} := \{1, \ldots, 13\} \setminus \{c_{0}, \ldots, c_{k - 1}\}, \qquad
|R_{k}| = 13 - k,
$$

the card showing at round $k$ and the deck it is played against. Note that $f_{k} \notin R_{k}$, and that $c_{k}$ is drawn uniformly from $R_{k}$.

### Per-Round Win Probability

Given $\mathcal{F}_{k - 1}$, define

$$
\begin{eqnarray}
  H_{k} & := & |\{x \in R_{k} : x > f_{k}\}|, \nonumber \\
  L_{k} & := & |\{x \in R_{k} : x < f_{k}\}|, \nonumber
\end{eqnarray}
$$

the unseen cards above and below the card showing, so that $H_{k} + L_{k} = |R_{k}| = 13 - k$. Since $c_{k}$ is uniform on $R_{k}$, backing the larger side $d_{k} \in \{H, L\}$ wins with probability

$$
p_k = \frac{\max\{H_k, L_k\}}{13 - k} \geq \frac{1}{2},
$$

with $p_k = 1/2$ exactly when $H_k = L_k$, and $p_k = 1$ when every card in $R_{k}$ lies on one side of $f_{k}$.

### The Bankroll Process

Let $T_{k} = +1$ if $c_k$ falls on the backed side $d_{k}$ and $-1$ otherwise, so that $T_{k}$ is $\mathcal{F}_{k}$-measurable with $\mathbb{P} (T_{k} = 1 \mid \mathcal{F}_{k - 1}) = p_{k}$. Staking a fraction $\lambda_{k} \in [0, 1]$ of the bankroll, fixed before the card is turned and so $\mathcal{F}_{k - 1}$-measurable,

$$
\begin{eqnarray}
  W_{k} & = & W_{k - 1} (1 + \lambda_{k} T_{k}), \nonumber \\
  W_{0} & = & 1000. \nonumber
\end{eqnarray}
$$

The increments are neither independent nor identically distributed, since the law of $T_{k}$ depends on the cards already seen. To see how the bankroll moves in expectation, note that $W_{k - 1}$ and $\lambda_{k}$ are both known at the moment of betting and so come out of the conditional expectation as constants, leaving only

$$
\mathbb{E} [T_{k} \mid \mathcal{F}_{k - 1}] = (+1) p_{k} + (-1) (1 - p_{k}) = 2 p_{k} - 1,
$$

the profit per unit staked on an even-money bet won with probability $p_{k}$. Hence

$$
\mathbb{E} [W_{k} \mid \mathcal{F}_{k - 1}] = W_{k - 1} \big( 1 + \lambda_{k} (2 p_{k} - 1) \big).
$$

Any stake grows the bankroll in expectation whenever $p_{k} > 1/2$, but the growth is *linear* in $\lambda_{k}$: on this criterion alone one would stake everything, every round, and be wiped out by the first loss. Sizing the stake sensibly needs a different objective.

### The Kelly Stake for One Round

Each round is an even-money bet at $\mathcal{F}_{k-1}$-measurable odds $p_{k}$, so the Kelly argument applies stage by stage: the fraction maximising $\mathbb{E} [\log (W_{k}) \mid \mathcal{F}_{k - 1}]$ is

$$
\pi_{k} := 2 p_{k} - 1 = \frac{|H_{k} - L_{k}|}{13 - k} \in \left[ 0, 1 \right].
$$

Opening on a $2$ gives $H_1 = 11$, $L_1 = 1$ and $\pi_{1} = \frac{5}{6}$; opening on a $1$ gives $\pi_1 = 1$, the whole bankroll staked on a certainty.

Kelly's fraction is therefore exactly the conditional mean of $T_{k}$ computed above, and putting $\lambda_{k} = \pi_{k}$ into the expected-wealth identity gives

$$
\mathbb{E} [W_{k} \mid \mathcal{F}_{k - 1}] = W_{k - 1} (1 + \pi_{k}^{2}) \geq W_{k - 1},
$$

with equality exactly when $H_{k} = L_{k}$: the bankroll grows in expectation precisely in those rounds where counting gives an edge. The square is $\pi_{k}$ appearing twice for two different reasons, once as the fraction staked and once as the profit per unit staked.

All of this concerns the round in front of you. That the same fraction is also right for the game as a whole does not follow automatically, since a myopic rule can in general be beaten by one that gives up something now to set up later rounds.

### Optimality Over the Whole Game

The horizon here is finite, twelve rounds, so the asymptotic growth-rate argument does not apply directly. Kelly is nonetheless globally optimal, because log-utility separates additively across rounds. Taking logarithms of the recursion,

$$
\log (W_{12}) = \log (W_{0}) + \sum_{k = 1}^{12} \log (1 + \lambda_{k} T_{k}),
$$

and applying the tower property,

$$
\mathbb{E} [\log (W_{12})] = \log (W_{0}) + \sum_{k = 1}^{12} \mathbb{E}
\Big[ \mathbb{E} \big[ \log (1 + \lambda_{k} T_{k}) \mid \mathcal{F}_{k - 1}
\big] \Big].
$$

Each summand depends only on the $\mathcal{F}_{k - 1}$-measurable choice of $\lambda_{k}$, not on $\lambda_{j}$ for $j \neq k$, so maximising each conditionally maximises the sum, and each is maximised at $\lambda_{k} = \pi_{k}$. The one-step-ahead rule is therefore optimal for the *whole* game under this objective; maximising $\mathbb{E} [W_{12}]$ instead returns to the linear identity above and stakes the entire bankroll every round, as in the Kelly Criterion post.

### The \$100 Lot Constraint

Writing $B_{k}$ for the cash staked in round $k$, the derivation allows any $B_{k} \in [0, W_{k - 1}]$ and settles on $B_{k} = \pi_{k} W_{k - 1}$. The game permits only multiples of \$100, so one takes the largest such multiple not exceeding that,

$$
B_{k} = 100 \left\lfloor \frac{\pi_{k} W_{k - 1}}{100} \right\rfloor,
$$

which is why the example stakes $800$ rather than $\pi_1 W_0 = 833.\overline{3}$. Rounding down errs on the conservative side of the optimum.
