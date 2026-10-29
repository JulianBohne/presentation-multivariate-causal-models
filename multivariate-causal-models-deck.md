---
# This top block is some meta information about your deck, which is for example used in the title slide.
# The format here is `yaml`
title: 'Multivariate Causal Models'
subtitle: 'Seminar: Elements of Causal Discovery'
author: 'Julian Bohnenkämper'
affiliation:
  - 'TU Dortmund'
  - '29.10.2026'
footer-text: Multivariate Causal Models - Julian Bohnenkämper
---

# Overview

- hi there!
$\newcommand{\b}{\mathbf}$
$\newcommand{\scm}{\mathfrak{C}}$
$\newcommand{\parents}{\b{PA}}$

# Structural Causal Models

::: columns-1-1

::: {}

Structural Assignments
$$
\begin{align*}
	X_1 &:= N_{X_1}  && (N_{X_1} \sim \mathcal N(0, 1))\\
	Y &:= X_1 + N_Y && (N_Y \sim \mathcal N(0, 1))\\
	X_2 &:= Y + N_{X_2} && (N_{X_2} \sim \mathcal N(0, 0.1))
\end{align*}
$$

::: fragment
<br>
Causal Graph
![Example p. 90](images/simple-scm.png){ width=100% }
:::

:::

::: incremental
- $\scm := (\b S, P_{\b N})$
- $\b S$: Structural assignments
- $P_{\b N} = P_{N_1, \dots, N_d}$: Independent noise
- $X_j := f_j(\parents_j, N_j) \in \b S$
	- $\parents_j$: Direct causes
	- $X_j$: Direct effect
- Acyclic
- No unnecessary variables

	(structural minimality)
:::

:::

# Observation


::: columns-1-1

::: {}

Structural Assignments
$$
\begin{align*}
	X_1 &:= N_{X_1}  && (N_{X_1} \sim \mathcal N(0, 1))\\
	Y &:= X_1 + N_Y && (N_Y \sim \mathcal N(0, 1))\\
	X_2 &:= Y + N_{X_2} && (N_{X_2} \sim \mathcal N(0, 0.1))
\end{align*}
$$

<br>
Causal Graph
![Example p. 90](images/simple-scm.png){ width=100% }

:::

::: incremental
- $P^\scm_{\b X}$: Entailed distribution
	- $\b X = (X_1, Y, X_2)$
- Ancestral Sampling
	1. Sample noise i.i.d.
	2. Use structural assignments 
:::

:::

# Intervention

::: columns-1-1

::: {}

Structural Assignments
$$
\begin{align*}
	X_1 &:= N_{X_1}  && (N_{X_1} \sim \mathcal N(0, 1))\\
	Y &:= X_1 + N_Y && (N_Y \sim \mathcal N(0, 1))\\
	X_2 &:= Y + N_{X_2} && (N_{X_2} \sim \mathcal N(0, 0.1))
\end{align*}
$$

<br>
Causal Graph
![Example p. 90](images/simple-scm.png){ width=100% }

:::

::: {}

- $P_{\b X}^{\scm; do(X_k := \tilde f (\widetilde \parents_k, \tilde N_k))}$

::: incremental
- $X_k := f (\parents_k, N_k) \to X_k := \tilde f (\widetilde \parents_k, \tilde N_k)$
	- Point mass $P_{\b X}^{\scm; do(X_k := a)}$
- Not like conditioning

	$p_Y^{\scm; do(X_2 := x)}(y) = p_Y^\scm(y) \neq p_Y^\scm(y | X_2 = x)$

- Invervention variables also possible
:::


:::

:::

# Counterfactual
O->O->O

# Total Causal Effect


# $d$-Separation
