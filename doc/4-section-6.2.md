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

We now guide the user to re-generate the data in the spreadsheet.

DPU needs to be compiled with the option `CONFIG_DETAILED_STATS` enabled to
produce additional statistics about the trees discussed in this section. This is
enabled in the file `config.mk` of the sources. We provide an example file with
the option already enabled:

```sh
grep CONFIG_STATS_DETAILED sec6.2-fig3-trees/config.mk 
CONFIG_STATS_DETAILED = 1
```

an special option XXX to output additional data.
  A config.mk is provided, and also the binaries, available HERE.
  The binaries are available in `sec6.2*/dpu-stats-dist`. They ha bee obtained
  using the `config.mk` in that folder. The difference is that we compiled
  the tool with `` enabled.


  Just make make compile-bla and you get it
- making sure we have a good compilation:

```sh
cesar@polaris:~/x/devel/dpu$ ./dist/bin/dpu -V | grep detailed-stats
Features: +detailed-stats 
```

- optional: explaining the output in 1 run

To generate the data you go to the root and type

```sh
cd $ROOT
make sec6.2-gen-csv
```

That in turn will call the script `scripts/run-sec6.2-gen-csv.sh`, which
generates logs in folder XX. Logs from a previous execution of the script are
provide in `THIS FOLDER`.

The script works in X stages:

1. Preprocess benchmarks:

 Snipet

2. Parse the logs and generate CSV files containing statistical data about the
   depths of nodes in the trees. This is done in the function
   `parse_logs_into_tree_depth_csv`. Three files are generated:

   tree-stats.csv
   This contains the data that we have manually copied to the first tab of the
   spreadsheet (title "Tree-depth raw data"). The reviewer can check that the
   contents of the file and the spreadsheet are the same.

   These are the first 15 lines of the file:

   FIXME

   tree-variable-stats.csv:

   This file and the next one are generated by selecting those lines in the
   above file that correspond to variables. This is done with a simple `grep`
   command in `parse_logs_into_tree_depth_csv`.

   The contents of this file are the 1st table in the 2nd TAB.

   The first 15 lines:
   FIXME


   tree-thread-stats.csv:
   This file results from taking the lines of the first CSV for the threads. It
   is the 2nd table in the 2nd tab.


   First 15 lines:

   FIXME
   
3. Generation of a histograms for causality and conflict queries

This is done in the functions `generate_histogram_causality_diff`
and `generate_histogram_conflict_diff`. These function parse the logs again
searching for lines like these generated by DPU:

example

The data extracted is then put in the file /tmp/pairs.txt and a small python
script aggregates the counts from multiple benchmarks.

Two files are generated, `histogram-conflict.csv`, whose contents are identical
to the 3rd tab of the spreadhseet. Here are the first 15 lines:

FIXME

And the file `histogram-conflict.csv`, whose contents are in the 4th tab. First
lines:

FIXME

