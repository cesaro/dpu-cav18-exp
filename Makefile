
NIDHUGG=tools/nidhugg/nidhugg-375c554fdb208e2c50f35c618ed22cb2096ce4da
DPU=tools/dpu/dpu-0.5.2
MAPLE=tools/maple/sctbench

all:
	@echo Please specify a goal, perhaps read this Makefile to know which one!

install-dependencies:
	# llvm apt sources
	(apt-cache policy | grep 'http://apt.* llvm-toolchain-xenial-6.0/main') || \
		sudo apt-add-repository 'deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-6.0 main'
	sudo apt-get update
	# wget and webfs
	sudo apt-get install ca-certificates wget webfs
	# devel tools
	sudo apt-get install bc git time make python
	# llvm-4.0 (for nidhugg)
	sudo apt-get install clang-4.0 llvm-4.0-dev python3 libffi-dev
	# llvm-6.0 (for dpu)
	sudo apt-get install clang-6.0
	sudo apt-get install llvm-6.0-dev
	sudo apt-get install zlib1g-dev
	sudo apt-get install libncurses5-dev
	# valgrind (profiling experiments)
	sudo apt-get install valgrind
	sudo apt-get install kcachegrind
	# maple dependencies
	sudo apt-get install libprotobuf-dev 
	sudo apt-get install protobuf-compiler
	sudo apt-get install python-protobuf 
	sudo apt-get install build-essential 
	sudo apt-get install ipython 
	sudo apt-get install m4 
	sudo apt-get install cmake 

compile-nidhugg:
	rm -Rf $(NIDHUGG)
	cd tools/nidhugg/; unzip nidhugg-*.zip
	cd $(NIDHUGG); autoreconf --install
	cd $(NIDHUGG); ./configure --with-llvm=/usr/lib/llvm-4.0/ --prefix=$(PWD)/dist/nidhugg
	cd $(NIDHUGG); make -j 10
	cd $(NIDHUGG); make install

compile-dpu:
	rm -Rf $(DPU)
	cd tools/dpu/; unzip dpu-*.zip
	cd $(DPU); make dist -j 10
	$(DPU)/dist/bin/dpu --version | head -n1
	cp -Rv $(DPU)/dist dist/dpu

sec6.1-table1:
	./scripts/run-table1.sh

sec6.2-compile-dpu:
	rm -Rf $(DPU)
	cd tools/dpu/; unzip dpu-*.zip
	cp sec6.2-fig3-trees/config.mk $(DPU)
	cd $(DPU); make dist -j 10
	cp -Rv $(DPU)/dist dist/dpu-tree-stats
	dist/dpu-tree-stats/bin/dpu --version | grep detailed-stats

sec6.2-gen-csv:
	./scripts/run-sec6.2-gen-csv.sh

sha1sums:
	echo FIXME

.PHONY: sec6.1-table1
