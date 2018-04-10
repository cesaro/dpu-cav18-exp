# dpu-cav18-exp
Experimental results of our CAV'18 paper
1. Assuming you have the following:
- dpu in your $PATH
- valgrind, kcachegrind installed in your machine. If not, please run:
        apt-get install valgrind kcachegrind
- Now you are in experiments/ folder (It is cloned from https://github.com/cesaro/dpu/) where all the stuff to
produce Table 1 in the paper are in cav18/ folder.

2. To evaluate the results shown in Table 1, you should run the experiments with option --callgrind
that brings all profiling information in files named callgrind.out.*

Let us take benchmark cav18/bench/multiprodcon.c for example.
We run dpu on multiprodcon.c with Optimal algorithm (k = 0) and valgrind:
        dpu ./cav18/bench/multiprodcon.c -k 0 --callgrind
Option --callgrind will put performance information in a file of the format callgrind.out.* (* is usually a number).
In our case, I changed it to callgrind.out.mpc for our example.
Open the file with kcachegrind from your terminal by the command:
            kcachegrind callgrind.out.mpc
we will get the screen as follows:
......(Screenshot here)

In left panel, you will see the performance of major functions in descendant order where you are highlighted
at main function by default. The details of selected function (in this case, it is main) are displayed in the right
panel which is devided in two parts: upper one for callers and lower for callees. We here concern the callees.
Look at the graph in the Call Graph tab, we can see the hierachy of calls from main while its performance details
are shown in All Calles tab. Among the major callees, dpu::get_por_analysis() counts for 62.73%, while
dpu::opts::parse(...) does 15.27%, totally take 78% of the run time of dpu::main(...) for executing the program
multiprodcon.c. This supports what we mention in Section 6.4 of the paper about program executing time.

You can easily do the same analysis for the rest of benchmarks.



