## Reproducing Section 6.1: Table 1, Comparing QPOR with SDPOR

Navigation: [Table of contents], [Previous section], [Next section]

[Table of contents]: 1-intro.md#index
[Previous section]: 2-compiling-tools.md
[Next section]: 4-section-6.2.md

DPU is a testing tool that explores the state space of the program by building a
so-called **Prime-Event Structure** (PES), also known as Unfolding of the program.
Each "test" corresponds to a different scheduling, or **interleaving** of the
threads in the program. When the interleaving is viewed as a partially-ordered
set of events we call it **configuration**.

A **maximal configuration** is a maximal execution, that is, one that runs the
program beginning to end.

A **Sleep-Set Blocked** (SSB) execution is BLA. FIXME.

### Benchmarks

All the input files for the benchmarks are stored in the `benchmarks` directory.


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
| Mpc(2,5)   | `benchmarks/multiprodcon.c`    | `PARAM1=2 PARAM2=2`
| Mpc(3,5)   | `benchmarks/multiprodcon.c`    | `PARAM1=3 PARAM2=3`
| Mpc(4,5)   | `benchmarks/multiprodcon.c`    | `PARAM1=4 PARAM2=4`
| Mpc(5,5)   | `benchmarks/multiprodcon.c`    | `PARAM1=5 PARAM2=5`
| Pi(5,2000) | `benchmarks/pi/pth_pi_mutex.c` | `PARAM1=5 PARAM2=2000`
| Pi(6,2000) | `benchmarks/pi/pth_pi_mutex.c` | `PARAM1=6 PARAM2=2000`
| Pi(7,2000) | `benchmarks/pi/pth_pi_mutex.c` | `PARAM1=7 PARAM2=2000`
| Pi(8,2000) | `benchmarks/pi/pth_pi_mutex.c` | `PARAM1=8 PARAM2=2000`
| Pol(7,3)  | `benchmarks/poke.c`            | `PARAM1=7 PARAM2=3`
| Pol(8,3)  | `benchmarks/poke.c`            | `PARAM1=8 PARAM2=3`
| Pol(9,3)  | `benchmarks/poke.c`            | `PARAM1=9 PARAM2=3`
| Pol(10,3)  | `benchmarks/poke.c`            | `PARAM1=10 PARAM2=3`
| Pol(11,3)  | `benchmarks/poke.c`            | `PARAM1=11 PARAM2=3`
| Pol(12,3)  | `benchmarks/poke.c`            | `PARAM1=12 PARAM2=3`


- say where are the benchmarks (sees how I did it for section 6.2).
- put a table similar to the one I have used in section 6.2, explaining how
  parameters are passed to `cpp` to instantiate the benchmark.
- FIXME: done, I need to check with the scripts

### The tools

- Precompiled binaries are made available to the reviewersr
- Say where are the binaries and display the command and console output if you
  run them with `--version`.

### Generating Table 1

In order to build Table 1 from the paper (shown below), just run from the top directory::

make sec6.1-table1

This will execute the script ``run-table1.sh``, which in turn will
generate a folder inside of the folder ``table1`` with multiple log files.

- FIXME: the explanation below needs to be extended (see how I did it for
  section 6.2) and corrected. The logs are now stored in a differnt folder and
  have different names.

In fie ``runtable1.sh``, we first generate a selection of benchmarks varied
by parameters using one of `generate_bench_*` functions. On the benchmarks,
we execute both `dpu` and `Nidhugg`, then dump he output data into log files
in `table1` folder:

- ``table1/logs/OUTPUT.rst``: the main log.
- ``table1/logs/TABLE.tex``: a LaTeX table generated out of the log.

As a sample, we include these two files as generated in the same machine where
we have run the experiments for the paper:

- `<table1/OUTPUT.rst>`__
- `<table1/TABLE.tex>`__

Although run times and memory consumption sizes are not identical to those
shown in the paper, observe that the variations are usually quite small.
For the record, the table as presented in the paper looked like this:

![table 1 in the paper](img/table1.png)

### Running the Tools by Hand

- Give the command line to invoke DPU or nidhugg by hand on a simple example.
- Explain briefly the output.

The binary tools are located in subfolders of the `dist` directory.

The documentation of the command-line interface of DPU is given by:
$ ./dist/dpu/bin/dpu --help
Usage: dpu FILE.{c,i,bc,ll} ANALYZEROPTS -- PROGRAMOPTS`
`

For instance :
`./dist/dpu/bin/dpu benchmarks/dispatcher.c`

The parameters are passed as pre-compiler options, e.g. `-DPARAM1=5`.

An interesting parameter here is the k parameter (`-k N`): it provides how close to optimal POR the tool will be. If N=0, DPU will run optimal DPO, otherwise if will use N-partial alternatives. 

In a similar way, the documentation of the command-line interface of Nidhugg is given by:
`$ ./dist/nidhugg/bin/nidhuggc --help
Usage: ./dist/nidhugg/bin/nidhuggc [[COMPILER/NIDHUGGC OPTIONS --] NIDHUGG/NIDHUGGC OPTIONS] FILE [-- [PROGRAM ARGUMENTS]]`

In particular, Nidhugg needs to be provided a memory model. For instance, it can run with: 
`$ ./dist/nidhugg/bin/nidhuggc --c -sc benchmarks/dispatcher.c`

### Compiling the Tools by Hand

- Send the reader to the previous section
