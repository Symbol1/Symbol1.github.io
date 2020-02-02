


# Paper Comments

From the newest to the oldest.

|  Abbreviation  |  Title  |
| :------------: | :-----: |
| [Hypotenuse19] | Polar Codes' Simplicity, Random Codes' Durability |
| [LoglogTime19] | Log-logarithmic Time Pruned Polar Coding |
| [LargeDevia18] | Polar-like Codes and Asymptotic Tradeoff among Block Length, Code Rate, and Error Probability |
| [LoglogTime18] | Log-logarithmic Time Pruned Polar Coding on Binary Erasure Channels |
| [ModerDevia18] | Polar Code Moderate Deviation: Recovering the Scaling Exponent |

[ModerDevia18] focuses on the moderate deviations regime (MDR) of polar coding.
MDR is also called
the moderate deviations principle (MDP) paradigm in some references.
It discusses about the relation among block length ($N$),
error probability ($P$), and code rate ($R$) in the region
where $P$ is about $\exp(-N^\pi)$ and $R$ is about
$\text{Capacity} - N^{-\rho}$ for some positive numbers $\pi,\rho$.
The precise goal is to characterize the region of $(\pi,\rho)$ pairs
that are achievable for $N\to\infty$.

While [ModerDevia18] deals with the classical polar codes
constructed in Arıkan's original paper,
[LargeDevia18] extends the theory to a wide class of polar codes.
We are able to predict, up to some big-$O$ notations,
how codes constructed with a certain kernel $G$ will behave
given the scaling exponent $\mu$ (or its inverse $\rho=1/\mu$)
and the partial distances.
It does not mean that such prediction is easy to make
because finding the scaling exponent ($\mu$ or $\rho$) is difficult.

[LoglogTime18] stands on the result of [ModerDevia18] and shows that
if we would like to tolerate higher error probabilities $P$,
we can reduces the complexity of the encoding and decoding
from $\log N$ to $\log(\log N)$, per information bit.
By *higher* we mean $P$ scales as $N^{-1/5}$;
so the constructed codes still achieve capacity.

While [LoglogTime18] deals with the binary erasure channels,
[LoglogTime19] handles arbitrary symmetric $p$-ary channels,
where $p$ is any prime.
The latter result is similar:
by tolerating error probabilities that converges to $0$ slower,
we can reduce the complexity to $\log(\log N)$ per information bit.
In both [LoglogTime18] and [LoglogTime19], codes are construct with
the standard kernel $[^1_1{}^1_0]$.

We later found (not included in either paper) that
the conclusion generalizes to arbitrary discrete memoryless channels.

[Hypotenuse19] showed that it is possible to construct codes
whose error probabilities and code rates scale like random codes'
and encoding and decoding complexities scale like polar codes'.


