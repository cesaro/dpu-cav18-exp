## How to Compile the Tools

Navigation: [Table of contents], [Previous section], [Next section]

[Table of contents]: 1-intro.md#index
[Previous section]: 1-intro.md
[Next section]: 3-section-6.1.md

FIXME Maple and pin

The sources of both DPU and Nidhugg are contained in the folder `tools/`:

```sh
$ find tools | grep zip
tools/dpu/dpu-0.5.2.zip
tools/nidhugg/nidhugg-375c554fdb208e2c50f35c618ed22cb2096ce4da.zip
```

The binary versions of both tools are contained in the folder `dist/`:

```sh
$ find dist/ -type f
dist/include/verifier.h
dist/lib/dpu/dpu-backend
dist/lib/dpu/rt.bc
dist/bin/nidhuggc
dist/bin/dpu
dist/bin/nidhugg
dist/share/doc/nidhugg/README
dist/share/doc/nidhugg/manual.pdf
```

If you want to compile these two tools, please use the `Makefile` in the root of
this repository:

```sh
make compile-nidhugg
make compile-dpu
```

After compiling the tools you may wish to install the binaries in the `dist/`
folder, overwritting the already provided binaries:

```sh
make install-nidhugg
make install-dpu
```
