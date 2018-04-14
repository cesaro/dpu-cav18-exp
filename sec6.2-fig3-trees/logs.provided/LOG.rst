

Generation of the logs for Section 6.2
======================================

Date: Sat, 14 Apr 2018 14:46:56 +0000

All outputs of this script are in: /home/ubuntu/cesar/dpu-cav18-exp/sec6.2-fig3-trees/logs.2018-04-14_Sat_14:46:56
This is the output of the script ``scripts/run-sec6.1-gen-logs.sh``.



Dry running DPU
---------------

Running ``/home/ubuntu/cesar/dpu-cav18-exp/sec6.2-fig3-trees/dpu-stats-dist/bin/dpu --help``::

  Usage: dpu FILE.{c,i,bc,ll} ANALYZEROPTS -- PROGRAMOPTS
  
  where ANALYZEROPTS are options for DPU and PROGRAMOPTS is the command-line
  (the value of argv) that the program under analysis will receive. Note that
  PROGRAMOPTS shall include argv[0], usually the program name.
  
  Options in ANALYZEROPTS can be:
  
  General:
   -h, --help
     Show this message.
   -V, --version
     Display version information.
   -v [N], --verb=N
     Increment verbosity level by optional parameter N (1 to 3). Can be repeated.
   --gdb
     Runs dpu in a gdb session.
   --callgrind
     Runs dpu in a callgrind session.
  
  Analysis:
   -a A, --analysis=A
     Perform one of the following dynamic analyses (default 'por'):
     * A = por : Partial-order reduction
     * A = dr  : Partial-order reduction followed by data-race detection
   -k N, --altbound=N
     Use N-partial alternatives during POR exploration (default 1). Valid values are:
     * N = -1 : Source DPOR. This is slighly different and less powerful than N=1. FIXME
     * N = 0  : Optimal DPOR
     * N >= 1 : Quasi-Optimal POR using N-partial alternatives
   -x N, --maxcts N
     Prune POR tree beyond N context switches (default: no limit).
   --strace
     Print strace(1)-like info on program execution (default 0).
   --dosleep
     Make sleep(3) not to return EINTR immediately (default 0).
   --timeout N
     Abort exploration after N seconds.
   --dot=PATH
     Store in PATH a DOT digraph representing the full unfolding.
   --drfreq=N
     Use N% of the Mazurkiewicz traces found during POR analysis for
     data-race detection (default 10).
  
  Execution environment:
   -D MACRO
     Define a preprocessor macro.
   -O N
     Set the optimization level (0 to 3) to N (default 1).
   -m N, --mem=N
     Set the guest memory, in MB (default 128M).
   -s N, --stack=N
     Set default size for thread stacks, in MB (default 1M).
   --dump-instr=FILE.ll
     Dump instrumented LLVM bytecode to FILE.ll.

Running ``/home/ubuntu/cesar/dpu-cav18-exp/sec6.2-fig3-trees/dpu-stats-dist/bin/dpu --version``::

  dpu v0.5.2 (6244f97), compiled Sat, 14 Apr 2018 11:40:48 +0000
  Build type: release
  Features: +detailed-stats 
  Event structure: 29 slots, up to 1290555 events/slot, 256M memory per slot, 7G total memory, aligned to 8G, skip-step 4
  Trace buffer size: 1.0 Mevents
  Maximum verbosity level: 2
  Compilation: clang++-6.0 -Wall -std=c++11 -O3 -I ./src -I/usr/lib/llvm-6.0/include   -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -I ./lib/steroids/include/  -c -o config.h config.mk

**NOTE**:
If you see error messages above this line,
then check that you understand what you are doing!!


Preprocessing benchmarks
========================

Date: Sat, 14 Apr 2018 14:46:56 +0000

::

  cpp -E -D PARAM1=4 -D PARAM2=3 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/dispatcher.c -o dispatch-serv4_reqs3.i
  cpp -E -D PARAM1=4 -D PARAM2=4 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/dispatcher.c -o dispatch-serv4_reqs4.i
  cpp -E -D PARAM1=4 -D PARAM2=5 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/dispatcher.c -o dispatch-serv4_reqs5.i
  cpp -E -D PARAM1=4 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/mpat.c -o mpat-k4.i
  cpp -E -D PARAM1=5 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/mpat.c -o mpat-k5.i
  cpp -E -D PARAM1=6 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/mpat.c -o mpat-k6.i
  cpp -E -D PARAM1=3 -D PARAM2=4 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/multiprodcon.c -o multipc-prods3_workers4.i
  cpp -E -D PARAM1=4 -D PARAM2=4 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/multiprodcon.c -o multipc-prods4_workers4.i
  cpp -E -D PARAM1=6 -D PARAM2=2000 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/pi/pth_pi_mutex.c -o pi-threads6_iters2000.i
  cpp -E -D PARAM1=7 -D PARAM2=2000 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/pi/pth_pi_mutex.c -o pi-threads7_iters2000.i
  cpp -E -D PARAM1=8 -D PARAM2=2000 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/pi/pth_pi_mutex.c -o pi-threads8_iters2000.i
  cpp -E -D PARAM1=10 -D PARAM2=3 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/poke.c -o poke-threads10_iters3.i
  cpp -E -D PARAM1=11 -D PARAM2=3 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/poke.c -o poke-threads11_iters3.i
  cpp -E -D PARAM1=12 -D PARAM2=3 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/poke.c -o poke-threads12_iters3.i
  cpp -E -D PARAM1=13 -D PARAM2=3 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/poke.c -o poke-threads13_iters3.i


Running tool DPU
================

Date: Sat, 14 Apr 2018 14:46:56 +0000

::

  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/sec6.2-fig3-trees/dpu-stats-dist/bin/dpu dispatch-serv4_reqs3.i -k0 --mem 128M --stack 6M -O1 -v
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv4_reqs3_dpu_alt0.txt,                                       0.526,      61,     826,       0,    9577,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/sec6.2-fig3-trees/dpu-stats-dist/bin/dpu dispatch-serv4_reqs4.i -k0 --mem 128M --stack 6M -O1 -v
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv4_reqs4_dpu_alt0.txt,                                       3.171,      89,    6854,       0,   81509,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/sec6.2-fig3-trees/dpu-stats-dist/bin/dpu dispatch-serv4_reqs5.i -k0 --mem 128M --stack 6M -O1 -v
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv4_reqs5_dpu_alt0.txt,                                      40.359,     300,   54170,       0,  659465,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/sec6.2-fig3-trees/dpu-stats-dist/bin/dpu mpat-k4.i -k0 --mem 128M --stack 6M -O1 -v
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  mpat-k4_dpu_alt0.txt,                                                    0.406,      68,     384,       0,    3822,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/sec6.2-fig3-trees/dpu-stats-dist/bin/dpu mpat-k5.i -k0 --mem 128M --stack 6M -O1 -v
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  mpat-k5_dpu_alt0.txt,                                                    2.374,      83,    3840,       0,   38017,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/sec6.2-fig3-trees/dpu-stats-dist/bin/dpu mpat-k6.i -k0 --mem 128M --stack 6M -O1 -v
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  mpat-k6_dpu_alt0.txt,                                                   66.886,     257,   46080,       0,  455876,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/sec6.2-fig3-trees/dpu-stats-dist/bin/dpu multipc-prods3_workers4.i -k0 --mem 128M --stack 6M -O1 -v
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  multipc-prods3_workers4_dpu_alt0.txt,                                    1.604,      66,    3486,       0,   14833,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/sec6.2-fig3-trees/dpu-stats-dist/bin/dpu multipc-prods4_workers4.i -k0 --mem 128M --stack 6M -O1 -v
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  multipc-prods4_workers4_dpu_alt0.txt,                                  148.646,     103,  204120,       0,  121526,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/sec6.2-fig3-trees/dpu-stats-dist/bin/dpu pi-threads6_iters2000.i -k0 --mem 128M --stack 6M -O1 -v
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  pi-threads6_iters2000_dpu_alt0.txt,                                      0.541,      62,     720,       0,   10221,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/sec6.2-fig3-trees/dpu-stats-dist/bin/dpu pi-threads7_iters2000.i -k0 --mem 128M --stack 6M -O1 -v
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  pi-threads7_iters2000_dpu_alt0.txt,                                      2.488,      82,    5040,       0,   75113,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/sec6.2-fig3-trees/dpu-stats-dist/bin/dpu pi-threads8_iters2000.i -k0 --mem 128M --stack 6M -O1 -v
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  pi-threads8_iters2000_dpu_alt0.txt,                                     35.633,     290,   40320,       0,  629787,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/sec6.2-fig3-trees/dpu-stats-dist/bin/dpu poke-threads10_iters3.i -k0 --mem 128M --stack 6M -O1 -v
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads10_iters3_dpu_alt0.txt,                                      6.572,     166,    7384,       0,  185975,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/sec6.2-fig3-trees/dpu-stats-dist/bin/dpu poke-threads11_iters3.i -k0 --mem 128M --stack 6M -O1 -v
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads11_iters3_dpu_alt0.txt,                                     10.073,     207,    9904,       0,  263617,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/sec6.2-fig3-trees/dpu-stats-dist/bin/dpu poke-threads12_iters3.i -k0 --mem 128M --stack 6M -O1 -v
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads12_iters3_dpu_alt0.txt,                                     14.827,     254,   12940,       0,  363107,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/sec6.2-fig3-trees/dpu-stats-dist/bin/dpu poke-threads13_iters3.i -k0 --mem 128M --stack 6M -O1 -v
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads13_iters3_dpu_alt0.txt,                                     22.156,     324,   16540,       0,  488159,       0,
  


Extracting data from logs into CSV files
========================================

Date: Sat, 14 Apr 2018 14:52:53 +0000

::

  Done, the output is in three files:
  
  File tree-stats.csv:
  
  Log file                            Tree id within the log   Nr of nodes   Depth   Avg. depth
  dispatch-serv4_reqs3_dpu_alt0.txt    0x2aff9d1bb6d0           3990          29      24.20
  dispatch-serv4_reqs3_dpu_alt0.txt    0x2aff9d1bb710           526           7       2.78
  dispatch-serv4_reqs3_dpu_alt0.txt    0x2aff9d1bb738           556           7       2.44
  dispatch-serv4_reqs3_dpu_alt0.txt    0x2aff9d1bb760           556           7       2.44
  dispatch-serv4_reqs3_dpu_alt0.txt    0x2aff9d1bb788           1040          7       2.76
  dispatch-serv4_reqs3_dpu_alt0.txt    t0                       4776          23      20.09
  dispatch-serv4_reqs3_dpu_alt0.txt    t1                       238           3       1.99
  dispatch-serv4_reqs3_dpu_alt0.txt    t2                       262           3       1.99
  dispatch-serv4_reqs3_dpu_alt0.txt    t3                       262           3       1.99
  dispatch-serv4_reqs3_dpu_alt0.txt    t4                       469           3       2.00
  dispatch-serv4_reqs3_dpu_alt0.txt    t5                       3570          29      24.47
  dispatch-serv4_reqs4_dpu_alt0.txt    0x2b3469b636d0           35378         39      34.09
  dispatch-serv4_reqs4_dpu_alt0.txt    0x2b3469b63710           4338          9       3.17
  dispatch-serv4_reqs4_dpu_alt0.txt    0x2b3469b63738           4604          9       2.81
  ...
  
  File tree-variable-stats.csv:
  
  Log file                             Tree id within the log   Nr of nodes   Depth   Avg. depth
  poke-threads10_iters3_dpu_alt0.txt    0x2af510d636f0           8             3       1.50
  poke-threads11_iters3_dpu_alt0.txt    0x2ab73e9186f0           8             3       1.50
  poke-threads12_iters3_dpu_alt0.txt    0x2adb8ae626f0           8             3       1.50
  poke-threads13_iters3_dpu_alt0.txt    0x2b88db924700           8             3       1.50
  mpat-k4_dpu_alt0.txt                  0x2b3c62b526c0           476           3       1.83
  mpat-k4_dpu_alt0.txt                  0x2b3c62b526e8           476           3       1.83
  mpat-k4_dpu_alt0.txt                  0x2b3c62b52710           476           3       1.83
  mpat-k4_dpu_alt0.txt                  0x2b3c62b52738           476           3       1.83
  mpat-k5_dpu_alt0.txt                  0x2ab1b1fee6c0           3800          3       1.83
  mpat-k5_dpu_alt0.txt                  0x2ab1b1fee6e8           3800          3       1.83
  mpat-k5_dpu_alt0.txt                  0x2ab1b1fee710           3800          3       1.83
  mpat-k5_dpu_alt0.txt                  0x2ab1b1fee738           3800          3       1.83
  mpat-k5_dpu_alt0.txt                  0x2ab1b1fee760           3800          3       1.83
  mpat-k6_dpu_alt0.txt                  0x2b657a4cc6c0           37988         3       1.83
  ...
  
  File tree-thread-stats.csv:
  
  Log file                             Tree id within the log   Nr of nodes   Depth   Avg. depth
  poke-threads10_iters3_dpu_alt0.txt    t1                       7             3       1.71
  poke-threads11_iters3_dpu_alt0.txt    t1                       7             3       1.71
  poke-threads12_iters3_dpu_alt0.txt    t1                       7             3       1.71
  poke-threads13_iters3_dpu_alt0.txt    t1                       7             3       1.71
  dispatch-serv4_reqs3_dpu_alt0.txt     t1                       238           3       1.99
  dispatch-serv4_reqs3_dpu_alt0.txt     t2                       262           3       1.99
  dispatch-serv4_reqs3_dpu_alt0.txt     t3                       262           3       1.99
  mpat-k4_dpu_alt0.txt                  t1                       241           3       1.99
  mpat-k4_dpu_alt0.txt                  t3                       241           3       1.99
  mpat-k4_dpu_alt0.txt                  t5                       241           3       1.99
  mpat-k4_dpu_alt0.txt                  t7                       241           3       1.99
  dispatch-serv4_reqs3_dpu_alt0.txt     t4                       469           3       2.00
  dispatch-serv4_reqs4_dpu_alt0.txt     t1                       1858          3       2.00
  dispatch-serv4_reqs4_dpu_alt0.txt     t2                       2059          3       2.00
  ...


Generating the histogram of depth differences on causality queries
==================================================================

Date: Sat, 14 Apr 2018 14:52:53 +0000

::

  Done, output is in histogram-causality.csv
  Fist 15 lines:
  Difference   Count
  1            280496
  2            279700
  3            7748
  4            154250
  5            0
  6            536
  7            0
  8            536
  9            0
  10           31752
  11           0
  12           536
  13           0
  14           536
  ...


Generation the histogram of depth differences on conflcit queries
=================================================================

Date: Sat, 14 Apr 2018 14:52:53 +0000

::

  Done, output is in histogram-conflict.csv
  Fist 15 lines:
  Difference   Count
  1            154135347
  2            306869610
  3            3361629
  4            85747230
  5            618238
  6            40388468
  7            380929
  8            21282279
  9            190500
  10           11383820
  11           52677
  12           9072925
  13           58746
  14           7736624
  ...


End of the log.

Date: Sat, 14 Apr 2018 14:52:53 +0000
