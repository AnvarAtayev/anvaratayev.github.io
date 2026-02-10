---
date: 2024-08-02
title: Fermat's Little Theorem
math: true
tags: ["combinatorics"]
categories: "mathematics"
summary: "A cute little trick to solving Fermat's Little Theorem."
---

This is an oldie, but a cute little trick to solving Fermat's Little Theorem that I came across back when I was an undergraduate. This is a  well known proof and can be found in Wikipedia[^Wikipedia], although I found this proof in an article posted by Fermat's Library [^FermatsLibrary].

{{% env type="theorem" title="Fermat's Little Theorem" %}}
If $p$ is a prime number and $p \nmid n$ for $n \in \mathbb{N}$, then $n^p \equiv n \mod p$.
{{% /env %}}
{{% env type="proof" %}}
Let's say that you want to make as many distinct types of necklaces as you can with $p$ (colourless) beads at your disposal, and where you can colour each bead with $n$ different colours. Assume also you only want to make multi-coloured necklaces, and that $p$ is prime.

What we can initially do is put all of our beads on some open-ended string, which we'll call a *chain*, and once we join the ends of our chain, we will get a _necklace_. On each bead, we can choose from $n$ colours, and therefore we can make $n \cdot n \cdot n \cdots n = n^p$ such chains. If one wishes, one can make a whole chain, and therefore necklace, of one colour, and as there are $n$ colours to choose from, we can make $n$ distinct monotone chains. Since we only wish to make multi-coloured necklaces, we are left with $n^p-n$ potential chains, e.g. `R-G-G`, `R-G-B`.

Combining the ends of our chains, we now make a necklace. We notice straight away that some necklaces are identical up to a rotation (i.e. cyclic permutation), e.g. the necklace from the chain `R-G-B` is the *same* as from the chains `G-B-R` and `B-R-G` after a rotation. Since there are $p$ beads in each necklace, and $p$ is prime, each necklace has $p$ identical (up to rotation) necklaces. Therefore, we can make $\frac{n^p-n}{p}$ (an integer) distinct necklaces, i.e. $n^p \equiv n \mod p$, which concludes our proof.
{{% /env %}}

[^Wikipedia]: [Wikipedia: Proof of Fermat's Little Theorem](https://en.wikipedia.org/wiki/Proofs_of_Fermat%27s_little_theorem#Combinatorial_proofs)
[^FermatsLibrary]: [Fermat's Library Article](https://fermatslibrary.com/s/combinatorial-proof-of-fermats-little-theorem)