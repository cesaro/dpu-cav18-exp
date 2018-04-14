#!/bin/bash

# This script has to be executed from the root of the repository

# ==== BEGIN CONFIGURATION VARIABLES ====

# 1s = 1 second; 2m = 2 minutes; 3h = 3 hours
TIMEOUT=8m

# ==== END CONFIGURATION VARIABLES ====

# utilitary functions to run benchmarks
source scripts/runlib.sh

generate_bench_skiplist ()
{
   # Selection of benchmarks for analyzing the performance of the sequential
   # trees. These are roughly a subset of those in generate_bench_selection
   # (Table 1) representative of the overall set of Table 1.

   preprocess_family $R/benchmarks/dispatcher.c dispatch   "serv" "4" "reqs" "`seq -w 3 5`"
   preprocess_family $R/benchmarks/mpat.c       mpat       "k" "`seq -w 4 6`"
   preprocess_family $R/benchmarks/multiprodcon.c multipc  "prods" "3 4" "workers" "4"
   preprocess_family $R/benchmarks/pi/pth_pi_mutex.c pi    "threads" "`seq -w 6 8`" "iters" "2000"
   preprocess_family $R/benchmarks/poke.c       poke       "threads" "`seq -w 10 13`" "iters" "3"
}

runall_dpu ()
{
   # pre-conditions:
   # $TIMEOUT - a timeout specification valid for timeout(1)
   # $DPU     - path to the dpu tool to run

   for i in *.i; do
      N=`echo "$i" | sed s/.i$//`

      # -k0
      LOG=${N}_dpu_alt0.txt
      CMD="$DPU $i -k0 --mem 128M --stack 6M -O1 -v"
      run_dpu

      # if we got TO on -k0, surely we will also get it on -kX with X!=0
      if test "$WALLTIME" == "TO"; then continue; fi
   done
}

get_tool_binaries ()
{
   DPU="$R/dist/dpu-tree-stats/bin/dpu"
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

   echo "Done, the output is in three files:"
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

histogram_aggregate ()
{
   cat <<< "
import sys

d = {}
for l in sys.stdin :
   if len (l) <= 1 or '#' in l : continue
   ll = l.split()
   if len (ll) != 2 : exit(1)
   diff = int (ll[0])
   count = int (ll[1])
   if diff not in d : d[diff] = 0
   d[diff] += count

print '%s, %s' % ('Difference', 'Count')
for k in range (min(list(d)), 1 + max(list(d))) :
   v = 0 if k not in d else d[k]
   print '%d, %d' % (k, v)
" > /tmp/script.py

   python /tmp/script.py < $1
}

generate_histogram_causality_diff ()
{
   for i in *.txt; do
      N=`echo "$i" | sed s/.txt$//`
      echo
      echo "# $i:"
      echo '# diff count'
      grep 'dpu: por: stats: <:  *depth diff: ' $i | \
         sed 's/.*diff=count.mass..//' | \
         sed 's!/[^;]*[;}]!!g; s/{//; s/ /\n/g' | \
         sed 's/=/ /' | \
         sed 's/}$//'
   done > /tmp/pairs.txt

   histogram_aggregate /tmp/pairs.txt > histogram-causality.csv

   echo "Done, output is in histogram-causality.csv"
   echo "Fist 15 lines:"
   cat histogram-causality.csv | head -n15 | column -t -s,
   echo ...
}

generate_histogram_conflict_diff ()
{
   for i in *.txt; do
      N=`echo "$i" | sed s/.txt$//`
      echo
      echo "# $i:"
      echo '# diff count'
      grep 'dpu: por: stats: #:  *depth diff' $i | \
         sed 's/.*diff=count.mass...//' | \
         sed 's!/[^;]*[;}]!!g; s/ /\n/g' | \
         sed 's/=/ /' | \
         sed 's/}$//'
   done > /tmp/pairs.txt

   histogram_aggregate /tmp/pairs.txt > histogram-conflict.csv

   echo "Done, output is in histogram-conflict.csv"
   echo "Fist 15 lines:"
   cat histogram-conflict.csv | head -n15 | column -t -s,
   echo ...
}


main ()
{
   h1_date "Generation of the logs for Section 6.2"

   echo 'This is the output of the script ``scripts/run-sec6.1-gen-logs.sh``.'
   echo

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

   h1_date "Generating the histogram of depth differences on causality queries"
   echo ::
   echo
   generate_histogram_causality_diff 2>&1 | quote

   h1_date "Generation the histogram of depth differences on conflcit queries"
   echo ::
   echo
   generate_histogram_conflict_diff 2>&1 | quote

   echo
   echo
   echo ""
   echo "You can view all the outputs of this script this way::"
   echo
   echo "cd $LOGS" | quote
   echo "ls -l *.csv" | quote
   ls -l "$LOGS" | quote
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

