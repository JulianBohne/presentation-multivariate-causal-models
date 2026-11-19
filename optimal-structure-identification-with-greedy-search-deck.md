---
# This top block is some meta information about your deck, which is for example used in the title slide.
# The format here is `yaml`
title: 'GES - Global Equivalence Search'
subtitle: 'Optimal Structure Identificatin With Greedy Search'
author: 'Julian Bohnenkämper'
affiliation:
  - 'TU Dortmund'
  - '19.11.2026'
footer-text: Global Equivalence Search - Julian Bohnenkämper
---

# Overview

- Review / Notation
- Global Equivalence Search
  - Overview
  - States and their Neighbors
  - Scoring Function Properties
  - Independence Map
  - Meek's Conjecture
- Search Space Representation & Operators
- Assumptions
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

# Review / Notation (1 / 2)

::: incremental

- Generative distribution: $p(\:\cdot\:)$ --- e.g., Gaussian
- DAG: $\graph = (E, V)$
- Perfect map
  - Markov: $\b A \indep_\graph \b B \:|\: \b C \implies \b A \indep_p \b B \:|\: \b C$
  - Faithfulness: $\b A \indep_p \b B \:|\: \b C \implies \b A \indep_\graph \b B \:|\: \b C$

:::



# Review / Notation (2 / 2)

::: incremental

- Equivalence class: $\graph \approx \graph' \implies \graph' \in \class(\graph)$
  - Same skeleton & same v-structures
- PDAG: $\pdag$
  - Complete: *Reversible* edges are undirected, *compelled* edges directed

:::

![DAG (a) and completed PDAG (b)](images/DAG-completed-PDAG.png){ .fragment width="60%" }

# GES Overview

::: incremental

- Goal: Find a DAG $\graph$ that is a perfect map of $p$
- Start: Equivalence class $\class$ of graph without edges
- Phase 1: Add next edge using scoring criterion
  - Repeat until local maximum reached, then continue to phase 2
    - Now $p(\:\cdot\:)$ can be modeled with $\graph \in \class$
- Phase 2: Delete edge using scoring criterion
  - Repeat until maximum reached, then done!
    - $\class$ now contains a perfect map (if one exists)
- Worst case $n \cdot (n - 1)$ states visited ($n = \text{\#variables}$)
  - But wait, isn't the problem NP-Hard? [Yes 😅]{ .fragment }

:::

# States and their Neighbors

![](images/neighbors.png){ .fragment width="80%" }

# Scoring Function Properties

::: incremental

- Bayesian scoring criterion: $S_B(\graph, \data) = \log \underbrace{p(\graph^h)}_{\text{Prior}} + \log \underbrace{p(\data | \graph^h)}_{\text{Marginal\\likelihood}}$
- Consistent in the limit of large data:
  1. $\inmap$ contains $p$ and $\graph$ does not $\implies S(\inmap, \data) > S(\graph, \data)$
  2. $\inmap$ and $\graph$ contain $p$, but $\graph$ has fewer parameters $\implies S(\graph, \data) > S(\inmap, \data)$
- Locally consistent in the limit of large data
  - $\graph'$ is $\graph$ with additional edge $X_i \to X_j$
  1. $X_j \not \indep_p X_i | \parents_j^\graph \implies S(\graph', \data) > S(\graph, \data)$ 👈
  2. $X_j \indep_p X_i | \parents_j^\graph \implies S(\graph', \data) < S(\graph, \data)$
  - Scoring criterion is decomposable: $S(\graph, \data) = \sum_{i = 1}^n s(X_i, \parents_i^\graph)$
:::

# Why do we get a perfect map at the end?

# Independence Map

- DAG $\inmap$ is an independence map of DAG $\graph$: $X \indep_\inmap Y | \b S \implies X \indep_\graph Y | \b S$

![$\graph\text{ (a)} \leq \inmap\text{ (b)}: \quad A \indep B,\quad A \indep E \:|\: \{C\},\quad B \indep E \:|\: \{C\}$](images/indep-map.png){ .fragment width="70%" }

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

# Search Space Problems

::: incremental

- 8 Variables: >700B DAGs and >200B equivalence classes
- GED visits $\leq n \cdot (n - 1)$ states
  - In practice even linear
- Generate and evaluate neighbors
  - ~~Work on sets of DAGs~~
  - Work directly on equivalence class representation (completed PDAGs)

:::

# Operators on Completed PDAGs $\pdag$

::: { .incremental style="margin-top: -5%" }

- $Insert(X, Y, \b T)$
  - Before: $Y - \b T$ and $Y$ not adjacent to $X$
  - After: $X \to Y \leftarrow \b T$

- $Delete(X, Y, \b H)$
  - Before: $X -\!\!\circ Y - \b H \circ\!\!-\!\!\circ X$
  - After: $H \leftarrow Y \quad (H \in \b H)$ and leave $X \circ\!\!-\!\!\circ H$ if it is directed, otherwise $X \to H$

- Valid? [Can be checked quickly ✅]{ .fragment }
- Complete? [Only necessary for move (not evaluation) 😁]{ .fragment }
  - $O(|E|\cdot k^2) \quad (k\text{ max parents per node})$
- Local update rules for validity and score
- Worst case: Exponential number of valid operators 😅

:::

# Assumptions

::: incremental

- Perfect map (over observable variables) and iid data
  - Refinement of the hypotheses $\graph^h$ necessary
  - We may only find a minimal independence map of the optimal solution
- Consistent score that is decomposable in the limit
- Score equivalence
  - To easily find a highest-scoring DAG in a class
- Cause-effect relationships can be modeled into the scoring criterion

:::

# Conclusion
- Greedy score based algorithm working on completed

  PDAGs as an equivalence class representation
  - Phase 1: Add edges until score is maximal
    - $p$ is in $\class$
  - Phase 2: Remove edges until score is maximal
    - $\class$ is perfect map of $p$
- Theoretically exponential runtime,

  but fast in practice due to sparse neighbors.

- Comparison: Better on synthetic dataset,

  about the same on real world data.

# Literature

- [Chickering, David Maxwell. "Optimal structure identification with greedy search." Journal of machine learning research 3.Nov (2002): 507-554](https://jmlr.org/papers/volume3/chickering02b/chickering02b.pdf)
