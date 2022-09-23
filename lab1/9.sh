#!bin/bash
wc /var/log/*.log > output.txt
awk '{print $2}' output.txt | tail -1
rm output.txt
