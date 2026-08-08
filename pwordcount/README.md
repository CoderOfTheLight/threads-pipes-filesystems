# pwordcount — a two-process pipe word counter

A word-count utility split across two processes that communicate over a
pair of unidirectional pipes, ~200 lines of C.
COMP 7500 Project 2 (February 2021).

## How it works

```
./pwordcount <file>
```

1. The parent process reads the file into a buffer and writes it into
   pipe 1.
2. The child process reads pipe 1, counts words by scanning for
   whitespace separators, and writes the count into pipe 2.
3. The parent reads the result back from pipe 2 and prints it.

Each process closes the pipe ends it does not use, and the tool prints a
trace of each step so the IPC hand-off is visible:

```
Process 1 is reading file "input.txt" now ...
Process 1 starts sending data to Process 2 ...
Process 2 finishes receiving data from Process 1 ...
Process 2 is counting words now ...
Process 2 is sending the result back to Process 1 ...
Process 1: The total number of words is 8.
```

## Build

```
make
./pwordcount input.txt
```

Files up to 10,000 characters are supported (a static buffer, permitted
by the assignment). [helper.c](helper.c) holds the counting and
error-reporting helpers. The original write-up is in
[docs/project-report.pdf](docs/project-report.pdf).
