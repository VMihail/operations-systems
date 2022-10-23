#!bin/bash
ps -U root -o pid,cmd | sed -r "s/\s*([0-9]+)\s(.+)$/\1:\2/" > 1.out
wc -l 1.out
