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
$\newcommand{\graph}{\mathcal G}$

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
Causal Graph $\graph$
![Example 6.10 p. 90](images/simple-scm.png){ width=100% }
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
Causal Graph $\graph$
![Example 6.10 p. 90](images/simple-scm.png){ width=100% }

:::

::: incremental
- $P^\scm_{\b X}$: Entailed distribution
	- $\b X = (X_1, Y, X_2)$
- Ancestral Sampling
	1. Sample noise i.i.d.
	2. Use structural assignments
- Can be modeled without SCM
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
Causal Graph $\graph$
![Example 6.10 p. 90](images/simple-scm.png){ width=100% }

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

- Also possible without SCM
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

<br>

::: { .fragment data-fragment-index="1" }
- Observe $\b x = (X, Y, Z) = (1, 2, 4)$
:::
::: { .fragment data-fragment-index="3" }
- $P_{\b N}^{\scm | \b X = \b x} \implies (N_X, N_Y, N_Z) = (1, 1, -1)$
:::
::: { .fragment data-fragment-index="5" }
- $P_Z^{\scm | \b X = \b x; do(X := 2)} \implies Z = 11$
:::

:::

::: {}

::: {.fragment data-fragment-index="2"}
- Condition $\b N$ on $\b X = \b x$: $P_{\b N}^{\scm | \b X = \b x} := P_{\b N | \b X = \b x}$
	- Counterfactual SCM $\scm_{\b X = \b x} := \big( \b S, P_{\b N}^{\scm | \b X = \b x} \big)$
:::
::: {.fragment data-fragment-index="4"}
- Now intervene $P_Z^{\scm | \b X = \b x; do(X := 2)}$
:::
::: {.fragment data-fragment-index="6"}
- Not transitive
	- $Y = 5$ if $X = 2$
	- $Z = 10$ if $Y = 5$
	- $Z \neq 10$ if $X = 2$
:::
::: {.fragment data-fragment-index="7"}
- Same intervention distributions $\not\Rightarrow$ Same counterfactual statements
	- SCM holds more information than its Graph
:::

:::

:::

# Markov Property

A given DAG $\graph$ and joint distribution $P_{\b X}$ satisfies the...

::: incremental
- ...**global Markov property** if $\b A \b \indep_\graph \b B \b | \b C \implies \b A \indep \b B | \b C.$
- ...**local Markov property** if each variable is independent of its non-descendants given its parents.
- ...**Markov factorization property** if $p(\b x) = p(x_1, \dots, x_d) = \prod_{j=1}^d p(x_j | \parents_j^\graph).$
:::

::: { .fragment .center }
All equivalent and usable with SCM graphs! 🥳
:::

# $d$-Separation 〰🖊
<!--  -->


# Faithfulness

Given distribution $P_{\b X}$ and DAG $\graph$

::: incremental
- $P_{\b X}$ is faithful to $\graph$ if: $\b A \indep \b B | \b C \implies \b A \indep_\graph \b B | \b C$
- $\b A \not\indep_\graph \b B | \b C \implies \b A \not\indep \b B | \b C$
	- Infer dependencies from graph
:::

# Causal Minimality

Given distribution $P_{\b X}$ and DAG $\graph$

::: incremental
- $P_{\b X}$ satisfies causal minimality w.r.t. $\graph$ if it is Markovian w.r.t. $\graph$,<br>but no proper subgraph of $\graph$ is.
- Equivalent: $\forall X_j. \quad \forall Y \in \parents_j^\graph. \quad X_j \not\indep Y | \parents_j^\graph \setminus \{Y\}.$
	- No connection is inactive
:::

# Other Properties

::: incremental
- Markov Equivalence (same Markovian distributions possible for $\graph$)<br>![Figure 6.4 p.103](images/markov-equiv.png){ width=90% }<br>(Same skeleton and v-structures)
- Markov blanket
	- Smallest $M$ s.t. $Y \indep_\graph \b V \setminus (\{ Y \} \cup M) \;|\; M$
	- DAG: $M = \parents_Y \cup \b{CH}_Y \cup \parents_{\b{CH}_Y}$
- Reichenbach’s common cause principle
	- Dependence between $X$ and $Y$ $\implies$ directed path between them or from common cause
:::

# Literature

- [Chapter 6, Multivariate Causal Models. Peters et al. Elements of Causal Inference](https://peachf.org/images/Science/MachLearnCausalInferencePeters.pdf)
