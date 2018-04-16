CAV'18 Experiments with DPU: Replicability Guide
================================================

## Introduction

This tutorial provides guided steps to replicate the experimental results of our
CAV'18 paper.  The tutorial contains images and links, and it is easier to read
online, please point your browser to:

https://github.com/cesaro/dpu-cav18-exp/blob/master/doc/1-intro.md

The online version is identical to the one installed in the virtual machine that
we provide, as the SHA1 sum that we provided in Easychair also covers the Gihub
repository hosting the link above (more on this below).

## Index

This tutorial consist of 6 sections:

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

Each reviewer has received in Easychair a SHA1 signature of the files
installed in their account. This sum is computed as a hash of the following:

* All files in the repository.
* All content avilable in the repository in Github
  (https://github.com/cesaro/dpu-cav18-exp)

You can re-compute this hash like this. In your console, `cd` to the root of the
repository, then:

```sh
$ make sha1sums 
./scripts/compute-sha1.sh
Doing a 'git pull'...
Already up-to-date.
Computing the SHA1 sum... This can take a while.

SHA1 sum: e22e2bbef819105aa4b9e074375b9e00348de0b6
```

If the output sum equals the sum provided in Easychair, this guarantees that:

* No file in your account has been modified since we gave you access to it.
* No content in https://github.com/cesaro/dpu-cav18-exp has been modified.

The guarantee that the Github repository has not been changed stems from the
fact that `make sha1sum` first makes a `git pull` of the Github repository (thus
updating your local copy if the Github repository has been updated) and then
computes the sum. So any change in the Github files will produce a different
SHA1 sum.

### Dependencies

All software packages necesary to run the tools used in this experimental
evaluation have been installed in the machine provided. This section is thus
somehow irrelevant to the reviewer.

We just add that these packages can be installed using the `Makefile` at the
root of the repository, typing:

```sh
make install-dependencies
```

The dependencies installed there are specific for Ubuntu 14.  This replicability
package can also be used with minor modifications in Debian 9.4 or Ubuntu 16,
with the exception of the experiments with Maple, which depend on kernel 3.x,
and more recent version of Debian or Ubuntu depend on kernels 4.x.

