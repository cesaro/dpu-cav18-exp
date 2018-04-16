#!/bin/bash

# ==== BEGIN CONFIGURATION VARIABLES ====

# 1s = 1 second; 2m = 2 minutes; 3h = 3 hours
TIMEOUT=8m

# ==== END CONFIGURATION VARIABLES ====

# utilitary functions to run benchmarks
source scripts/runlib.sh

compile_bench ()
{
   # setup for Whole Program LLVM
   CC=wllvm
   LLVMVERS=6.0
   export LLVM_COMPILER=clang
   export LLVM_CC_NAME=clang-$LLVMVERS
   export LLVM_CXX_NAME=clang++-$LLVMVERS
   export LLVM_LINK_NAME=llvm-link-$LLVMVERS
   export LLVM_AR_NAME=llvm-ar-$LLVMVERS

   # package mafft 
   MAFFTPROGS="addsingle dndpre makedirectionlist mccaskillwrap pairlocalalign"
   P="$B/debian/mafft-7.123/core/"
   make -C $P $MAFFTPROGS CC=$CC
   for F in $MAFFTPROGS; do
      BC="$F.bc"
      extract-bc "$P/$F" -o "$O/$BC"
   done

   # package blktrace
   P="$B/debian/blktrace-1.0.5/blkiomon"
   make -C $P blkiomon CC=$CC
   extract-bc $P/blkiomon -o "$O/blkiomon.bc"
}

runall_dpu ()
{
   # pre-conditions:
   # $B       - root of the benchmarks folder
   # $TIMEOUT - a timeout specification valid for timeout(1)
   # $DPU     - path to the dpu tool to run

   OPTS='-k0 --mem 350M --stack 2M -O2'
   cp $B/debian/mafft-7.123/test-data/*fasta $O
   cp $B/debian/mafft-7.123/test-data/hat2* $O
   cp $B/debian/mafft-7.123/test-data/hat3* $O
   cp $B/debian/mafft-7.123/test-data/mxscarnamod $O
   cp $B/debian/blktrace-1.0.5/test-data/input*dat $O
   ls -lh $O

   # mafft - addsingle
   N=addsingle
   for n in 2 4 6 8; do
      for s in 3; do
         cp $O/hat2.${s}seq hat2
         cp $O/hat3.${s}seq hat3
         CMD="$DPU $O/$N.bc $OPTS -- $N -C $n -K -i $O/${s}seq.aln.fasta"
         LOG=${N}_threads${n}_seq${s}.log
         run_dpu
      done
   done

   # blktrace - blkiomon
   N=blkiomon
   for x in 5 15 18 20 22 24; do
      for y in 5; do
         LOG=${N}_x${x}_y${y}_input1.log
         CMD="$DPU $O/$N.bc $OPTS -- $N -I 1 -x $x -y $y -i $O/input1.dat"
         run_dpu
      done
   done

   # mafft - dndpre
   N=dndpre
   for x in 2,4 4,2 4,4 6,2; do 
      n=$(echo $x | awk -F, '{print $1}')
      s=$(echo $x | awk -F, '{print $2}')
      CMD="$DPU ${O}/${N}.bc $OPTS -- ${N} -C ${n} -i ${O}/${s}seq.fasta"
      LOG=${N}_threads${1}_seq${2}.log
      run_dpu    
   done

   # mafft - makedirectionlist
   N=makedirectionlist
   for x in 1,4 2,2 2,3 3,2 4,3; do 
      n=$(echo $x | awk -F, '{print $1}')
      s=$(echo $x | awk -F, '{print $2}')
      CMD="$DPU ${O}/${N}.bc $OPTS -- ${N} -m -I 0 -t 0.01 -C ${n} -i ${O}/${s}seq.fasta"
      LOG=${N}_threads${1}_seq${2}.log
      run_dpu    
   done

   # mafft - pairlocalalign
   N=pairlocalalign
   for x in 1,5 2,4 4,3 6,3; do 
      n=$(echo $x | awk -F, '{print $1}')
      s=$(echo $x | awk -F, '{print $2}')
      CMD="$DPU ${O}/${N}.bc $OPTS -- $N -C $n -i ${O}/${s}seq.fasta"
      LOG=${N}_threads${n}_seq${s}.log
      run_dpu
   done
}

test_can_run ()
{
   echo
   echo "$DPU --help"
   $DPU --help
   $DPU --version

   echo
   echo If you see error messages above this line,
   echo then check that you understand what you are doing.
   echo
}

main ()
{
   print_date "Starting the script"
   test_can_run
   compile_bench
   print_date "Running tool DPU"
   runall_dpu
   print_date "Finished"
}

R=$PWD
DPU=$R/dist/dpu/bin/dpu
B=$R/benchmarks
LOGS=$R/sec6.3-table2/logs.$(date +%F_%a_%T)
O=$LOGS

rm -Rf $LOGS
mkdir -p $LOGS
rm -f $R/sec6.3-table2/logs
ln -s $LOGS $R/sec6.3-table2/logs

cd $LOGS

main 2>&1 | tee XXX.log

