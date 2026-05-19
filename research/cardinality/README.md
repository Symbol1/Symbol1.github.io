# Pessimistic Cardinality Estimation

- [[Ambidexter25]]
  Y-T Lin, H-P Wang.
  Ambidextrous Degree Sequence Bounds for Pessimistic Cardinality Estimation.
  *arXiv*.
  October 2025.

- [[SidorenQL26]]
  Y-T Lin, H-P Wang.
  Sidorenko-Inspired Pessimistic Estimation.
  *IEEE International Symposium on Information Theory (ISIT)*.
  June 2026, Guangzhou, China.

A database system usually consists of several tables.
For instance, the following is the table of transactions.

| Seller | Good   | Buyer   |
|:------:|:------:|:-------:|
| Alice  | Apple  | Adam    |
| Bob    | Banana | Betty   |
| Cindy  | Cherry | Charlie |

A table usually doesn't contain all information.
For instance, the table above does not contain credit card information and shipping address.
This is because a buyer may buy multiple things at once,
so we avoid repetition by storing those information in a different table.

| Buyer   | Credit Card | Address          |
|:-------:|:-----------:|:----------------:|
| Adam    | 3141-5926   | 53 Amsterdam Rd  |
| Betty   | 2718-2818   | 28 Barcelona Rd  |
| Charlie | 1618-0339   | 62 Copenhagen Rd |

Of course, there will be a table for the information of sellers as well.

| Seller | Bank Account | Rating   |
|:------:|:------------:|:--------:|
| Alice  | 1414-2135    | 6.2 (37) |
| Bob    | 1732-0508    | 0.7 (56) |
| Cindy  | 2236-0679    | 6.7 (49) |

And then there will be a table for the information of goods.

| Good   | Price | Warehouse |
|:------:|:-----:|:---------:|
| Apple  | 44.16 | Aberdeen  |
| Banana | 55.25 | Boston    |
| Cherry | 66.26 | Chicago   |

At the end of the day, we want to post-process the data.
For example, we want to move money from the buyers' credit cards to the sellers' bank accounts,
so we need a report containing all money-related information from across the tables.

| Seller | To Account | Good   | Price | Buyer   | From Card |
|:------:|:----------:|:------:|:-----:|:-------:|:---------:|
| Alice  | 1414-2135  | Apple  | 44.16 | Adam    | 3141-5926 |
| Bob    | 1732-0508  | Banana | 55.25 | Betty   | 2718-2818 |
| Cindy  | 2236-0679  | Cherry | 66.26 | Charlie | 1618-0339 |

This is called a **join** operation in database systems:
For any seller, say Alice, we pull information from the seller table,
and insert it into the transaction table, which gives us the first two columns of the report.
We then pull and insert information from the good table, giving us the next two columns,
and then pull and insert information from the buyer table, giving us the last two columns.

Mathematically speaking, a table is denoted as $R(A, B)$,
where $A$ is the set of possible values of the first column,
$B$ is the set of possible values of the second column, and
$R$ is the set of rows, understood as a subset of $A \times B$.
Then the join of $R(A, B)$ and $S(B, C)$ is a table $V(A, B, C)$ such that
$$ V = \{(a, b, c) : R(a, b) \land S(b, c)\}, $$
where $R(a, b)$ means $(a, b) \in R$, because we also treat $R$ as a predicate.
A more complicated example is a cyclic one
$$\Delta = \{(a, b, c) : R(a, b) \land S(b, c) \land T(c, a)\} $$
suppose that $T(B, C)$ is another table.

The problem with table joining is that the size of the output tables $V$ and $\Delta$,
unlike the transaction example above, can be much larger than the input tables $R$, $S$, and $T$.
For instance, let $A = B = C = \{1, ..., 30\}$;
let $R(a, b)$ be whether $a - b$ is even,
$S(b, c)$ be whether $b - c$ is a multiple of $3$,
and $T(c, a)$ be whether $c - a$ is a multiple of $5$.
Then $|R| = 450$, $|S| = 300$, and $|T| = 180$, but $|V| = 4500$ and $|\Delta| = 900$.
This problem does not show up in *all* tables,
so it makes sense to ask if we can tell, before actually performing the join,
whether the output table is of linear size or exponential size.
This is the problem of **pessimistic cardinality estimation**,
where *pessimistic* means that we want to upper bound the size of the output table.

On the first glance, an optimistic bound, a lower bound,
seems to be on the equal footing with a pessimistic bound, but this is not the case.
For instance, we can bound $|V|$ and $|\Delta|$ as $|R| \times \deg_S(B)$,
where $\deg_S(B)$ is the maximum of $\deg_S(b)$ and the latter is
$|\{c : S(b, c)\}|$, the number of $c$'s connected to $b$.
This bound corresponds to the following algorithm.

```python
SS = {b : [] for b in B}
for (b, c) in S: SS[b].append(c)

V = []
Delta = []
for (a, b) in R:
    for c in SS[b]:
        V.append((a, b, c))
        if (c, a) in T: # let's pretend that T is a set
            Delta.append((a, b, c))
```
In other words, `SS` can look up the $c$'s by $b$ and hence
we have $\deg_S(b) =$ `len(SS[b])` and $\deg_S(B) =$ `max(len(SS[b]) for b in B)`.
So the nested for loop will cost $|R| \times \deg_S(B)$ time.

By symmetry, we can also bound $|\Delta|$ as $|S| \times \deg_T(C)$,
which is the teim the following algorithm needs/

```python
TT = {c : [] for c in C}
for (c, a) in T: TT[c].append(a)

Delta = []
for (b, c) in S:
    for a in TT[c]:
        if (a, b) in R: # let's pretend that R is a set
            Delta.append((a, b, c))
```

Mathematically, both algorithms are correct and they will give the same `Delta`.
But the run time varies depending on the values of $|R|$, $|S|$, $\deg_S(B)$, and $\deg_T(C)$.
In fact, if we continue with the divisibility example,
we notice that $|R| \times \deg_S(B) = 450 \times 10 = 4500$ and
$|S| \times \deg_T(C) = 300 \times 6 = 1800$.
So the second algorithm gives a better pessimistic bound,
even though both algorithms compute the same output table.

The punchline here is that $T$ is a much sparser relation,
and in the first algorithm we check $(c, a)$ against $T$,
so the pass rate is low and we are wasting time enumerating triples
that are not going to pass the test.
On the other hand, $R$ is a denser relation
and checking $(a, b)$ against $R$ is more likely to pass,
meaning that we generate the same $\Delta$ with fewer failures.

The example is all clear and intuitive.
But for real world data it is not always this easy to tell.
It is therefore crucial to find

* a good method to upper bound the table size, and
* a bound-matching algorithm to compute the output table.

[SidorenQL26]: https://arxiv.org/abs/2604.14647
[Ambidexter25]: https://arxiv.org/abs/2510.04249
