CAV'18 Experiments with DPU: Replicability Guide
================================================

## Introduction

- overall description of goals of the tool and this document
- indication that the latest version of this document is always located at
  https://github.com/cesaro/dpu-cav18-exp/blob/master/doc/1-intro.md, and that
  it's easier to read from there


## Index

| File                   | Contents
| ---------------------- | -----------------------------------------------------
| [1-intro.md]           | This file. Introduction and dependencies.
| [2-compiling-tools.md] | How to compile the tools
| [3-section-6.1.md]     | Reproducing Section 6.1: Table 1, Comparing QPOR with SDPOR
| [4-section-6.2.md]     | Reproducing Section 6.2: Fig 3, Tree Depths
| [5-section-6.3.md]     | Reproducing Section 6.3: Table 2, Debian Packages
| [6-section-6.4.md]     | Reproducing Section 6.4: Profiling DPU

[1-intro.md]:           1-intro.md
[2-compiling-tools.md]: 2-compiling-tools.md
[3-section-6.1.md]:     3-section-6.1.md
[4-section-6.2.md]:     4-section-6.2.md
[5-section-6.3.md]:     5-section-6.3.md
[6-section-6.4.md]:     6-section-6.4.md

## SHA1 Sums

- sha1sums

### Dependencies

This is for the image provided, Ubuntu 14

- for the artiact evaluation of cav18 this section is irrelevat, as all
  dependencies are satisfied in the virtual machine that we provide
- These experiments can be repeated with Ubuntu 16 or Debian 9.4
- make install-dependencies

This replicacbility package can also be used with minor modifications in Debian
9.4 or Ubuntu 16, with the exception of the experiments with Maple, which depend
on kernel 3.x.

apt-get install valgrind kcachegrind

