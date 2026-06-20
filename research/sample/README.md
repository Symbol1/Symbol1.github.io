# Exact Distribution Shaping

- [[MichelangeRoll25]]
  J-H Shao, H-P Wang.
  MichelangeRoll: Sculpting Rational Distributions Exactly and Efficiently.
  *arXiv*.
  July 2025.

How to generate a Uniform(3) distribution if we have access to a Uniform(2) source (i.e., a coin)?
The most straightforward strategy is a rejection sampling:

* Flip the coin twice; this is equivalent to
generating a Uniform(4) random variable $X \in \{0, 1, 2, 3\}$.
* If $X \in \{0, 1, 2\}$, output $X$.
* If $X = 3$, discard it and start over.

This suggests that each attempt to generate a Uniform(3) distribution costs 2 bits.
And the probability of success is $3/4$, so the expected cost is $2 / (3/4) = 2.67$ bits.
Can we do better?
Yes; notice that $3^5 = 243 < 256 = 2^8$.

* Flip the coin 8 times; this is equivalent to
  generating a Uniform(256) random variable $Y \in \{0, 1, ..., 255\}$.
* If $Y < 243$, output the 5-digit 3-ary representation of $Y$.
* If $Y \geq 243$, discard it and start over.

This strategy costs 8 bits per attempt, and the probability of success is $243/256$,
so the expected cost is $(8/6) / (243/256) = 1.69$ bits.
Following this idea, we can see that the exchange rate is $\ln(3) / \ln(2)$ bits per symbol,
and this quantity can be achieved by 


[MichelangeRoll25]: https://arxiv.org/abs/2507.00915
