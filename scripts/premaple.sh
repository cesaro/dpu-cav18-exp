#!/bin/bash

R=../benchmarks
O=../tools/maple/sctbench/benchmarks/cav18/obj
D="$O/test-data"
E="$O/bin"
CC=gcc
OUTS=../tools/maple/sctbench/benchmarks/cav18/cav-safe.txt
OUTU=../tools/maple/sctbench/benchmarks/cav18/cav-unsafe.txt

echo "populating $D ..."
mkdir -p "$D"

cp $R/debian/mafft-7.123/test-data/*fasta $D
cp $R/debian/mafft-7.123/test-data/hat2* $D
cp $R/debian/mafft-7.123/test-data/hat3* $D
cp $R/debian/mafft-7.123/test-data/mxscarnamod $D
cp $R/debian/blktrace-1.0.5/test-data/input*dat $D

echo "Compiling benchmarks for MAPLE ..."

# package mafft 
MAFFTPROGS="addsingle dndpre makedirectionlist pairlocalalign"
PMAF="$R/debian/mafft-7.123/core/"
make -C $PMAF $MAFFTPROGS CC=$CC

# package blktrace
PBLK="$R/debian/blktrace-1.0.5/blkiomon"
make -C $PBLK blkiomon CC=$CC

echo "populating $E ..."
mkdir -p "$E"

for F in $MAFFTPROGS; do
   cp "$PMAF/$F" "$E/$F.x"
done

cp "$PBLK/blkiomon" "$E/blkiomon.x"

ls -lh $E

echo "Generating benchmark instances ... "
if [ -f $OUTS ] ; then
    rm $OUTS
fi
if [ -f $OUTU ] ; then
    rm $OUTU
fi

# mafft - addsingle
N=addsingle
for n in $(seq 2 2 10); do
   for s in 3; do
      P="$O/$N$s$n/run"
      mkdir -p "$P" 
      cp "$E/$N.x" "$P/$N$s$n.x" 
      cp $D/hat2.${s}seq "$P/hat2"
      cp $D/hat3.${s}seq "$P/hat3"
      cp $D/${s}seq.aln.fasta $P
      echo "cav18 $N$s$n 0 0 -C $n -K -i ${s}seq.aln.fasta" >> $OUTU
   done
done

# blktrace - blkiomon
N=blkiomon
for n in 5 15 18 20 22 24; do
   for s in 5; do
      P="$O/$N$s$n/run"
      mkdir -p "$P" 
      cp "$E/$N.x" "$P/$N$s$n.x" 
      cp $D/input1.dat $P
      echo "cav18 $N$s$n 0 0 -I 1 -x $n -y $s -i input1.dat" >> $OUTS
   done
done

# mafft - dndpre
N=dndpre
for x in 2,4 4,2 4,4 6,2; do 
   n=$(echo $x | awk -F, '{print $1}')
   s=$(echo $x | awk -F, '{print $2}')
   P="$O/$N$s$n/run"
   mkdir -p "$P" 
   cp "$E/$N.x" "$P/$N$s$n.x" 
   cp $D/${s}seq.fasta $P
   echo "cav18 $N$s$n 0 0 -C $n -i ${s}seq.fasta" >> $OUTU
done

# mafft - makedirectionlist
N=makedirectionlist
for x in 1,4 2,2 2,3 3,2 4,3; do 
   n=$(echo $x | awk -F, '{print $1}')
   s=$(echo $x | awk -F, '{print $2}')
   P="$O/$N$s$n/run"
   mkdir -p "$P" 
   cp "$E/$N.x" "$P/$N$s$n.x" 
   cp $D/${s}seq.fasta $P
   echo "cav18 $N$s$n 0 0 -m -I 0 -t 0.01 -C $n -i ${s}seq.fasta" >> $OUTU
done

# mafft - pairlocalalign
N=pairlocalalign
for x in 1,5 2,4 4,3 6,3; do 
   n=$(echo $x | awk -F, '{print $1}')
   s=$(echo $x | awk -F, '{print $2}')
   P="$O/$N$s$n/run"
   mkdir -p "$P" 
   cp "$E/$N.x" "$P/$N$s$n.x" 
   cp $D/${s}seq.fasta $P
   echo "cav18 $N$s$n 0 0 -C $n -i ${s}seq.fasta" >> $OUTU
done
