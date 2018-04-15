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

- say where are the benchmarks (sees how I did it for section 6.2).
- put a table similar to the one I have used in section 6.2, explaining how
  parameters are passed to `cpp` to instantiate the benchmark.

### The tools

- Precompiled binaries are made available to the reviewersr
- Say where are the binaries and display the command and console output if you
  run them with `--version`.

### Generating Table 1

In order to build Table 1 from the paper (shown below), just run::

make sec6.1-table1

This will execute the script ``runtable1.sh``, which in turn will
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

### Compiling the Tools by Hand

- Send the reader to the previous section
