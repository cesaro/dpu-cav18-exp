## Reproducing Section 6.2: Fig 3, Tree Depths

Navigation: [Table of contents], [Previous section], [Next section]

[Table of contents]: 1-intro.md#index
[Previous section]: 3-section-6.1.md
[Next section]: 5-section-6.3.md

- The binaries are available in `sec6.2*/dpu-stats-dist`. They ha bee obtained
  using the `config.mk` in that folder. The difference is that we compiled
  the tool with `CONFIG_DETAILED_STATS` enabled.
- making sure we have a good compilation:

```sh
cesar@polaris:~/x/devel/dpu$ ./dist/bin/dpu -V | grep detailed-stats
Features: +detailed-stats 
```

- optional: explaining the output in 1 run

- which benchmarks --> put in a new script
- producing the data


- how many configs?


```
dpu: por: finished POR analysis
dpu: por: stats: unfolding: 2 max-configs
dpu: por: stats: unfolding: 3 threads created
dpu: por: stats: unfolding: 3 process slots used
dpu: por: stats: unfolding: 21 events (aprox. 4K of memory)
dpu: por: stats: unfolding: t0: 7 events (1496B, 33.3%)
dpu: por: stats: unfolding: t1: 7 events (1496B, 33.3%)
dpu: por: stats: unfolding: t2: 7 events (1496B, 33.3%)
dpu: por: stats: unfolding: 5K total allocated memory (251.4 bytes/event)
dpu: por: stats: trees: depths: t0: min/max/avg=0/4/2.43 {depth=count/mass}={4=2/28.6%; 3=2/28.6%; 1=1/14.3%; 0=1/14.3%; (rest)=1/14.3%}
dpu: por: stats: trees: depths: t1: min/max/avg=0/3/1.71 {depth=count/mass}={1=2/28.6%; 3=2/28.6%; 2=2/28.6%; 0=1/14.3%}
dpu: por: stats: trees: depths: t2: min/max/avg=0/3/1.71 {depth=count/mass}={1=2/28.6%; 3=2/28.6%; 2=2/28.6%; 0=1/14.3%}
dpu: por: stats: trees: depths: 0x7f56de7dd010: min/max/avg=0/3/1.50 {depth=count/mass}={1=2/25.0%; 3=2/25.0%; 0=2/25.0%; 2=2/25.0%}
dpu: por: stats: trees: branch-out: t0: size/nc=7/3; min/max/avg=0/2/0.86; {factor=count/mass}={1=4/57.1%; 0=2/28.6%; 2=1/14.3%}
dpu: por: stats: trees: branch-out: t1: size/nc=7/3; min/max/avg=0/2/0.86; {factor=count/mass}={1=4/57.1%; 0=2/28.6%; 2=1/14.3%}
dpu: por: stats: trees: branch-out: t2: size/nc=7/3; min/max/avg=0/2/0.86; {factor=count/mass}={1=4/57.1%; 0=2/28.6%; 2=1/14.3%}
dpu: por: stats: trees: branch-out: 0x7f56de7dd010: size/nc=8/2; min/max/avg=0/1/0.75; {factor=count/mass}={1=6/75.0%; 0=2/25.0%}
dpu: por: stats: events: pthread_create: 2 (9.5%)
dpu: por: stats: events: pthread_join: 2 (9.5%)
dpu: por: stats: events: pthread_mutex_lock: 4 (19.0%)
dpu: por: stats: events: pthread_mutex_unlock: 4 (19.0%)
dpu: por: stats: events: (thread start): 3 (14.3%)
dpu: por: stats: events: pthread_exit: 6 (28.6%)
dpu: por: stats: <: on events:
dpu: por: stats: <:   5 calls
dpu: por: stats: <:   5 trivial (100.0%), solved by null/eq/invdep 5/0/0 checks
dpu: por: stats: <:   0 non-trivial (0.0%)
dpu: por: stats: <: on sequential trees:
dpu: por: stats: <:   max depth: size/nc=0/0; min/max/avg=nan/nan/nan; {depth=count/mass}={}
dpu: por: stats: <:   depth diff: size/nc=0/0; min/max/avg=nan/nan/nan; {diff=count/mass}={}
dpu: por: stats: #: on events (e#e):
dpu: por: stats: #:   0 calls
dpu: por: stats: #:   0 trivial (0.0%), solved by eq/empty 0/0 checks
dpu: por: stats: #:   0 non-trivial (0.0%)
dpu: por: stats: #: on event-config (e#C):
dpu: por: stats: #:   1 calls, all non-trivial
dpu: por: stats: #: on sequential trees:
dpu: por: stats: #:   0 calls
dpu: por: stats: #:   0 trivial (0.0%), solved by eq (depth) checks
dpu: por: stats: #:   0 non-trivial (0.0%)
dpu: por: stats: #:   max depth: size/nc=0/0; min/max/avg=nan/nan/nan; {depth=count/mass}={}
dpu: por: stats: #:   depth diff: size/nc=0/0; min/max/avg=nan/nan/nan; {diff=count/mass}={}
dpu: por: stats: </#: steps: size/nc=0/0; min/max/avg=nan/nan/nan; {steps=count/mass}={}
dpu: por: stats: por: 2 executions
dpu: por: stats: por: 0 SSBs
dpu: por: stats: por: 13.0 average ev/trail
dpu: por: stats: por: alt: 22 calls
dpu: por: stats: por: alt: 4 calls built a comb (18.2%)
dpu: por: stats: por: alt: 4 calls explored a comb (18.2%)
dpu: por: stats: por: |comb|: size/nc=4/1; min/max/avg=1/1/1.00; {size=count/mass}={1=4/100.0%}
dpu: por: stats: por: |comb.spike| (unfilt): size/nc=4/2; min/max/avg=0/1/0.50; {size=count/mass}={0=2/50.0%; 1=2/50.0%}
dpu: por: stats: por: |comb.spike| (filtrd): size/nc=4/2; min/max/avg=0/1/0.50; {size=count/mass}={0=2/50.0%; 1=2/50.0%}
dpu: por: stats: resources: 0.135 s wall time
dpu: por: stats: resources: 0.132 s cpu time
dpu: por: stats: resources: 41M max RSS
dpu: por: stats: perf: 14 executions/sec
dpu: por: stats: perf: 155 ev/sec
dpu: por: summary: 0 defects, 2 max-configs, 0 SSBs, 21 events, 0.135 sec, 41M
```

trees: depths: 3


Claim: The average node depth is 22.7
Claim: 80% of the tree nodes have a maximum depth of less than 8 nodes
Claim: 90% of the tree nodes have a maximum depth of less than 16 nodes

Claim: 92% of the causality queries are for nodes separated by a distance of 1 to 4
Claim: 70% of the causality queries are for nodes separated by a distance of 1 to 2
Claim: 82% of the conflict queries are for nodes separated by a distance of 1 to 4

