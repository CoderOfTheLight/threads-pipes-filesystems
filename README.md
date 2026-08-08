# Advanced Operating Systems — COMP 7500, Auburn University (Spring 2021)

[![build](https://github.com/CoderOfTheLight/AU-CS7500-AdvancedOS/actions/workflows/build.yml/badge.svg)](https://github.com/CoderOfTheLight/AU-CS7500-AdvancedOS/actions/workflows/build.yml)

Systems programming in C from Auburn's graduate Advanced Operating Systems
course, preserved with its original semester-long commit history.

| Project | What it is | Core ideas |
|---|---|---|
| [`pwordcount/`](pwordcount/) | Two-process word-count tool | `fork`, two unidirectional pipes, IPC |
| [`aubatch/`](aubatch/) | Pthread-based batch-job scheduler | producer/consumer threads, mutex + condition variables, FCFS / SJF / priority scheduling, throughput and latency metrics |
| [`cpmfs/`](cpmfs/) | CP/M-style file system over a disk-image simulator | on-disk directory extents, free-block accounting, 8.3 filenames |

Each project directory has its own README, the original project report as
submitted (PDF, under `docs/`), and a data-flow diagram where I drew one.

## Authorship

All project code here was written by me, Hannah Stroble — source headers and
the 2021 commits carry my earlier name, Hannah Reinbolt. Dr. Xiao Qin
provided assignment scaffolding, credited in the file headers and split out
precisely in each project README. In short: the AUbatch command parser grew
out of his OS/161-derived sample, and cpmFS's disk simulator and test driver
are his handouts; the scheduler, the scheduling policies, the metrics, and
the file-system implementation are mine.

## Building

Each project builds with `make` in its directory on Linux (glibc + GCC);
CI builds all three on every push. The code is otherwise as submitted in
2021, apart from three small fixes made while preparing this archive:
AUbatch's shared globals are declared `extern` in the header and defined
once (GCC 10's `-fno-common` default requires that to link), cpmFS's
free-list initializer no longer overruns its array, and AUbatch's `quit`
no longer reads an argument that was never typed.
