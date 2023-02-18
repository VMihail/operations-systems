#!/bin/bash
bash for4.sh &
firstPid=$!
bash for4.sh &
secondPid=$!
bash for4.sh &
thirdPid=$!
echo "$firstPid $secondPid $thirdPid"
sleep 5
cpulimit -p $firstPid -l 10 &
sleep 5
kill $thirdPid
sleep 5
kill $firstPid
kill $secondPid
