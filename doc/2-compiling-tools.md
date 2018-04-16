## How to Compile the Tools

Navigation: [Table of contents], [Previous section], [Next section]

[Table of contents]: 1-intro.md#index
[Previous section]: 1-intro.md
[Next section]: 3-section-6.1.md

Precompiled binaries of the tools used in these experiments are included in the
folder `dist/`.

Reviewers **do not need to recompile the tools** (if they don't want to), the
steps below are here just for informative purposes.  If you want to recompile
DPU or Nidhugg, their sources are contained in the folder `tools/`:

```sh
$ find tools | grep zip$
tools/dpu/dpu-0.5.2.zip
tools/nidhugg/nidhugg-375c554fdb208e2c50f35c618ed22cb2096ce4da.zip
```

The binary versions of both tools are contained in the folder `dist/`:

```sh
$ find dist -type f
dist/dpu/include/verifier.h
dist/dpu/lib/dpu/dpu-backend
dist/dpu/lib/dpu/rt.bc
dist/dpu/bin/dpu
dist/dpu-tree-stats/include/verifier.h
dist/dpu-tree-stats/lib/dpu/dpu-backend
dist/dpu-tree-stats/lib/dpu/rt.bc
dist/dpu-tree-stats/bin/dpu
dist/nidhugg/bin/nidhuggc
dist/nidhugg/bin/nidhugg
dist/nidhugg/share/doc/nidhugg/README
dist/nidhugg/share/doc/nidhugg/manual.pdf
```

If you want to compile these two tools, please use the `Makefile` in the root of
this repository:

```sh
make compile-nidhugg
make compile-dpu
```

This will compile and install these two tools in the `dist/` folder (thus
overwriting the binaries we provided there).
