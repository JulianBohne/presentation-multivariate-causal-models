---
# This top block is some meta information about your deck, which is for example used in the title slide.
# The format here is `yaml`
title: 'GES - Global Equivalence Search'
subtitle: 'Optimal Structure Identificatin With Greedy Search'
author: 'Julian Bohnenkämper'
affiliation:
  - 'TU Dortmund'
  - '29.10.2026'
footer-text: Global Equivalence Search - Julian Bohnenkämper
---

# Overview

- Review / Notation
- GES Overview
- Scoring Functions
- Conclusion
$\newcommand{\b}{\mathbf}$
$\newcommand{\scm}{\mathfrak{C}}$
$\newcommand{\parents}{\b{Pa}}$
$\newcommand{\indep}{\perp \!\!\!\! \perp}$
$\newcommand{\graph}{\mathcal G}$
$\newcommand{\pdag}{\mathcal P}$
$\newcommand{\class}{\mathcal E}$
$\newcommand{\inmap}{\mathcal H}$
$\newcommand{\params}{\boldsymbol \theta}$
$\newcommand{\data}{\b D}$
$\newcommand{\desc}{\b{De}}$
$\newcommand{\neighborsadd}{\boldsymbol \class^+}$
$\newcommand{\neighborsdel}{\boldsymbol \class^-}$

# Review / Notation

- Generative distribution: $p(\:\cdot\:)$ --- e.g., Gaussian
  - DAG: $\graph$
  - Perfect map: Markov + Faithfulness
- Equivalence class: $\graph \approx \graph' \implies \graph' \in \class(\graph)$
  - Same skeleton & same v-structures
- PDAG: $\pdag$
  - Complete: TODO:
- DAG $\inmap$ is an independence map of DAG $\graph$: $X \indep_\inmap Y | \b S \implies X \indep_\graph Y | \b S$
  - $\graph \leq \inmap$

# GES Overview

- Goal: Find a DAG $\graph$ that is a perfect map of $p$
- Start: Empty graph equivalence class $\class$
- Phase 1
  - Add edges until score maximum score reached
    - $p(\:\cdot\:)$ can be modeled with $\graph$
- Phase 2
  - Remove edges until score maximum score reached
    - $\class$ now contains a perfect map (if one exists)
- Worst case states visited: $n \cdot (n - 1)$ ($n = \text{\#variables}$)
  - But wait, isn't the problem NP-Hard?

# Scoring Functions

::: incremental

- Bayesian scoring criterion: $S_B(\graph, \data) = \log \underbrace{p(\graph^h)}_{\text{Prior}} + \log \underbrace{p(\data | \graph^h)}_{\text{Marginal\\likelihood}}$
- Consistent in the limit of infinite data:
  1. $\inmap$ contains $p$ and $\graph$ does not $\implies S(\inmap, \data) > S(\graph, \data)$
  2. $\inmap$ and $\graph$ contain $p$, but $\graph$ has fewer parameters $\implies S(\graph, \data) > S(\inmap, \data)$
- Locally Consistent in the limit of infinite data
  - $\graph'$ is $\graph$ with additional edge $X_i \to X_j$
  1. $X_j \not \indep_p X_i | \parents_j^\graph \implies S(\graph', \data) > S(\graph, \data)$
  2. $X_j \indep_p X_i | \parents_j^\graph \implies S(\graph', \data) < S(\graph, \data)$

:::

# Meek's Conjecture

:::incremental

- Given DAGs $\graph$ and $\inmap$ with $\graph \leq \inmap$
  - $r$ --- number of flipped edges
  - $m$ --- number of edges in $\inmap$ not in $\graph$
- Max $r + 2m$ edge reversals and additions

  necessary to transform $\graph$ into $\inmap$
  - Each edge reversed is a covered edge
  - After each step $\graph$ is a DAG and $\graph \leq \inmap$

:::

# Search Spaces

# Assumptions

- Perfect map and iid data
- Score equivalence

# Conclusion
- yup

# Literature

- [Chickering, David Maxwell. "Optimal structure identification with greedy search." Journal of machine learning research 3.Nov (2002): 507-554](https://jmlr.org/papers/volume3/chickering02b/chickering02b.pdf)
