#!/bin/sh
# End-to-end test: drives the built scheduler through a real SJF run and
# checks queue ordering, the metrics report, and a clean exit.
# Requires ./aubatch and ./micro to be built first (see README).
set -e
cd "$(dirname "$0")"

# submit three jobs out of shortest-job order, list the queue, then quit
out=$(printf 'sjf\nrun ./micro 5 1\nrun ./micro 2 1\nrun ./micro 1 1\nlist\nquit\n' | ./aubatch)
echo "$out"

# job0 (5s) was already dispatched and keeps the queue head; sjf must
# re-sort the waiting jobs by remaining time: job2 (1s) ahead of job1 (2s)
names=$(echo "$out" | grep -A3 'CPU_Time' | awk 'NR>1 {print $1}' | tr '\n' ' ')
echo "queue order: $names"
case "$names" in
  "job0 job2 job1 "*) ;;
  *) echo "FAIL: expected SJF queue order job0 job2 job1"; exit 1 ;;
esac

# quit must have drained the queue and reported on exactly the three jobs
echo "$out" | grep -q 'Total number of jobs submitted: 3'
echo "$out" | grep -q 'Average CPU time: 2.667 seconds'

echo "PASS"
