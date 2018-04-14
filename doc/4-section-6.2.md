## Reproducing Section 6.2: Fig 3, Tree Depths

Navigation: [Table of contents], [Previous section], [Next section]

[Table of contents]: 1-intro.md#index
[Previous section]: 3-section-6.1.md
[Next section]: 5-section-6.3.md

DPU constructs and maintains the unfolding of the program using a
data structure based on trees. These allow the efficient implementation of all
operations of Algorithm 1 in the paper, including, mainly, queries to determine
if two events are related by a relation of **causality** or **conflict**.

For every POSIX mutex and every thread of the program under analysis, the data
structure maintains one tree. In Section 6.2 of the paper we evaluate these
trees and make the following claims:

1. The average node depth is 22.7.
2. 80% of the tree nodes have a maximum depth of less than 8 nodes.
3. 90% of the tree nodes have a maximum depth of less than 16 nodes.
4. 92% of the causality queries are for nodes separated by a distance of 1 to 4.
5. 70% of the causality queries are for nodes separated by a distance of 1 to 2.
6. 82% of the conflict queries are for nodes separated by a distance of 1 to 4.

Additionally, Figure 3 of the paper contains:

7. Plots of the average-node-depth and the maximal-tree-depth.
8. Two histograms showing the frequency (axe Y) at which queries are made to the
   trees for nodes with a given depth (axe X).

Here we provide the data that supports these claims/figures as well as
instructions how to generate the data.

### Benchmarks

We have used the following instances of the benchmarks used in Table 1 of the
paper. All files are available in the folder `benchmarks/`.

| Instance   | Benchmark                      | Parameters
| -----------|--------------------------------| ------------------------
| Disp(4,3)  | `benchmarks/dispatcher.c`      | `PARAM1=4 PARAM2=3`
| Disp(4,4)  | `benchmarks/dispatcher.c`      | `PARAM1=4 PARAM2=4`
| Disp(4,5)  | `benchmarks/dispatcher.c`      | `PARAM1=4 PARAM2=5`
| Mpat(4)    | `benchmarks/mpat.c`            | `PARAM1=4`
| Mpat(5)    | `benchmarks/mpat.c`            | `PARAM1=5`
| Mpat(6)    | `benchmarks/mpat.c`            | `PARAM1=6`
| Mpc(3,4)   | `benchmarks/multiprodcon.c`    | `PARAM1=3 PARAM2=4`
| Mpc(4,4)   | `benchmarks/multiprodcon.c`    | `PARAM1=4 PARAM2=4`
| Pi(6,2000) | `benchmarks/pi/pth_pi_mutex.c` | `PARAM1=6 PARAM2=2000`
| Pi(7,2000) | `benchmarks/pi/pth_pi_mutex.c` | `PARAM1=7 PARAM2=2000`
| Pi(8,2000) | `benchmarks/pi/pth_pi_mutex.c` | `PARAM1=8 PARAM2=2000`
| Pol(10,3)  | `benchmarks/poke.c`            | `PARAM1=10 PARAM2=3`
| Pol(11,3)  | `benchmarks/poke.c`            | `PARAM1=11 PARAM2=3`
| Pol(12,3)  | `benchmarks/poke.c`            | `PARAM1=12 PARAM2=3`
| Pol(13,3)  | `benchmarks/poke.c`            | `PARAM1=13 PARAM2=3`


### The Supporting Data

We executed DPU on the benchmarks above. We then parsed the output logs and
generated a spreadsheet which allowed us to make the six claims above and
construct the plots and histograms of Fig. 3.

The spreadsheet is located in `sec6.2-fig3-trees/tree-stats.xlsx`,
or [here](../sec6.2-fig3-trees/tree-stats.xlsx).

The spreadsheet contains four tabs. We now explain how the data in these tabs
proves our claims. In the sections **below we show** how to generate this data.

**Tab 1: Tree-depth raw data (claims 1, 2, 3)**:
For each of the benchmarks above we ran DPU and generate a log file (1st column).
DPU built an unfolding with multiple trees. Each tree in that unfolding
corresponded to a mutex or a thread (2nd column). For that tree the table
reports the number of nodes (3th column), the depth of the tree (4th column) and
the average depth of the nodes in the tree (5th column).  From these columns we
compute the data that supports our *claims 1, 2, and 3*, marked in red in the
spreadsheet:

FIXME pic

**Tab 2: Tree-depth plots (plots in Fig. 3a and 3b)**:
This tab contains _two_ separate tables. The data in each table originates from
the previous tab. We have just separated the rows that describe a tree for mutex
(1st table) and a tree for a thread (2nd table). The reviewer can check that the
plots in Fig. 3 (a) and 3(b) in the paper are identical to those in the right:

FIXME pic.

**Tab 3: Causality queries (Fig. 3c and claims 4, 5)**:
DPU access the mutex and thread trees explained above to determine if two events
in the unfolding are causally related. This table indicates how distant in the
tree the accessed nodes are. For each distance (depth difference, 1st column) we
give the total number of queries (2nd column) that DPU made (during the
unfolding of the benchmarks above) for nodes separated by that distance. The 3rd
column is a computed percentage.

This table produces the plot on the right (Fig. 3c of the paper) and provides
our evidence for the *claims 4 and 5*:

FIXME pic.

**Tab 4: Conflict queries (Fig. 3d and claim 6)**:
Similarly, DPU queries the data structure to determine if two events are in conflict.
The table in this tab indicates how distant the accessed nodes are and is
analogous to the table in the previous tab.

The plot on the right is Fig. 3d in the paper.  The table also provides evidence
for the *claim 6*.

### Generating the Data of the Spreadsheet

This section guides you to re-generate the data in the spreadsheet. All you need
to do is running:

```sh
$ make sec6.2-gen-csv
```

at the root of the repository.

This will call the script `scripts/run-sec6.2-gen-csv.sh`, which generates logs
and CSV files in the folder `sec6.2-fig3-trees/logs/`. We provide a copy of
pre-generated logs at the folder `sec6.2-fig3-trees/logs.provided/`, accessible
[here](sec6.2-fig3-trees/logs.provided/) as well.

The script uses a pre-compiled version of DPU (available at
`dist/dpu-tree-stats`) to perform the following tasks:

1. After creating a folder for the outputs, the script will **preprocess the
   benchmarks** (function `generate_bench_skiplist`). This will call `cpp` on
   the benchmarks with suitable `-D` macros to instantiate the parametric
   benchmarks.

2. **Run DPU** on all benchmarks (function `runall_dpu`). This will generate
   `.txt` files inside the log folder with the standard output of DPU.

3. Parse the logs and **generate CSV** files containing statistical data about
   the depths of nodes in the trees (function `parse_logs_into_tree_depth_csv`).
   This is done in the function. Three files will be generated:

   * File `tree-stats.csv`:
     This contains the data shown in the Tab 1 of the spreadsheet (we have
     manually copied it). The reviewer can check that the contents of the file
     and the spreadsheet are the same. These are the first 10 lines:

     ```csv
     Log file                            Tree id within the log   Nr of nodes   Depth   Avg. depth
     dispatch-serv4_reqs3_dpu_alt0.txt   0x2aff9d1bb6d0           3990          29      24.20
     dispatch-serv4_reqs3_dpu_alt0.txt   0x2aff9d1bb710           526           7       2.78
     dispatch-serv4_reqs3_dpu_alt0.txt   0x2aff9d1bb738           556           7       2.44
     dispatch-serv4_reqs3_dpu_alt0.txt   0x2aff9d1bb760           556           7       2.44
     dispatch-serv4_reqs3_dpu_alt0.txt   0x2aff9d1bb788           1040          7       2.76
     dispatch-serv4_reqs3_dpu_alt0.txt   t0                       4776          23      20.09
     dispatch-serv4_reqs3_dpu_alt0.txt   t1                       238           3       1.99
     dispatch-serv4_reqs3_dpu_alt0.txt   t2                       262           3       1.99
     dispatch-serv4_reqs3_dpu_alt0.txt   t3                       262           3       1.99
     dispatch-serv4_reqs3_dpu_alt0.txt   t4                       469           3       2.00
     ```

   * File `tree-variable-stats.csv`:
     This file and the next one are generated by filtering out some of the
     lines in the file above.  These two files correspond to the two tables in
     the Tab 2 of the spreadsheet. This file contains those rows from the file
     above that correspond to mutex trees (those with id `0x...`). The first 10
     lines:

     ```csv
     Log file                             Tree id within the log   Nr of nodes   Depth   Avg. depth
     poke-threads10_iters3_dpu_alt0.txt   0x2af510d636f0           8             3       1.50
     poke-threads11_iters3_dpu_alt0.txt   0x2ab73e9186f0           8             3       1.50
     poke-threads12_iters3_dpu_alt0.txt   0x2adb8ae626f0           8             3       1.50
     poke-threads13_iters3_dpu_alt0.txt   0x2b88db924700           8             3       1.50
     mpat-k4_dpu_alt0.txt                 0x2b3c62b526c0           476           3       1.83
     mpat-k4_dpu_alt0.txt                 0x2b3c62b526e8           476           3       1.83
     mpat-k4_dpu_alt0.txt                 0x2b3c62b52710           476           3       1.83
     mpat-k4_dpu_alt0.txt                 0x2b3c62b52738           476           3       1.83
     mpat-k5_dpu_alt0.txt                 0x2ab1b1fee6c0           3800          3       1.83
     mpat-k5_dpu_alt0.txt                 0x2ab1b1fee6e8           3800          3       1.83
     ```

   * File `tree-thread-stats.csv`:
     This contains the rows that describe trees for threads (those with id `t0`, `t1`, etc).

4. Finally the script generates histograms for causality and conflict queries.
   This is done in the functions `generate_histogram_causality_diff` and
   `generate_histogram_conflict_diff`. These function parse the logs again,
   generate an intermediate file `/tmp/pairs.txt` and aggregates the counters
   from multiple benchmarks using a python sript.

   Two files are generated, `histogram-conflict.csv` and
   `histogram-conflict.csv`, which are the data present in the Tab 3 and Tab 4
   of the which is the contents of the Tab 3 of the spreadsheet.

