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

- Structural Causal Models
	- Observation
	- Intervention
	- Counterfactual
- Markov Property
	- $d$-Separation
- Faithfulness
- Causal Minimality
$\newcommand{\b}{\mathbf}$
$\newcommand{\scm}{\mathfrak{C}}$
$\newcommand{\parents}{\b{PA}}$
$\newcommand{\indep}{\perp \!\!\!\!\! \perp}$

# Structural Causal Models

::: { .center style="transform: translate(0, -100%);" }
How do variables relate?
:::

::: columns-1-1

::: {}

Structural Assignments
$$
\begin{align*}
	X_1 &:= N_{X_1}  & N_{X_1} &\sim \mathcal N(0, 1)\\
	Y &:= X_1 + N_Y & N_Y &\sim \mathcal N(0, 1)\\
	X_2 &:= Y + N_{X_2} & N_{X_2} &\sim \mathcal N(0, 0.1)
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

::: { .center style="transform: translate(0, -100%);" }
What is the distribution?
:::

::: columns-1-1

::: {}

Structural Assignments
$$
\begin{align*}
	X_1 &:= N_{X_1}  & N_{X_1} &\sim \mathcal N(0, 1)\\
	Y &:= X_1 + N_Y & N_Y &\sim \mathcal N(0, 1)\\
	X_2 &:= Y + N_{X_2} & N_{X_2} &\sim \mathcal N(0, 0.1)
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

::: { .center style="transform: translate(0, -100%);" }
How does the distribution change?
:::

::: columns-1-1

::: {}

Structural Assignments
$$
\begin{align*}
	X_1 &:= N_{X_1}  & N_{X_1} &\sim \mathcal N(0, 1)\\
	Y &:= X_1 + N_Y & N_Y &\sim \mathcal N(0, 1)\\
	X_2 &:= Y + N_{X_2} & N_{X_2} &\sim \mathcal N(0, 0.1)
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
	- Point mass $X_k := a$
- Not like conditioning

	$p_Y^{\scm; do(X_2 := x)}(y) = p_Y^\scm(y) \neq p_Y^\scm(y | X_2 = x)$

<!--- Invervention variables also possible-->

- Total causal effect from $X$ to $Y$ iff $\exists \tilde N_X. \; X \not\indep Y$ in $P_{\b X}^{\scm; do(X := \tilde N_X)}$
:::

:::

:::

# Counterfactual

::: { .center style="transform: translate(0, -100%);" }
What would have happened?
:::

::: columns-1-1

::: {}

Structural Assignments (Example 6.18 p. 97)
$$
\begin{align*}
	X &:= N_X \\
	Y &:= X^2 + N_Y \\
	Z &:= 2 \cdot Y + X + N_Z
\end{align*}
$$
with $N_X, N_Y, N_Z \overset{\text{iid}}{\sim} \mathrm{U}(\{-5, -4, \dots, 4, 5\})$

::: { .fragment data-fragment-index="1" }
<br>
Observe $(X, Y, Z) = (1, 2, 4)$
:::

::: { .fragment data-fragment-index="5" }
$P_{\b N}^{\scm | \b X | \b x} \implies (N_X, N_Y, N_Z) = (1, 1, -1)$
:::

<!--<br>
Causal Graph TODO: If I got time
![Example p. 90](images/simple-scm.png){ width=100% }-->

:::



- Not transitive

:::


# Markov Property

# $d$-Separation

# Faithfulness

# Causal Minimality

# Cool Stuff

- 

# Literature

- [Chapter 6, Multivariate Causal Models. Peters et al. Elements of Causal Inference](https://peachf.org/images/Science/MachLearnCausalInferencePeters.pdf)
