SCRIPTSDIR=../scripts

.PHONY : table1 table2

all :
	@echo 'Error: Read the Makefile and choose a target! :)'

table1 :
	$(SCRIPTSDIR)/runtable1.sh
table2 :
	$(SCRIPTSDIR)/runtable2.sh
table3 :
	$(SCRIPTSDIR)/runtable3.sh

nohup1 :
	nohup $(SCRIPTSDIR)/runtable1.sh > nohup.out 2>&1 &
nohup2 :
	nohup $(SCRIPTSDIR)/runtable2.sh > nohup.out 2>&1 &
nohup12 :
	nohup bash -c '$(SCRIPTSDIR)runtable1.sh; $(SCRIPTSDIR)/runtable2.sh' > nohup.out 2>&1 &

clean :
	rm -Rf table1/log*
	rm -Rf table2/log*
	rm -Rf table3/log*
