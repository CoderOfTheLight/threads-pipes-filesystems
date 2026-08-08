# Threads, pipes, filesystems

[![build](https://github.com/CoderOfTheLight/threads-pipes-filesystems/actions/workflows/build.yml/badge.svg)](https://github.com/CoderOfTheLight/threads-pipes-filesystems/actions/workflows/build.yml)

Systems programming in C from Auburn's graduate Advanced Operating Systems
course (COMP 7500, Spring 2021), preserved with its original semester-long
commit history.

![pwordcount, cpmFS, and AUbatch compiled and run in a terminal](docs/demo.gif)

*The demo is recorded by [CI](.github/workflows/demo.yml), so everything in
it is the real code running: pwordcount handing a file across two pipes,
cpmFS listing, deleting, and renaming files on a disk image, and AUbatch
taking live job submissions before reporting its scheduling metrics.*

## The projects

| Project | What it is | Core ideas |
|---|---|---|
| [`pwordcount/`](pwordcount/) | Two-process word-count tool | `fork`, two unidirectional pipes, IPC |
| [`aubatch/`](aubatch/) | Pthread-based batch-job scheduler | producer/consumer threads, mutex + condition variables, FCFS / SJF / priority policies, throughput and latency metrics |
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

That split is also why there is deliberately no blanket open-source license
here: the scaffolding is Dr. Qin's course material and is not mine to
relicense. The repository is published for reading and evaluation.

## Building

Each project builds with `make` in its directory on Linux (glibc + GCC);
CI builds all three on every push and drives AUbatch through an
[end-to-end scheduling test](aubatch/test.sh). The code is otherwise as submitted in
2021, apart from three small fixes made while preparing this archive:
AUbatch's shared globals are declared `extern` in the header and defined
once (GCC 10's `-fno-common` default requires that to link), cpmFS's
free-list initializer no longer overruns its array, and AUbatch's `quit`
no longer reads an argument that was never typed.
