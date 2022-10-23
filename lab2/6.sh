#!bin/bash
resultPid=""
maxMem=0
for pid in $(ps aux | awk '{print $2}')
do
        statusPath=/proc/$pid/status
        if [[ ! -e $statusPath ]]
        then
                echo "File not found $statusPath or $schedPath"
                continue
        fi
        mem=$(grep "VmSize" /proc/$pid/status | awk '{print $2}')
        if [[ $mem -ge $maxMem ]] # -ge if start value of result is -1
        then
                resultPid=$pid
                maxMem=$mem
        fi
done

echo "$pid $maxMem"
