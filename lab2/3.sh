#!bin/bash
ps -o pid,stime | sort | tail -1 | awk '{print $1}'
