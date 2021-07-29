
# Polar Coding Papers

The following are my works on polar coding, from the oldest to the newest.

| Abbreviation | Title                                                                                       |
|:------------:|:-------------------------------------------------------------------------------------------:|
|[ModerDevia18]|Polar Code Moderate Deviation: Recovering the Scaling Exponent                               |
|[LargeDevia18]|Polar-like Codes and Asymptotic Tradeoff among Block Length, Code Rate, and Error Probability|
|[LoglogTime18]|Log-logarithmic Time Pruned Polar Coding on Binary Erasure Channels                          |
|[LoglogTime19]|Log-logarithmic Time Pruned Polar Coding                                                     |
|[Hypotenuse19]|Polar Codes' Simplicity, Random Codes' Durability                                            |
|[LoglogTime21]|Log-logarithmic Time Pruned Polar Coding (IEEE.TIT version of [LoglogTime19])                |
|[Hypotenuse21]|Polar Codes' Simplicity, Random Codes' Durability (IEEE.TIT version of [Hypotenuse19])       |
| [PhDThesis21]|Complexity and Second Moment of the Mathematical Theory of Communication                     |

All works are co-authored with Iwan Duursma (advisor of the time),
except that, technically speaking, he is not an author of my PhD dissertation.

[ModerDevia18] focuses on the moderate deviations regime (MDR) of polar coding.
MDR is also called the **moderate deviations principle** (MDP)
paradigm in some references.
It addresses the relation among block length ($N$),
error probability ($P_e$), and code rate ($R$) in the region
where $P_e$ is about $\exp( -N^\pi )$ and $R$ is about
$\text{Capacity} - N^{-\rho}$ for some positive numbers $\pi, \rho$.
The precise goal is to characterize the region of $(\pi, \rho)$ pairs
that are achievable for $N \to \infty$.

[ModerDevia18] was originally inspired by Mondelli--Hassani--Urbanke's work
[*Unified Scaling of Polar Codes: Error Exponent, Scaling Exponent, Moderate Deviations, and Error Floors*](https://doi.org/10.1109/TIT.2016.2616117).
This work confirmed the folklore conjecture that the scaling exponent of
polar coding is $1/\rho \approx 3.627$ over binary erasure channel and
$1/\rho \approx 4.714$ over binary-input discrete-output memoryless channel.
However, their region of $(\pi, \rho)$ does not touch the point $(0, 1/3.627)$,
which suggests that something nontrivial happens when $\pi > 0$.
My work addresses the mismatch and showed that,
using a more complicated combinatorial counting method,
the region of $(\pi, \rho)$ will touch $(0, 1/3.627)$.
Hence the slogan *moderate deviations recovers the scaling exponent*.

While [ModerDevia18] deals with classical polar codes
as constructed in Arıkan's original paper,
[LargeDevia18] extends the theory to a wide class of polar codes.
Given a kernel $G$, its scaling exponent $\mu$
(or its inverse $\rho = 1/\mu$), and its partial distances,
we are able to predict how codes constructed with $G$ will behave,
up to some big-$O$ notations.
Remark:
Whereas the result says that it is easy to go from $\rho$ to MDP.
But $\rho$ is usually difficult to estimate.
Alternatively, there are easy ways to bound $\rho$ from below
($\mu$ from above), in which case our MDP prediction becomes a one-way bound.

[LoglogTime18] stands on the result of [ModerDevia18] and shows that,
if we would like to tolerate higher $P_e$ and lower $R$,
we can reduce the encoding and decoding complexities
from $\log N$ per information bit to $\log(\log N)$ per information bit.
By *higher $P_e$* we mean that $P_e$ scales as $N^{-1/5}$;
By *lower $R$* we that mean that $R$ scales as $\text{Capacity}-N^{-1/5}$.
Thus the constructed code barely, but still, achieves capacity.

While [LoglogTime18] deals with the binary erasure channels,
[LoglogTime19] handles arbitrary symmetric $p$-ary channels,
where $p$ is any prime.
The main theorem is in the same vein---by tolerating that
$P_e$ converges to $0$ slower and that $R$ converges to the capacity slower,
we can reduce the complexity to $\log(\log N)$ per information bit.

Note that, in both [LoglogTime18] and [LoglogTime19],
codes are construct with the standard kernel $[^1_1{}^0_1]$;
yet the same idea applies if a general kernel $G$ is used.
Note also that the log-log behavior generalizes to
arbitrary discrete memoryless channels.
For general channels, however,
the standard kernel $[^1_1{}^0_1]$ does not polarize anymore.
So the observation that a general kernel $G$
is compatible with the log-log trick is crucial here

Now comes to my favorite work.

[Hypotenuse19] shows that it is possible to construct codes
whose error probabilities and code rates scale like random codes'
and encoding and decoding complexities scale like polar codes'.
On one hand, random codes' error and rate are considered the optimal.
On the other, polar codes' complexity ($\log N$) is considered low.
(Not the lowest possible complexity, as there exist $\log(\log N)$
constructions for general channels and $O(1)$ constructions for BEC.)
This result holds for all discrete memoryless channels,
the family of channels Shannon considered in 1948.

[PhDThesis21] is my PhD dissertation.
I summarize my earlier works and extend them a little bit.

* I show that any ergodic matrix has a positive $\rho$.
* I show that you can combine [LoglogTime21] with [Hypotenuse21]
  to obtain a code with $\rho \approx 1/2$ and log-log complexity
* I claim, and show with examples, that the same scaling behavior
  applies to distributed lossless compression and multiple access channels.

For a figurative comparison of the region of $(\pi, \rho)$, see
[Figure 1 on page 3](https://arxiv.org/pdf/1912.08995v1.pdf#page=3)
of Hypotenuse19 or
[Figure 5.4 on page 57](https://arxiv.org/pdf/2107.06420.pdf#page=63)
of PhDThesis21.
![The pi--rho plot of several milestone works](hypotenuse.png)

See also the following table for channels, goals, and references.
It is [Table 6.1 on page 98](https://arxiv.org/pdf/2107.06420.pdf#page=104)
of PhDThesis21.
![The channels, goals, and the works that achieve them](channelgoal.png)

Here is a table for the error--gap--complexity trade-offs of some well-known
capacity-achieving codes and the corresponding channels, obtained from
[Table 7.1 on page 103](https://arxiv.org/pdf/2107.06420.pdf#page=109)
of PhDThesis21.
![Error--gap--complexity trade-offs of some capacity-achieving codes](complexityPR.png)

The following table, from
[Table 5.1 on page 55](https://arxiv.org/pdf/2107.06420.pdf#page=61)
of PhDThesis21, describes an analog among
probability theory, random coding theory, and polar coding theory.
![Trinitarian analog among probability, random coding, polar coding](trinityanalog.png)


[ModerDevia18]: https://arxiv.org/abs/1806.02405
[LoglogTime18]: https://arxiv.org/abs/1812.08106
[LargeDevia18]: https://arxiv.org/abs/1812.08112
[LoglogTime19]: https://arxiv.org/abs/1905.13340
[Hypotenuse19]: https://arxiv.org/abs/1912.08995
[LoglogTime21]: https://doi.org/10.1109/TIT.2020.3041523
[Hypotenuse21]: https://doi.org/10.1109/TIT.2020.3041570
[PhDthesis21]: https://arxiv.org/abs/2107.06420
