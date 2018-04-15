CAV'18 Experiments with DPU: Replicability Guide
================================================

## Introduction

- Overall description of goals of the DPU tool and this document: guiding the
  reviewer to replicate our experiments.

- Indication that the latest version of this document is always located at
  https://github.com/cesaro/dpu-cav18-exp/blob/master/doc/1-intro.md, and that
  it's easier to read from there. See the section below SHA1 sums to check how
  it is guaranteed that we won't be able to touch the Github repository without
  being noticed.

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

Each reviewer has received in Easychair a SHA1 sum describing the files
installed in their account. This sum is computed as a hash of the following:

* All files in the repository, including the `.git` folder.
* All commits avilable in the repository in Github,
  (https://github.com/cesaro/dpu-cav18-exp)

You can re-compute this sum like this. Do a `cd` to the root of the repository,
then:

```sh
$ make sha1sum

FIXME example output
```

If the output sum equals the sum provided in Easychair, this guarantees that:

* No file in your account has been modified since we gave you access to it.
* No content in https://github.com/cesaro/dpu-cav18-exp has been modified.

### Dependencies

Point to the reviewer that all dependencies are already installed in the machine
and that thei don't need to do anything here, this is just for information.

This is for the image provided, Ubuntu 14

- for the artiact evaluation of cav18 this section is irrelevat, as all
  dependencies are satisfied in the virtual machine that we provide
- These experiments can be repeated with Ubuntu 16 or Debian 9.4
- make install-dependencies

This replicacbility package can also be used with minor modifications in Debian
9.4 or Ubuntu 16, with the exception of the experiments with Maple, which depend
on kernel 3.x.

Point to the `make install-dependencies`

FIXMEEEEEEEEEEEEEEE

