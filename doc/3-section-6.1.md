## Reproducing Section 6.1: Table 1, Comparing QPOR with SDPOR

Navigation: [Table of contents], [Previous section], [Next section]

[Table of contents]: 1-intro.md#index
[Previous section]: 2-compiling-tools.md
[Next section]: 4-section-6.2.md

This section provides instructions to replicate the experimental results shown
in Table 1 of the paper.

### Benchmarks

Below we have the list of all benchmark instances used in Table 1.  All the
input files for the benchmarks are stored in the `benchmarks/` directory.

| Instance   | Benchmark                      | Parameters
| -----------|--------------------------------| ------------------------
| Disp(5,2)  | `benchmarks/dispatcher.c`      | `PARAM1=5 PARAM2=2`
| Disp(5,3)  | `benchmarks/dispatcher.c`      | `PARAM1=5 PARAM2=3`
| Disp(5,4)  | `benchmarks/dispatcher.c`      | `PARAM1=5 PARAM2=4`
| Disp(5,5)  | `benchmarks/dispatcher.c`      | `PARAM1=5 PARAM2=5`
| Disp(5,6)  | `benchmarks/dispatcher.c`      | `PARAM1=5 PARAM2=6`
| Mpat(4)    | `benchmarks/mpat.c`            | `PARAM1=4`
| Mpat(5)    | `benchmarks/mpat.c`            | `PARAM1=5`
| Mpat(6)    | `benchmarks/mpat.c`            | `PARAM1=6`
| Mpat(7)    | `benchmarks/mpat.c`            | `PARAM1=7`
| Mpat(8)    | `benchmarks/mpat.c`            | `PARAM1=8`
| Mpc(2,5)   | `benchmarks/multiprodcon.c`    | `PARAM1=2 PARAM2=5`
| Mpc(3,5)   | `benchmarks/multiprodcon.c`    | `PARAM1=3 PARAM2=5`
| Mpc(4,5)   | `benchmarks/multiprodcon.c`    | `PARAM1=4 PARAM2=5`
| Mpc(5,5)   | `benchmarks/multiprodcon.c`    | `PARAM1=5 PARAM2=5`
| Pi(5,5000) | `benchmarks/pi/pth_pi_mutex.c` | `PARAM1=5 PARAM2=5000`
| Pi(6,5000) | `benchmarks/pi/pth_pi_mutex.c` | `PARAM1=6 PARAM2=5000`
| Pi(7,5000) | `benchmarks/pi/pth_pi_mutex.c` | `PARAM1=7 PARAM2=5000`
| Pi(8,5000) | `benchmarks/pi/pth_pi_mutex.c` | `PARAM1=8 PARAM2=5000`
| Pol(7,3)  | `benchmarks/poke.c`            | `PARAM1=7 PARAM2=3`
| Pol(8,3)  | `benchmarks/poke.c`            | `PARAM1=8 PARAM2=3`
| Pol(9,3)  | `benchmarks/poke.c`            | `PARAM1=9 PARAM2=3`
| Pol(10,3)  | `benchmarks/poke.c`            | `PARAM1=10 PARAM2=3`
| Pol(11,3)  | `benchmarks/poke.c`            | `PARAM1=11 PARAM2=3`
| Pol(12,3)  | `benchmarks/poke.c`            | `PARAM1=12 PARAM2=3`

### The Tools

The binaries for both DPU and Nidhugg are present in the `dist/` folder, as we
already explained. These are the binaries that our script uses for generating
the data in Table 1.

```sh
$ ./dist/dpu/bin/dpu --version
dpu v0.5.2 (c5df6e5, dirty), compiled Sat, 14 Apr 2018 21:20:08 +0000
Build type: release
Features: -detailed-stats 
[...]

$ ./dist/nidhugg/bin/nidhuggc  --version
Nidhugg 0.2 (7166349, Release, with LLVM-4.0.1:RelWithDebInfo)
```

### Generating Table 1

In order to build Table 1 from the paper (shown below), just run from the top directory::

```sh
make sec6.1-table1
```

This will take around 4h 15min to finish in the VM provided. We explain below
how to modify one line in the script to run only the smallest benchmarks.

The `make` command above executes the script `script/run-table1.sh`, which in
turn generates the folder `sec6.1-table1/logs.XXXXX` (where XXXXX is the
date/time at which you call the script). The script puts all its outputs and
intermediate files in this folder.  We provide an en example of this folder in
`sec6.1-table1/logs.provided/`, also [available here](../sec6.1-table1/logs.provided/).

The outputs in this folder include:

* File `LOG.rst`: this is the execution log of the script.
  Example output [here](../sec6.1-table1/logs.provided/LOG.rst).
* File `TABLE.tex`: the LaTeX source of Table 1, automatically generated from the output logs.
  Example output [here](../sec6.1-table1/logs.provided/TABLE.tex).

The folder also contains a number of intermediate files.  For each instantiation
of the parameters of a parametric benchmark, the folder contains the
preprocessed source of the benchmark  (an `.i` file) and multiple `.txt` files
corresponding to the execution logs of DPU and Nidhugg. For instance for the
benchmark `dispatcher.c` instantiated with

```
PARAM1=5
PARAM2=2
```

we get the following files:

* `dispatch-serv5_reqs2.i`: preprocessed source of the benchmark.
* `dispatch-serv5_reqs2_dpu_alt0.txt`: exec. log of DPU with optimal exploration.
* `dispatch-serv5_reqs2_dpu_alt1.txt`: exec. log of DPU with 1-partial alternatives.
* `dispatch-serv5_reqs2_dpu_alt2.txt`: exec. log of DPU with 2-partial alternatives.
* `dispatch-serv5_reqs2_dpu_alt3.txt`: exec. log of DPU with 3-partial alternatives.
* `dispatch-serv5_reqs2_nidhugg.txt`: exec. log of Nidhugg.


### Interpreting the Data

The meaning of the columns in Table 1 can be confusing. We give a bit of context
to help interpreting the data in this table.

DPU is a testing tool that explores the state space of the program under
analysis by building a so-called **Prime-Event Structure** (PES), also known as
**Unfolding**.

Each "test" corresponds to a different scheduling, or **interleaving** of the
threads in the program. When the interleaving is viewed as a partially-ordered
set of events we call it **configuration**.  A **maximal configuration** is a
maximal execution, that is, one that runs the program beginning to end.

DPU implements an algorithm for Dynamic Partial-Order Reduction (**DPOR**).  A
**Sleep-Set Blocked** (SSB) execution is an execution that, in the context of
this algorithm, is regarded as redundant.


### How the Script Works

The script `scripts/run-table1.sh` works in 4 phases.

1. After printing a number of debugging informations (memory of the machine,
   versions of the tools), it **preprocesses** (using `cpp`)
   the benchmarks to obtain an `.i` file for each row of Table 1 (function
   `generate_bench_selection`).

2. **Run DPU** (function `runall_dpu`) on the benchmarks, generating log `.txt`
   files containing the output of DPU.

3. **Run NIDHUGG** (function `runall_nidhugg`) on the benchmarks and generate a
   log file, e.g `dispatcher-serv5_reqs2_nidhugg.txt` in the example above.

4. **Generate LaTeX** in `TABLE.tex` (function `dump_latex`).

Although run times and memory consumption sizes are not identical to those
shown in the paper, observe that the variations are usually quite small.
For the record, the table as presented in the paper looked like this:

![Table 1 in the paper.](img/table1.png)

### Running Only the Smallest Benchmarks

If you want to modify the script to run the tools only on the fastest
benchmarks, all you have to do is change the lines 416 and 417 of
`scripts/run-table1.sh` from this:

```sh
   generate_bench_selection 2>&1 | quote
   #generate_bench_smallest 2>&1 | quote
```

into this:

```sh
   #generate_bench_selection 2>&1 | quote
   generate_bench_smallest 2>&1 | quote
```

### Running the Tools by Hand

Here are a couple of examples how to run DPU and Nidhugg on some benchmarks of
Table 1:

```sh
$ dist/dpu/bin/dpu benchmarks/dispatcher.c -DPARAM1=5 -DPARAM2=2 --mem 128M --stack 6M -O1 -k1
```

This will run DPU on the benchmark `Disp(5,2)` in the table, with the following
parameters:

* `-DPARAMX=Y`: these are macros that DPU will use to preprocess the `.c` file.
* `--mem 128M`: the benchmark will be executed in a restricted environment of
  128M of RAM memory.
* `--stack 6M`: the stack size of the threads created by the benchmark will have,
  by default, 6M.
* `-O1`: DPU will compile the benchmark with `clang -O1` before executing it
* `-k1`: use 1-partial alternatives (described in the paper)

The documentation of the command-line interface of DPU is given by:
```sh
./dist/dpu/bin/dpu --help
Usage: dpu FILE.{c,i,bc,ll} ANALYZEROPTS -- PROGRAMOPTS
[...]
```

Another example:

```sh
$ cpp benchmarks/dispatcher.c -DPARAM1=5 -DPARAM2=2 -o /tmp/disp_5_2.i
$ dist/nidhugg/bin/nidhuggc --c -sc -extfun-no-race=printf /tmp/disp_5_2.i
```

The first command runs the pre-processor on the benchmark. The second one runs
Nidhugg.

### Compiling the Tools by Hand

Documentation on how to compile the tools is given in the
[previous section](2-compiling-tools.md)
