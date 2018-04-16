#!/bin/bash

source env.sh

echo "Running Maple over SAFE benchmarks"

#echo "Data race detection mode"
#run_many.py --mode race --max 1 --numjobs 1 benchmarks/cav-safe.txt
#run_many.py --mode race --max 1 --numjobs 1 benchmarks/cav-unsafe.txt
#
#rm -rf benchmarks/__results

TO=480

# blktrace - blkiomon
for x in 5 15 18 20 22 24; do
   echo "Running blk(${x})"
   time run_many.py --mode dfs --limit 10000 --numjobs 1 --timelimit ${TO} benchmarks/blkiomon5${x}.txt
   for f in `find benchmarks/__results -type f -name "*blkiomon5${x}*.txt"`; do 
      echo $f
      grep "finished" $f | tail -n1
   done
   echo "#########"
done

# mafft - addsingle
for x in 2,2 4,24 6,720 8,10000 10,10000; do 
   n=$(echo $x | awk -F, '{print $1}')
   s=$(echo $x | awk -F, '{print $2}')
   echo "Running add(${n})"
   time run_many.py --mode random --limit ${s} --numjobs 1 --timelimit ${TO} benchmarks/addsingle3${n}.txt
   for f in `find benchmarks/__results -type f -name "*addsingle3${n}*.txt"`; do 
      echo $f
      grep "finished" $f | tail -n1
   done
   echo "#########"
done

# mafft - dndpre
for x in 2,4,80 4,2,96 4,4,13000 6,2,4320; do 
   n=$(echo $x | awk -F, '{print $1}')
   s=$(echo $x | awk -F, '{print $2}')
   k=$(echo $x | awk -F, '{print $3}')
   echo "Running dnd(${n},${s})"
   time run_many.py --mode random --limit ${k} --numjobs 1 --timelimit ${TO} benchmarks/dndpre${s}${n}.txt
   for f in `find benchmarks/__results -type f -name "*dndpre${s}${n}*.txt"`; do 
      echo $f
      grep "finished" $f | tail -n1
   done
   echo "#########"
done

# mafft - makedirectionlist
for x in 1,4,1 2,2,9 2,3,576 3,2,256 4,3,14000; do 
   n=$(echo $x | awk -F, '{print $1}')
   s=$(echo $x | awk -F, '{print $2}')
   k=$(echo $x | awk -F, '{print $3}')
   echo "Running mdl(${n},${s})"
   time run_many.py --mode random --limit ${k} --numjobs 1 --timelimit ${TO} benchmarks/makedirectionlist${s}${n}.txt
   for f in `find benchmarks/__results -type f -name "*makedirectionlist${s}${n}*.txt"`; do 
      echo $f
      grep "finished" $f | tail -n1
   done
   echo "#########"
done

# mafft - pairlocalalign
for x in 1,5,1 2,4,80 4,3,1368 6,3,4580; do 
   n=$(echo $x | awk -F, '{print $1}')
   s=$(echo $x | awk -F, '{print $2}')
   k=$(echo $x | awk -F, '{print $3}')
   echo "Running pla(${n},${s})"
   time run_many.py --mode random --limit ${k} --numjobs 1 --timelimit ${TO} benchmarks/pairlocalalign${s}${n}.txt
   for f in `find benchmarks/__results -type f -name "*pairlocalalign${s}${n}*.txt"`; do 
      echo $f
      grep "finished" $f | tail -n1
   done
   echo "#########"
done
