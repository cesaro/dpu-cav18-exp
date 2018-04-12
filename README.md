Replicability Package: CAV'18 Experiments with DPU
==================================================

This folder contains all the necessary information to repeat the experiments of
our [CAV'18](http://cavconference.org/2018/) paper:

```
Quasi-Optimal Partial Order Reduction.
Huyen T.T. Nguyen, César Rodríguez, Marcelo Sousa, Camille Coti, and Laure Petrucci.
Proceedings of Computer Aided Verification.  To appear.
```

Specifically we include:

* The [sources](tools/) of all verification tools used in the paper.
* The [binary distribution](dist/) of those tools (x64)
* The [benchmarks](benchmarks/) used in the paper.
* Documentation providing [guided steps](doc/1-intro.md) to repeat the experiments.

If you want to repeat the experiments, please continue reading the
[guided steps](doc/1-intro.md).

<!--
Makefile
- build the tools
- compute a copy of the file SHA1SUMS and run a diff

doc/1-main.md
doc/2-compiling-tools.md
doc/3-section-6.1.md
doc/4-section-6.2.md
doc/5-section-6.3.md
doc/6-section-6.4.md
doc/img

dist/bin
dist/lib
dist/...

tools/dpu
tools/nidhugg
tools/maple

sec6.1-table1-dpu-vs-nidhugg
sec6.2-fig3-trees
sec6.3-table2-debian-packages
sec6.4-profiling

benchmarks/paper
benchmarks/debian
-->
