
# Distributed Computation Paper

I have one work on distributed computation of matrix multiplication.

|  Abbreviation   |  Title                            |
| :-------------: | :-------------------------------: |
| [PlutoCharon20] | Parity-Checked Strassen Algorithm |

Coauthor = Iwan Duursma.

[PlutoCharon20] deals with distributed matrix-matrix multiplication (DMM)
where the workers might straggle or crash.
By MM we mean that you want to compute $C = A \times B$,
where $A, B$ are huge matrices with compatible dimensions.
(One should distinguish this from matrix-vector multiplication,
 as the latter does not have a *fast* version.)
By distributed we mean that there will be several workers,
each computes a single entry multiplication $A_{ij} \times B_{jk}$.
By straggling and crashing we mean that some workers
might not respond timely, or they might just hang there indefinitely.

Straggling and crashing is a real issue in real world because, spontaneously,
the network may be busy, the CPU may be overheat, or the circuit board
may be hit by cosmic radiation and cannot recover from it.
This makes the overall computation slow because you have to wait for
the last worker to tell you the product $A_{ij}B_{jk}$ it is responsible for.

To compensate, you can hire more-than-necessary workers
and ask them to do redundant computations.
A possible way to create redundancy is to draw random vectors $g, h$
and then ask extra workers to compute $(gA) \times (Bh)$
on top of the usual routine that computes $A \times B$.
Once this is done, the associativity equation $(gA)(Bh) = gCh$ will give you
some parity checks that help recover the missing entries of $C$.
The overhead of using parity checks to recover missing entries of $C$
is usually faster than waiting for the straggling workers to recover.
So you can actually save time by paying for more CPU times.

The contribution of [PlutoCharon20] is three-fold.

* One: We obverse that the routine computation of $A\times B$
  can be carried-out by fast matrix multiplication (FMM).
  This construction is named **Pluto codes** because
  the smallest working example uses nine workers and can afford breaking one,
  reminding us that Pluto used to be the ninth planet.
* Two: Applying Pluto codes recursively,
  we obtain codes that behave like tensor product codes.
  Tensor produce codes have fast iterative decoders that is
  parallelism-friendly and fits the current context (distributed computation).
* Three: We observe that the computation of $(gA) \times (Bh)$,
  when $g$ and $h$ are matrices, can be carried-out by FMM as well.
  This is named **Charon construction** after the moon of Pluto.
  (Charon is the largest moon when it comes to the relative size.)

The smallest working example of the Charon construction is $g, A, B, h$
being $2 \times 4$, $4 \times 4$, $4 \times 4$, $4 \times 2$.
The computation of $A \times B$ costs 49 workers,
the computation of $(gA) \times (Bh)$ costs 14 workers.
Together you need 63 workers, one less than the naive algorithm uses (64).
So you are using less works, yet you can
recover from four erasures with high probability.

[PlutoCharon20]: https://arxiv.org/abs/2011.15082
