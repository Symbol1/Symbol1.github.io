
# Polar Comments

From the oldest to the newest.

|  Abbreviation  |  Title  |
| :------------: | :-----: |
| [ModerDevia18] | Polar Code Moderate Deviation: Recovering the Scaling Exponent |
| [LargeDevia18] | Polar-like Codes and Asymptotic Tradeoff among Block Length, Code Rate, and Error Probability |
| [LoglogTime18] | Log-logarithmic Time Pruned Polar Coding on Binary Erasure Channels |
| [LoglogTime19] | Log-logarithmic Time Pruned Polar Coding |
| [Hypotenuse19] | Polar Codes' Simplicity, Random Codes' Durability |

[ModerDevia18] focuses on the moderate deviations regime (MDR) of polar coding.
MDR is also called the moderate deviations principle (MDP)
paradigm in some references.
It discusses the relation among block length ($N$),
error probability ($P$), and code rate ($R$) in the region
where $P$ is about $\exp( -N^\pi )$ and $R$ is about
$\text{Capacity} - N^{-\rho}$ for some positive numbers $\pi, \rho$.
The precise goal is to characterize the region of $(\pi, \rho)$ pairs
that are achievable for $N \to \infty$.

While [ModerDevia18] deals with the classical polar codes
constructed in Arıkan's original paper,
[LargeDevia18] extends the theory to a wide class of polar codes.
We are able to predict, up to some big-$O$ notations,
how codes constructed with a certain kernel $G$ will behave
given the scaling exponent $\mu$ (or its inverse $\rho = 1/\mu$)
and the partial distances.
It does not mean that such prediction is easy to make
because finding the precise $\rho$ (or $\mu$) is difficult.
That said, bounding $\rho$ is easy, so is bounding the MDP behavior.

[LoglogTime18] stands on the result of [ModerDevia18] and shows that,
if we would like to tolerate higher $P$ and lower $R$,
we can reduce the complexity of the encoding and decoding
from $\log N$ to $\log(\log N)$, per information bit.
By *higher $P$* we mean $P$ scales as $N^{-1/5}$;
By *lower $R$* we mean $R$ scales as $\text{Capacity}-N^{-1/5}$.
Thus the constructed codes still achieve capacity.

While [LoglogTime18] deals with the binary erasure channels,
[LoglogTime19] handles arbitrary symmetric $p$-ary channels,
where $p$ is any prime.
The latter result is similar:
by tolerating that $P$ converge to $0$ slower
and that $R$ that converge to the capacity slower,
we can reduce the complexity to $\log(\log N)$ per information bit.
In both [LoglogTime18] and [LoglogTime19],
codes are construct with the standard kernel $[^1_1{}^0_1]$.

We later found (not included in either paper) that
the conclusion generalizes to arbitrary discrete memoryless channels.

[Hypotenuse19] shows that it is possible to construct codes
whose error probabilities and code rates scale like random codes'
and encoding and decoding complexities scale like polar codes'.
On one hand, random codes' error and rate are considered the optimal.
On the other, polar codes' complexity ($\log N$) is considered low.
(Not the lowest possible complexity, as there exist $\log(\log N)$
constructions for general channels and $O(1)$ constructions for BEC.)
This result holds for all discrete memoryless channels,
the family of channels Shannon considered in 1948.
This result extends a series of works done by (alphabetically) Arıkan,
Błasiok, Fazeli, Guruswami, Hassani, Honda, Korada, Mori, Şaşoğlu, Sutter, etc.

For a quick comparison, see
[Figure 1 on page 3](https://arxiv.org/pdf/1912.08995v1.pdf#page=3)
in Hypotenuse19.
![hypotenuse](/figure/hypotenuse.png)

See also
[Table 2 on page 40](https://arxiv.org/pdf/1912.08995v1.pdf#page=40).
![channelgoal](/figure/channelgoal.png)

[Hypotenuse19]: https://arxiv.org/abs/1912.08995
[LoglogTime19]: https://arxiv.org/abs/1905.13340
[LargeDevia18]: https://arxiv.org/abs/1812.08112
[LoglogTime18]: https://arxiv.org/abs/1812.08106
[ModerDevia18]: https://arxiv.org/abs/1806.02405
