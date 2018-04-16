

Generation of Table 1
=====================

Date: Mon, 16 Apr 2018 02:06:56 +0000

This is the output of the script ``run-table1.sh``.


Machine Information
-------------------

Running ``hostname``::

  ip-172-31-4-84

Running ``uname -a``::

  Linux ip-172-31-4-84 3.13.0-58-generic #97-Ubuntu SMP Wed Jul 8 02:56:15 UTC 2015 x86_64 x86_64 x86_64 GNU/Linux

Running ``lsb_release -a``::

  No LSB modules are available.
  Distributor ID:	Ubuntu
  Description:	Ubuntu 14.04.2 LTS
  Release:	14.04
  Codename:	trusty

Running ``cat /proc/cpuinfo``::

  processor	: 0
  vendor_id	: GenuineIntel
  cpu family	: 6
  model		: 79
  model name	: Intel(R) Xeon(R) CPU E5-2686 v4 @ 2.30GHz
  stepping	: 1
  microcode	: 0xb000025
  cpu MHz		: 2300.034
  cache size	: 46080 KB
  cpu cores	: 4
  fpu		: yes
  fpu_exception	: yes
  cpuid level	: 13
  wp		: yes
  bogomips	: 4600.06
  clflush size	: 64
  cache_alignment	: 64
  address sizes	: 46 bits physical, 48 bits virtual
  power management:
  
  processor	: 1
  vendor_id	: GenuineIntel
  cpu family	: 6
  model		: 79
  model name	: Intel(R) Xeon(R) CPU E5-2686 v4 @ 2.30GHz
  stepping	: 1
  microcode	: 0xb000025
  cpu MHz		: 2300.034
  cache size	: 46080 KB
  cpu cores	: 4
  fpu		: yes
  fpu_exception	: yes
  cpuid level	: 13
  wp		: yes
  bogomips	: 4600.06
  clflush size	: 64
  cache_alignment	: 64
  address sizes	: 46 bits physical, 48 bits virtual
  power management:
  
  processor	: 2
  vendor_id	: GenuineIntel
  cpu family	: 6
  model		: 79
  model name	: Intel(R) Xeon(R) CPU E5-2686 v4 @ 2.30GHz
  stepping	: 1
  microcode	: 0xb000025
  cpu MHz		: 2300.034
  cache size	: 46080 KB
  cpu cores	: 4
  fpu		: yes
  fpu_exception	: yes
  cpuid level	: 13
  wp		: yes
  bogomips	: 4600.06
  clflush size	: 64
  cache_alignment	: 64
  address sizes	: 46 bits physical, 48 bits virtual
  power management:
  
  processor	: 3
  vendor_id	: GenuineIntel
  cpu family	: 6
  model		: 79
  model name	: Intel(R) Xeon(R) CPU E5-2686 v4 @ 2.30GHz
  stepping	: 1
  microcode	: 0xb000025
  cpu MHz		: 2300.034
  cache size	: 46080 KB
  cpu cores	: 4
  fpu		: yes
  fpu_exception	: yes
  cpuid level	: 13
  wp		: yes
  bogomips	: 4600.06
  clflush size	: 64
  cache_alignment	: 64
  address sizes	: 46 bits physical, 48 bits virtual
  power management:
  

Running ``cat /proc/meminfo``::

  MemTotal:       16433188 kB
  MemFree:        11183072 kB
  SwapTotal:             0 kB
  SwapFree:              0 kB
  VmallocTotal:   34359738367 kB
  HugePages_Total:       0
  HugePages_Free:        0


Dry running the tools
---------------------

Running ``/home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu --help``::

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

Running ``/home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu --version``::

  dpu v0.5.2 (c5df6e5, dirty), compiled Sat, 14 Apr 2018 21:20:08 +0000
  Build type: release
  Features: -detailed-stats 
  Event structure: 29 slots, up to 1290555 events/slot, 256M memory per slot, 7G total memory, aligned to 8G, skip-step 4
  Trace buffer size: 1.0 Mevents
  Maximum verbosity level: 2
  Compilation: clang++-6.0 -Wall -std=c++11 -O3 -I ./src -I/usr/lib/llvm-6.0/include   -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -I ./lib/steroids/include/  -c -o config.h config.mk

Running ``/home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --help``::

  Usage: /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc [[COMPILER/NIDHUGGC OPTIONS --] NIDHUGG/NIDHUGGC OPTIONS] FILE [-- [PROGRAM ARGUMENTS]]
  
   - FILE should be a source code file in C or C++.
   - COMPILER OPTIONS are options that will be sent to the compiler
     (clang/clang++).
   - NIDHUGG OPTIONS are options that will be sent to nidhugg.
     (See nidhugg --help for details.)
  
  NIDHUGGC OPTIONS:
    --help
        Prints this text.
    --version
        Prints the nidhugg version.
    --c
        Interpret input FILE as C code. (Compile with clang.)
    --cxx
        Interpret input FILE as C++ code. (Compile with clang++.)
    --clang=PATH
        Specify the path to clang.
    --clangxx=PATH
        Specify the path to clang++.
    --nidhugg=PATH
        Specify the path to the nidhugg binary.
    --no-spin-assume
        Don't use the spin-assume transformation on module before calling nidhugg.
    --unroll=N
        Use unroll transformation on module before calling nidhugg.

Running ``/home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --version``::

  Nidhugg 0.2 (7166349, Release, with LLVM-4.0.1:RelWithDebInfo)

Running ``clang-4.0 --version`` (required by nidhugg)::

  clang version 4.0.1-svn305264-1~exp1 (branches/release_40)
  Target: x86_64-unknown-linux-gnu
  Thread model: posix
  InstalledDir: /usr/bin

**NOTE**:
If you see error messages above this line,
then check that you understand what you are doing!!


Preprocessing benchmark
=======================

Date: Mon, 16 Apr 2018 02:06:56 +0000

::

  cpp -E -D PARAM1=5 -D PARAM2=2 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/dispatcher.c -o dispatch-serv5_reqs2.i
  cpp -E -D PARAM1=5 -D PARAM2=3 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/dispatcher.c -o dispatch-serv5_reqs3.i
  cpp -E -D PARAM1=5 -D PARAM2=4 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/dispatcher.c -o dispatch-serv5_reqs4.i
  cpp -E -D PARAM1=5 -D PARAM2=5 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/dispatcher.c -o dispatch-serv5_reqs5.i
  cpp -E -D PARAM1=5 -D PARAM2=6 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/dispatcher.c -o dispatch-serv5_reqs6.i
  cpp -E -D PARAM1=4 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/mpat.c -o mpat-k4.i
  cpp -E -D PARAM1=5 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/mpat.c -o mpat-k5.i
  cpp -E -D PARAM1=6 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/mpat.c -o mpat-k6.i
  cpp -E -D PARAM1=7 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/mpat.c -o mpat-k7.i
  cpp -E -D PARAM1=8 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/mpat.c -o mpat-k8.i
  cpp -E -D PARAM1=2 -D PARAM2=5 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/multiprodcon.c -o multipc-prods2_workers5.i
  cpp -E -D PARAM1=3 -D PARAM2=5 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/multiprodcon.c -o multipc-prods3_workers5.i
  cpp -E -D PARAM1=4 -D PARAM2=5 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/multiprodcon.c -o multipc-prods4_workers5.i
  cpp -E -D PARAM1=5 -D PARAM2=5 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/multiprodcon.c -o multipc-prods5_workers5.i
  cpp -E -D PARAM1=5 -D PARAM2=5000 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/pi/pth_pi_mutex.c -o pi-threads5_iters5000.i
  cpp -E -D PARAM1=6 -D PARAM2=5000 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/pi/pth_pi_mutex.c -o pi-threads6_iters5000.i
  cpp -E -D PARAM1=7 -D PARAM2=5000 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/pi/pth_pi_mutex.c -o pi-threads7_iters5000.i
  cpp -E -D PARAM1=8 -D PARAM2=5000 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/pi/pth_pi_mutex.c -o pi-threads8_iters5000.i
  cpp -E -D PARAM1=7 -D PARAM2=3 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/poke.c -o poke-threads07_iters3.i
  cpp -E -D PARAM1=8 -D PARAM2=3 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/poke.c -o poke-threads08_iters3.i
  cpp -E -D PARAM1=9 -D PARAM2=3 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/poke.c -o poke-threads09_iters3.i
  cpp -E -D PARAM1=10 -D PARAM2=3 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/poke.c -o poke-threads10_iters3.i
  cpp -E -D PARAM1=11 -D PARAM2=3 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/poke.c -o poke-threads11_iters3.i
  cpp -E -D PARAM1=12 -D PARAM2=3 /home/ubuntu/cesar/dpu-cav18-exp/benchmarks/poke.c -o poke-threads12_iters3.i


Running tool DPU
================

Date: Mon, 16 Apr 2018 02:06:57 +0000

::

  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu dispatch-serv5_reqs2.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv5_reqs2_dpu_alt0.txt,                                       0.302,      63,     137,       0,    1603,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu dispatch-serv5_reqs2.i -k1 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv5_reqs2_dpu_alt1.txt,                                       0.620,      63,     137,    1039,    1603,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu dispatch-serv5_reqs2.i -k2 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv5_reqs2_dpu_alt2.txt,                                       0.318,      63,     137,      43,    1603,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu dispatch-serv5_reqs2.i -k3 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv5_reqs2_dpu_alt3.txt,                                       0.297,      63,     137,       0,    1603,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu dispatch-serv5_reqs3.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv5_reqs3_dpu_alt0.txt,                                       1.040,      66,    1482,       0,   17594,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu dispatch-serv5_reqs3.i -k1 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv5_reqs3_dpu_alt1.txt,                                       4.842,      66,    1482,   11167,   17594,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu dispatch-serv5_reqs3.i -k2 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv5_reqs3_dpu_alt2.txt,                                       1.038,      66,    1482,     595,   17594,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu dispatch-serv5_reqs3.i -k3 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv5_reqs3_dpu_alt3.txt,                                       0.772,      66,    1482,       1,   17594,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu dispatch-serv5_reqs4.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv5_reqs4_dpu_alt0.txt,                                       8.210,     126,   15282,       0,  185330,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu dispatch-serv5_reqs4.i -k1 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv5_reqs4_dpu_alt1.txt,                                      53.081,     126,   15282,  105971,  185330,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu dispatch-serv5_reqs4.i -k2 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv5_reqs4_dpu_alt2.txt,                                      12.972,     126,   15282,    6353,  185330,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu dispatch-serv5_reqs4.i -k3 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv5_reqs4_dpu_alt3.txt,                                       8.863,     126,   15282,     213,  185330,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu dispatch-serv5_reqs5.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv5_reqs5_dpu_alt0.txt,                                     226.664,     756,  151032,       0, 1869116,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu dispatch-serv5_reqs5.i -k1 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv5_reqs5_dpu_alt1.txt,                                          TO,     688,       -,       -,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu dispatch-serv5_reqs5.i -k2 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv5_reqs5_dpu_alt2.txt,                                     390.746,     756,  151032,   53658, 1869116,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu dispatch-serv5_reqs5.i -k3 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv5_reqs5_dpu_alt3.txt,                                     260.252,     756,  151032,    2378, 1869116,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu dispatch-serv5_reqs6.i -k0 --mem 128M --stack 6M -O1
  dispatch-serv5_reqs6_dpu_alt0.txt.stdout:dpu: error: unhandled exception: Process 0: failure to add new events: out of memory
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv5_reqs6_dpu_alt0.txt,                                          MO,    1101,       -,       -,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu dispatch-serv5_reqs6.i -k1 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv5_reqs6_dpu_alt1.txt,                                          TO,     723,       -,       -,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu dispatch-serv5_reqs6.i -k2 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv5_reqs6_dpu_alt2.txt,                                          TO,    1073,       -,       -,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu dispatch-serv5_reqs6.i -k3 --mem 128M --stack 6M -O1
  dispatch-serv5_reqs6_dpu_alt3.txt.stdout:dpu: error: unhandled exception: Process 0: failure to add new events: out of memory
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  dispatch-serv5_reqs6_dpu_alt3.txt,                                          MO,    1101,       -,       -,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu mpat-k4.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  mpat-k4_dpu_alt0.txt,                                                    0.394,      68,     384,       0,    3822,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu mpat-k4.i -k1 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  mpat-k4_dpu_alt1.txt,                                                    0.398,      68,     384,       0,    3822,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu mpat-k5.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  mpat-k5_dpu_alt0.txt,                                                    2.306,      83,    3840,       0,   38017,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu mpat-k5.i -k1 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  mpat-k5_dpu_alt1.txt,                                                    2.131,      83,    3840,       0,   38017,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu mpat-k6.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  mpat-k6_dpu_alt0.txt,                                                   60.773,     257,   46080,       0,  455876,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu mpat-k6.i -k1 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  mpat-k6_dpu_alt1.txt,                                                   36.925,     256,   46080,       0,  455876,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu mpat-k7.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  mpat-k7_dpu_alt0.txt,                                                       TO,     795,       -,       -,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu mpat-k8.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  mpat-k8_dpu_alt0.txt,                                                       TO,     809,       -,       -,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu multipc-prods2_workers5.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  multipc-prods2_workers5_dpu_alt0.txt,                                    0.280,      65,      60,       0,     397,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu multipc-prods2_workers5.i -k1 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  multipc-prods2_workers5_dpu_alt1.txt,                                    0.461,      65,      60,     560,     397,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu multipc-prods2_workers5.i -k2 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  multipc-prods2_workers5_dpu_alt2.txt,                                    0.280,      65,      60,       0,     397,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu multipc-prods3_workers5.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  multipc-prods3_workers5_dpu_alt0.txt,                                    1.470,      69,    2958,       0,    7832,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu multipc-prods3_workers5.i -k1 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  multipc-prods3_workers5_dpu_alt1.txt,                                   23.971,      69,    2958,   50664,    7832,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu multipc-prods3_workers5.i -k2 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  multipc-prods3_workers5_dpu_alt2.txt,                                    2.615,      69,    2958,    2578,    7832,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu multipc-prods3_workers5.i -k3 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  multipc-prods3_workers5_dpu_alt3.txt,                                    1.473,      69,    2958,       0,    7832,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu multipc-prods4_workers5.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  multipc-prods4_workers5_dpu_alt0.txt,                                  226.843,     279,  314064,       0,  578835,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu multipc-prods4_workers5.i -k1 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  multipc-prods4_workers5_dpu_alt1.txt,                                       TO,     171,       -,       -,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu multipc-prods4_workers5.i -k2 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  multipc-prods4_workers5_dpu_alt2.txt,                                       TO,     213,       -,       -,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu multipc-prods4_workers5.i -k3 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  multipc-prods4_workers5_dpu_alt3.txt,                                  283.969,     279,  314064,   29597,  578835,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu multipc-prods5_workers5.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  multipc-prods5_workers5_dpu_alt0.txt,                                       TO,     886,       -,       -,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu pi-threads5_iters5000.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  pi-threads5_iters5000_dpu_alt0.txt,                                      0.324,      58,     120,       0,    1623,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu pi-threads5_iters5000.i -k1 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  pi-threads5_iters5000_dpu_alt1.txt,                                      0.332,      58,     120,       0,    1623,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu pi-threads6_iters5000.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  pi-threads6_iters5000_dpu_alt0.txt,                                      0.555,      62,     720,       0,   10221,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu pi-threads6_iters5000.i -k1 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  pi-threads6_iters5000_dpu_alt1.txt,                                      0.556,      62,     720,       0,   10221,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu pi-threads7_iters5000.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  pi-threads7_iters5000_dpu_alt0.txt,                                      2.497,      82,    5040,       0,   75113,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu pi-threads7_iters5000.i -k1 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  pi-threads7_iters5000_dpu_alt1.txt,                                      2.526,      82,    5040,       0,   75113,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu pi-threads8_iters5000.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  pi-threads8_iters5000_dpu_alt0.txt,                                     35.791,     290,   40320,       0,  629787,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu pi-threads8_iters5000.i -k1 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  pi-threads8_iters5000_dpu_alt1.txt,                                     35.996,     290,   40320,       0,  629787,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads07_iters3.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads07_iters3_dpu_alt0.txt,                                      1.610,     100,    2440,       0,   51317,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads07_iters3.i -k1 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads07_iters3_dpu_alt1.txt,                                     44.272,      98,    2440,   72022,   51317,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads07_iters3.i -k2 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads07_iters3_dpu_alt2.txt,                                      2.442,      98,    2440,    1271,   51317,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads07_iters3.i -k3 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads07_iters3_dpu_alt3.txt,                                      1.656,      98,    2440,       6,   51317,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads08_iters3.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads08_iters3_dpu_alt0.txt,                                      2.496,     112,    3700,       0,   82819,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads08_iters3.i -k1 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads08_iters3_dpu_alt1.txt,                                    141.699,     112,    3700,  214737,   82819,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads08_iters3.i -k2 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads08_iters3_dpu_alt2.txt,                                      4.529,     112,    3700,    2771,   82819,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads08_iters3.i -k3 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads08_iters3_dpu_alt3.txt,                                      2.527,     112,    3700,      10,   82819,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads09_iters3.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads09_iters3_dpu_alt0.txt,                                      3.750,     138,    5332,       0,  126755,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads09_iters3.i -k1 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads09_iters3_dpu_alt1.txt,                                    416.167,     138,    5332,  592219,  126755,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads09_iters3.i -k2 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads09_iters3_dpu_alt2.txt,                                      7.904,     138,    5332,    4659,  126755,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads09_iters3.i -k3 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads09_iters3_dpu_alt3.txt,                                      3.831,     140,    5332,      15,  126755,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads10_iters3.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads10_iters3_dpu_alt0.txt,                                      5.862,     166,    7384,       0,  185975,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads10_iters3.i -k1 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads10_iters3_dpu_alt1.txt,                                         TO,     161,       -,       -,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads10_iters3.i -k2 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads10_iters3_dpu_alt2.txt,                                     14.138,     166,    7384,    8518,  185975,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads10_iters3.i -k3 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads10_iters3_dpu_alt3.txt,                                      5.926,     166,    7384,      21,  185975,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads11_iters3.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads11_iters3_dpu_alt0.txt,                                      8.522,     207,    9904,       0,  263617,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads11_iters3.i -k1 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads11_iters3_dpu_alt1.txt,                                         TO,     185,       -,       -,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads11_iters3.i -k2 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads11_iters3_dpu_alt2.txt,                                     22.741,     207,    9904,   12461,  263617,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads11_iters3.i -k3 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads11_iters3_dpu_alt3.txt,                                      8.635,     207,    9904,      28,  263617,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads12_iters3.i -k0 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads12_iters3_dpu_alt0.txt,                                     12.562,     254,   12940,       0,  363107,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads12_iters3.i -k1 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads12_iters3_dpu_alt1.txt,                                         TO,     214,       -,       -,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads12_iters3.i -k2 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads12_iters3_dpu_alt2.txt,                                     42.189,     254,   12940,   20441,  363107,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/dpu/bin/dpu poke-threads12_iters3.i -k3 --mem 128M --stack 6M -O1
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,  EVENTS, DEFECTS,
  poke-threads12_iters3_dpu_alt3.txt,                                     12.768,     254,   12940,      36,  363107,       0,
  


Running tool NIDHUGG
====================

Date: Mon, 16 Apr 2018 04:28:45 +0000

::

  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow dispatch-serv5_reqs2.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  dispatch-serv5_reqs2_nidhugg.txt,                                        1.492,      21,     137,    1591,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow dispatch-serv5_reqs3.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  dispatch-serv5_reqs3_nidhugg.txt,                                       15.583,      21,    1482,   13734,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow dispatch-serv5_reqs4.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  dispatch-serv5_reqs4_nidhugg.txt,                                      164.915,      21,   15282,  115614,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow dispatch-serv5_reqs5.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  dispatch-serv5_reqs5_nidhugg.txt,                                           TO,      21,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow dispatch-serv5_reqs6.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  dispatch-serv5_reqs6_nidhugg.txt,                                           TO,      21,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow mpat-k4.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  mpat-k4_nidhugg.txt,                                                     0.268,      20,     384,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow mpat-k5.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  mpat-k5_nidhugg.txt,                                                     2.205,      20,    3840,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow mpat-k6.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  mpat-k6_nidhugg.txt,                                                    29.927,      20,   46080,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow mpat-k7.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  mpat-k7_nidhugg.txt,                                                        TO,      20,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow mpat-k8.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  mpat-k8_nidhugg.txt,                                                        TO,      20,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow multipc-prods2_workers5.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  multipc-prods2_workers5_nidhugg.txt,                                     2.745,      21,      60,    2856,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow multipc-prods3_workers5.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  multipc-prods3_workers5_nidhugg.txt,                                    98.575,      21,    2958,   85737,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow multipc-prods4_workers5.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  multipc-prods4_workers5_nidhugg.txt,                                        TO,      21,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow multipc-prods5_workers5.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  multipc-prods5_workers5_nidhugg.txt,                                        TO,      21,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow pi-threads5_iters5000.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  pi-threads5_iters5000_nidhugg.txt,                                      41.141,     115,     120,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow pi-threads6_iters5000.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  pi-threads6_iters5000_nidhugg.txt,                                     244.476,     118,     720,       0,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow pi-threads7_iters5000.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  pi-threads7_iters5000_nidhugg.txt,                                          TO,      21,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow pi-threads8_iters5000.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  pi-threads8_iters5000_nidhugg.txt,                                          TO,      21,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow poke-threads07_iters3.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  poke-threads07_iters3_nidhugg.txt,                                     106.837,      21,    2440,   90072,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow poke-threads08_iters3.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  poke-threads08_iters3_nidhugg.txt,                                     359.263,      21,    3700,  274828,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow poke-threads09_iters3.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  poke-threads09_iters3_nidhugg.txt,                                          TO,      21,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow poke-threads10_iters3.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  poke-threads10_iters3_nidhugg.txt,                                          TO,      21,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow poke-threads11_iters3.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  poke-threads11_iters3_nidhugg.txt,                                          TO,      21,       -,       -,
  
  # /usr/bin/time -v timeout 8m /home/ubuntu/cesar/dpu-cav18-exp/dist/nidhugg/bin/nidhuggc --c -sc -disable-mutex-init-requirement -extfun-no-race=printf -extfun-no-race=fprintf -extfun-no-race=write -extfun-no-race=exit -extfun-no-race=atoi -extfun-no-race=pow poke-threads12_iters3.i
  LOG,                                                                     WTIME,  MAXRSS,  MAXCON,    SSBS,
  poke-threads12_iters3_nidhugg.txt,                                          TO,      21,       -,       -,
  


Generating latex tables
=======================

Date: Mon, 16 Apr 2018 06:22:33 +0000

::

  Generating latex table ...
  dispatch-serv5_reqs2
  dispatch-serv5_reqs3
  dispatch-serv5_reqs4
  dispatch-serv5_reqs5
  dispatch-serv5_reqs6
  mpat-k4
  mpat-k5
  mpat-k6
  mpat-k7
  mpat-k8
  multipc-prods2_workers5
  multipc-prods3_workers5
  multipc-prods4_workers5
  multipc-prods5_workers5
  pi-threads5_iters5000
  pi-threads6_iters5000
  pi-threads7_iters5000
  pi-threads8_iters5000
  poke-threads07_iters3
  poke-threads08_iters3
  poke-threads09_iters3
  poke-threads10_iters3
  poke-threads11_iters3
  poke-threads12_iters3
  done!


End of the log.

Date: Mon, 16 Apr 2018 06:22:34 +0000
