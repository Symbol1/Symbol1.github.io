
# Storage Comments

From the oldest to the newest.

|  Abbreviation  |  Title  |
| :------------: | :-----: |
| [MoulinAlge20] | Multilinear Algebra for Distributed Storage |
| Atrahasis20 | (To Be Announced) |

[MoulinAlge20] uses multilinear algebra to construct regenerating code.

A **regenerating code** consists of

* a file of size $M$ symbols and
* a system of $n$ storage devices, called **nodes**.

They satisfy the following conditions:

* Each node stores $\alpha$ symbols of the file.
* Any $k$ nodes contains sufficient information to recover the file.
* When a node fails, any $d$ other nodes
    will each sends it $\beta$ symbols to repair.

The code is named regenerating mainly due to
the last bullet point---the nodes regenerate themselves.

The theory of regenerating codes concerns
the relation among $n, k, d, \alpha, \beta, M$.
For example, since any $k$ nodes contain $k\alpha$ symbols
and can recover the file, the file size $M$ is at most $k\alpha$.
Similarly, since $d\beta$ symbols a failing node,
the node size $\alpha$ is at most $d\beta$.
(Exercise)
One can also show that $k-1$ nodes ($\alpha$)
plus $d-k+1$ help messages ($\beta$) is at least $M$.
There is a family of bounds of this type.
They restrict where can those parameters live.

The opposite approach is to construct regenerating codes
that aim to achieve low $\alpha$ and $\beta$ and high $M$.
[MoulinAlge20] does this.
We construct a series of regenerating codes (which we call **moulin codes**).
They achieve the best known $\alpha/M$-versus-$\beta/M$ trade-off to date.
It is conjectured that this trade-off is optimal.

[MoulinAlge20]: https://arxiv.org/abs/2006.08911
