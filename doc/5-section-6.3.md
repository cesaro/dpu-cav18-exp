## Reproducing Section 6.3: Table 2, Debian Packages

Navigation: [Table of contents], [Previous section], [Next section]

[Table of contents]: 1-intro.md#index
[Previous section]: 4-section-6.2.md
[Next section]: 6-section-6.4.md

In this section, we show how to reproduce the results presented
in Table 2.

The benchmarks for this experiments can be found in the directory `benchmarks/debian`.

### Generate the results in Table 2

There are two parts in this experiment:

1. Generating the results with DPU.  From the root of the project type this:

   ```sh
   make sec3-table2-dpu
   ```

   This will run the script `./scripts/run-table2-dpu.sh`, which in turn will
   output logs to `sec6.3-table2/logs.<DATE>`. We provide example logs from a
   previous run in `sec6.3-table2/logs.provided.dpu`, also
   [available here](../sec6.3-table2/logs.provided.dpu/).

   The script will take around 50 min to finsh.

   The main log file in that folder is `LOG.log`, an example can be found
   [here](../sec6.3-table2/logs.provided.dpu/LOG.log).

 
2. Generating the results with MAPLE.  From the root of this project do as
   follows:

   ```sh
   cd tools/maple/sctbench
   cp env.template env.sh
   ```

   Now update the `ROOT` variable to point to the current directory. Next run
   this:

   ```sh
   ./run-table2-maple.sh 
   ```

   This creates a directory `benchmarks/__results` with two folders. Now grep
   for the strings `finished execution` and `execution time`.
