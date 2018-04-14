#!/bin/bash

# This script has to be executed from the root of the repository

# ==== BEGIN CONFIGURATION VARIABLES ====

# 1s = 1 second; 2m = 2 minutes; 3h = 3 hours
TIMEOUT=8m

WANT_DPU_ALT_SDPOR=n
WANT_DPU_ALT0=y
WANT_DPU_ALT1=n
WANT_DPU_ALT2=n
WANT_DPU_ALT3=n
WANT_DPU_ALT4=n

DPU_OPTS="--mem 128M --stack 6M -O1 -v"

# ==== END CONFIGURATION VARIABLES ====

# utilitary functions to run benchmarks
source scripts/runlib.sh

generate_bench_skiplist ()
{
   # Selection of benchmarks for analyzing the performance of the sequential
   # trees. These are roughly a subset of those in generate_bench_selection
   # (Table 1) representative of the overall set of Table 1.

   #preprocess_family $R/benchmarks/dispatcher.c dispatch   "serv" "4" "reqs" "`seq -w 3 5`"
   preprocess_family $R/benchmarks/dispatcher.c dispatch   "serv" "4" "reqs" "`seq -w 3 3`"
   #preprocess_family $R/benchmarks/mpat.c       mpat       "k" "`seq -w 4 6`"
   preprocess_family $R/benchmarks/mpat.c       mpat       "k" "`seq -w 4 4`"
   #preprocess_family $R/benchmarks/multiprodcon.c multipc  "prods" "3 4" "workers" "4"
   #preprocess_family $R/benchmarks/pi/pth_pi_mutex.c pi    "threads" "`seq -w 6 8`" "iters" "2000"
   #preprocess_family $R/benchmarks/poke.c       poke       "threads" "`seq -w 10 13`" "iters" "3"
}

runall_dpu ()
{
   # pre-conditions:
   # $TIMEOUT - a timeout specification valid for timeout(1)
   # $DPU     - path to the dpu tool to run

   for i in *.i; do
      N=`echo "$i" | sed s/.i$//`

      if test $WANT_DPU_ALT_SDPOR = y; then
         # -k-1
         LOG=${N}_dpu_alt-1.txt
         CMD="$DPU $i -k-1 $DPU_OPTS"
         run_dpu
      fi

      if test $WANT_DPU_ALT0 = y; then
         # -k0
         LOG=${N}_dpu_alt0.txt
         CMD="$DPU $i -k0 $DPU_OPTS"
         run_dpu

         # if we got TO on -k0, surely we will also get it on -kX with X!=0
         if test "$WALLTIME" == "TO"; then continue; fi
      fi

      # k-partial
      for a in 1 2 3 4; do
         case $a in
         1) if test $WANT_DPU_ALT1 = n; then continue; fi;;
         2) if test $WANT_DPU_ALT2 = n; then continue; fi;;
         3) if test $WANT_DPU_ALT3 = n; then continue; fi;;
         4) if test $WANT_DPU_ALT4 = n; then continue; fi;;
         esac
         LOG=${N}_dpu_alt${a}.txt
         CMD="$DPU $i -k$a $DPU_OPTS"
         run_dpu

         # if we got 0 SSBs we skip higher -k
         if test "$SSBS" = 0; then break; fi
      done
   done
}

get_tool_binaries ()
{
   DPU="$R/sec6.2-fig3-trees/dpu-stats-dist/bin/dpu"
}

parse_logs_into_tree_depth_csv()
{
   grep 'dpu: por: stats: trees:' *.txt > /tmp/stats.txt

   grep 'stats: trees: depths:' /tmp/stats.txt | awk -F '[ :/]' '{print $1 ", " $12 ", Bdepths, " $17 ", " $18 }' > /tmp/depths.csv
   grep 'stats: trees: branch-out:' /tmp/stats.txt | awk -F '[ :/=]' '{print $1 ", " $12 ", Asize, " $16 }' > /tmp/sizes.csv
   sort /tmp/depths.csv /tmp/sizes.csv > /tmp/sorted.csv
   sed 'N; s/\n/, /' /tmp/sorted.csv | awk -F, '{print $1 ", " $2 ", " $4 ", " $8 ", " $9}' > /tmp/good-columns.csv

   HEADER='Log file, Tree id within the log, Nr of nodes, Depth, Avg. depth'
   (echo "$HEADER"; cat /tmp/good-columns.csv | sort) >> tree-stats.csv

   #echo xxxxxxxxxxxxxxxxx
   #cat /tmp/stats.txt
   #echo xxxxxxxxxxxxxxxxx
   #cat tree-stats.csv

   (echo "$HEADER"; cat tree-stats.csv | grep 'txt,  0x' | sort -k5 -n) > tree-variable-stats.csv
   (echo "$HEADER"; cat tree-stats.csv | grep 'txt,  t' | sort -k5 -n) > tree-thread-stats.csv

   echo "Done, here are the fist 15 lines of each CSV file:"
   echo
   echo "File tree-stats.csv:"
   echo
   cat tree-stats.csv | head -n15 | column -t -s,
   echo "..."
   echo
   echo "File tree-variable-stats.csv:"
   echo
   cat tree-variable-stats.csv | head -n15 | column -t -s,
   echo "..."
   echo
   echo "File tree-thread-stats.csv:"
   echo
   cat tree-thread-stats.csv | head -n15 | column -t -s,
   echo "..."
}

main ()
{
   h1_date "Generation of the logs for Section 6.2"

   echo 'This is the output of the script ``scripts/run-sec6.1-gen-logs.sh``.'

   #print_machine_infos
   get_tool_binaries
   dry_run_dpu

   h1_date "Preprocessing benchmarks"
   echo ::
   echo
   generate_bench_skiplist 2>&1 | quote

   h1_date "Running tool DPU"
   echo ::
   echo
   runall_dpu 2>&1 | quote

   h1_date "Extracting data from logs into CSV files"
   echo ::
   echo
   parse_logs_into_tree_depth_csv 2>&1 | quote

   echo
   echo
   echo End of the log.
   echo
   echo -n "Date: "
   date -R
}

# root of the dpu-cav18-ae repository
R=$PWD

rm  -f $R/sec6.2-fig3-trees/logs
rm -Rf $R/sec6.2-fig3-trees/logs.$(date +%F_%a_%T)

LOGS=$R/sec6.2-fig3-trees/logs.$(date +%F_%a_%T)

mkdir -p $LOGS
ln -s $LOGS $R/sec6.2-fig3-trees/logs
cd $LOGS

main 2>&1 | tee LOG.rst

