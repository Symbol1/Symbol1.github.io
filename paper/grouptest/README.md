
# Group Testing Papers

* [[TropicalGT22]]
  H.-P. Wang, R. Gabrys, A. Vardy.
  *Tropical Group Testing*.
  arXiv.
* [[PCR-TGT-22]]
  H.-P. Wang, R. Gabrys, A. Vardy.
  PCR, Tropical Arithmetic, and Group Testing.
  IEEE International Symposium on Information Theory (ISIT).
  (Conference version of [[TropicalGT22]])
* [Bonsai23]
  H.-P. Wang, R. Gabrys, V. Guruswami.
  *Quickly-Decodable Group Testing with Fewer Tests: Price--Scarlett's Nonadaptive Splitting with Explicit Scalars.*
  IEEE International Symposium on Information Theory (ISIT), June 2023.
* [TropicalGT23]
  H.-P. Wang, R. Gabrys, A. Vardy.
  *Tropical Group Testing*.
  IEEE Transactions on Information Theory.
  (journal version of [TropicalGT22])

Motivated by the Covid-19 pandemic, we study the possibility of using
group testing to help finding the carrier of SARS-CoV-2.  (A small
detail: Covid-19 is the name of the disease; SARS-CoV-2 is the name of
the virus.)  The idea is simple: Suppose there are 5 students that we
want to test.  We can test if each of their saliva specimens contains
the virus, which will costs us 5 testing kits.  We can also combine the
5 saliva specimens and test once, which will cost us 1 testing kit.
If the test result is negative, then we know none of the 5 students have
the virus.  However, if the test result is positive, then at least one
student has the virus.  We then 5 more testing kits to find which of
these 5 students have virus.  Over all, the average cost is $1/5 + p$
testing kits per student we want to test, where $p$ is the probability
that the mixture of 5 saliva specimens is positive.

Now, one interesting aspect about testing SARS-CoV-2 is that, in the
beginning of the pandemic, this virus is so new and the whole situation
is so emergency that the only reliable way is to test if a specimen
contains the DNA fragments that belong to SARS-CoV-2.  And the only
reliable way to do so to tell the polymerase to **amplify** (which is a
fancy way to say duplication) the targeted fragments until the specimen
contains nothing but the targeted fragments.  For instance, suppose
there are three type of DNA fragments, and denote the numbers of copies
by $x$, $y$, and $z$, respectively.  Suppose the second type is what
we want to test; we then tell the polymerase to amplify that so the
numbers of copies becomes $(x, 2y, z)$ after one cycle, $(x, 4y, z)$
after two cycles, and so on, until $2^c y$ is too large compared to $x$
and $z$ and it becomes very easy to detect.  This is how the **PCR
testing** works.

A byproduct of the PCR testing is that, if a specimen contains a lot of
virus particles, it would naturally contains a lot of DNA fragments and
so the polymerase will need very little cycles amplify that to a degree
that is detectable.  On the other hand, if we begin with very few DNA
fragments, it would take the polymerase a lot of cycles.  So by
monitoring the amount of DNA fragments, we get an idea of the number of
virus particles in a specimen.  The term **Ct value** (which stands for
cycle threshold value) is used to denote the number of cycles the
polymerase needs.  Let $c$ denote the Ct value and $v$ denote the
number of virus particles, then  
$ c \approx 40 - \lfloor\log_2(v)\rfloor $  
is a relation between $c$ and $v$ subject to errors.

So we want to combine group testing and Ct value.  But Ct value is very
nasty to work with.  Naturally, if we combine a specimen with $1$ virus
particle and another specimen with $1000$ virus particles, we get a
mixture with $1001$ virus particles.  But that's not how Ct value works,
as $1$, $1000$, and $1001$ virus particles correspond to Ct values $40$,
$30$, and $30$.  That is to say, a smaller Ct value tend to **mask** a
larger Ct value to the point that it completely erases the information.

Therefore, we proposed Tropical Group Testing [[TropicalGT22]], which is
a framework to study the how group testing and Ct values should
interplay.

To be elaborated...

[TropicalGT22]: https://arxiv.org/abs/2201.05440
[PCR-TGT-22]: https://doi.org/10.1109/ISIT50566.2022.9834718
