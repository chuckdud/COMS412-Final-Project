# Various Systems Modeled and Analyzed in PRISM

Full report [here](./report.pdf)

Here **PRISM** refers to both a *modeling language* and a *model checker*. This project uses the PRISM modeling language to represent various different systems to be analyzed with the PRISM model checker.

## Systems
1. [**Around the Storm**](./around_the_storm/README.md) - simple obstacle avoidance example
1. [**Air Traffic Control**](./air_traffic_control/README.md) - simple Air Traffic Control example
1. [**Through the Storm**](./through_the_storm/README.md) - a more interesting obstacle avoidance example
1. [***654***](./654/README.md) - probabilistic analysis of the dice game *654*

Each of these systems involves the joint behavior a **non-deterministic Agent**, represented by a **Markov Decision Process**, with its **deterministic environment**, represented by **Discrete-Time Markov Chains**.

## Discrete-Time Markov Chains
A **Discrete-Time Markov Chain** (DTMC) is a stochastic process which models the behavior of some deterministic process. For a DTMC, a transition from one state to another is controlled entirely by the transition probabilites of the system. Behavior can be predicted and analyzed without any modification.

Here, DTMCs are represented as finite state machines where every transition is assigned a probability value between 0 and 1. Markov Chain $M_c$ is formally defined as 

$M_c: (S, P, s_0, \Sigma, L)$, with 
- Probability transition function, $P: S \times S \rightarrow [0, 1]$
- Initial state, $s_0$
- Set of atomic propositions, $\Sigma$
- Labeling function, $L$

## Markov Decision Processes
A **Markov Decision Process** (MDP) is a stochastic process modeling the behavior of a *non-deterministic agent*. An *agent* is different from a deterministic process because it must take a *non-deterministic action* for every state transition. This non-deterministic action may affect the probability transition function, therefore behavior cannot be predicted in isolation.

For this project, MDPs are represented as finite state machines with each transition assigned an action as well as a probability value between 0 and 1. Markov Decision Process $M_p$ is formally defined as 

$M_p: (S, s_0, A, \sigma, \Sigma, L)$, where
- Set of states, $S$
- Initial state, $s_0 \in S$
- Finite set of actions, $A$
- Probability transition function, $\sigma: S \times A \times S \rightarrow [0, 1]:$
- Set of atomic propositions, $\Sigma$
- Labeling function, $L$

### Policy
In order to reason about the behavior of a non-deterministic agent modeled by an MDP, we apply a *policy* to resolve the non-determinism. A policy is essentialy a list of rules which the agent must follow, specifying an action the agent must take under certain conditions. Application of a policy to an MDP reduces it to a deterministic system, which we can reason about more effectively.

The problem of finding an optimal policy for a non-deterministic system is very interesting and is explored in more detail in this project.

## Parallel Composition
Given two independent systems which may interact, $N$ and $M$, the joint behavior of the entire system can be modeled with a *parallel composition* of the systems. The parallel composition takes the cross product of each components of the base systems to create a larger system capturing all of the behavior of its parts. This can be used to reason about the interaction between to separate systems, as is done in this project.

Given an non-deterministic agent, $N$, and a deterministic process, $D$, the system resulting from a parallel composition will be non-deterministic and model the interaction between the agent and its environment.

Parallel composition as decribed above can be executed automatically by the PRISM model checker, though it may be done by hand.

## Specifications

PLTL specifications can written in the PRISM modeling language to conduct analysis on systems.

For an LTL specification, $\phi$, the PRISM expression **Pmax?=$\phi$** can be used to analyze a system in the PRISM model checker. This analysis computes a *policy* which resolves the determinism of the parallely-composed MDP in order to maximize probability of satisfying $\phi$. In this way we can create and measure properties of the system by generating policies which optimize certain behaviors. This is the strategy used in this project to analyze systems and quantitatively measure their properties.
