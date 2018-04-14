
DIST=$(PWD)/dist
NIDHUGG=tools/nidhugg/nidhugg-375c554fdb208e2c50f35c618ed22cb2096ce4da
DPU=tools/dpu/dpu-0.5.2

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

compile-nidhugg:
	rm -Rf $(NIDHUGG)
	cd tools/nidhugg/; unzip nidhugg-*.zip
	cd $(NIDHUGG); autoreconf --install
	cd $(NIDHUGG); ./configure --with-llvm=/usr/lib/llvm-4.0/ --prefix=$(DIST)
	cd $(NIDHUGG); make -j 10

compile-dpu:
	rm -Rf $(DPU)
	cd tools/dpu/; unzip dpu-*.zip
	cd $(DPU); make dist -j 10
	$(DPU)/dist/bin/dpu --version | head -n1

install-nidhugg:
	cd $(NIDHUGG); make install

install-dpu:
	cp -R $(DPU)/dist/* $(DIST)

sec6.2-compile-dpu:
	rm -Rf $(DPU)
	cd tools/dpu/; unzip dpu-*.zip
	cp sec6.2-fig3-trees/config.mk $(DPU)
	cd $(DPU); make dist -j 10
	$(DPU)/dist/bin/dpu -V | grep detailed-stats
	cp -Rv $(DPU)/dist sec6.2-fig3-trees/dpu-stats-dist

sec6.2-gen-csv:
	./scripts/run-sec6.2-gen-csv.sh
