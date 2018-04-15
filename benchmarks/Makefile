SCRIPTSDIR=../scripts

.PHONY : table1 table2

all :
	@echo 'Error: Read the Makefile and choose a target! :)'

table1 :
	$(SCRIPTSDIR)/run-table1.sh
table2 :
	$(SCRIPTSDIR)/run-table2-dpu.sh
table3 :
	$(SCRIPTSDIR)/runtable3.sh

nohup1 :
	nohup $(SCRIPTSDIR)/run-table1.sh > nohup.out 2>&1 &
nohup2 :
	nohup $(SCRIPTSDIR)/run-table2-dpu.sh > nohup.out 2>&1 &
nohup12 :
	nohup bash -c '$(SCRIPTSDIR)run-table1.sh; $(SCRIPTSDIR)/run-table2-dpu.sh' > nohup.out 2>&1 &

clean :
	rm -Rf table1/log*
	rm -Rf table2/log*
	rm -Rf table3/log*
