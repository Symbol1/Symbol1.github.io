
# Distributed Comments

From the oldest to the newest.

|  Abbreviation  |  Title                            |
| :------------: | :-------------------------------: |
| [PlutoCharon20]| Parity-Checked Strassen Algorithm |

[PlutoCharon20] concerns distributed computation.
To be precise, it deals with distributed matrix-matrix multiplication (MMM)
where the workers might crash or straggle.
By MMM we mean that we want to compute $C=AB$, where $A, B$ are huge matrices.
By crashing and straggling we mean that an entry multiplication,
for instance $A_{12}\times A_{23}$, might be available very late, if at all.

To compensate, one needs to hire more-than-necessary workers
and asks them to do redundant computations.
A possibility to generate redundancy is to draw random vectors $g, h$
and then ask extra workers to compute $(gA)\times(Bh)$ on top of $A\times B$.

The contribution of [PlutoCharon20] is three-fold.
One: We obverse that the computation of $A\times B$
can be carried-out by fast matrix multiplication (FMM).
This construction is named **Pluto codes**.
Two: Applying Pluto codes recursively,
we obtain a code that behaves like tensor product codes.
Three: The computation of $(gA)\times(Bh)$,
if $g, h$ are matrices, can be carried-out by FMM.
This is named **Charon construction**.

[PlutoCharon20]: https://arxiv.org/abs/2011.15082
