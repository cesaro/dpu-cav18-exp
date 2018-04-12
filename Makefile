

DIST=$(PWD)/dist
NIDHUGG=tools/nidhugg/nidhugg-375c554fdb208e2c50f35c618ed22cb2096ce4da
NIDHUGG=tools/dpu/dpu-375c554fdb208e2c50f35c618ed22cb2096ce4da

install-dependencies:
	# llvm apt sources
	(apt-cache policy | grep 'http://apt.* llvm-toolchain-xenial-6.0/main') || \
		sudo apt-add-repository 'deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-6.0 main'
	sudo apt-get update
	# wget
	sudo apt-get install ca-certificates wget
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

compile-nidhugg:
	rm -Rf $(NIDHUGG)
	cd tools/nidhugg/; unzip nidhugg-*.zip
	cd $(NIDHUGG); autoreconf --install
	cd $(NIDHUGG); ./configure --with-llvm=/usr/lib/llvm-4.0/ --prefix=$(DIST)
	cd $(NIDHUGG); make -j 6

install-nidhugg:
	cd $(NIDHUGG); make install

compile-dpu:
install-dpu:
