#!/bin/bash

source env.sh

echo "Running Maple over SAFE benchmarks"
run_many.py --mode dfs --limit 1000 --timelimit 480 benchmarks/cav-safe.txt

echo "Running Maple over UNSAFE benchmarks"
run_many.py --mode random --limit 1000 --timelimit 480 benchmarks/cav-unsafe.txt
