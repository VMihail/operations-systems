#!bin/bash
result=""
for pid in $(ps aux | awk '{print $2}')
do
        statusPath=/proc/$pid/status
        schedPath=/proc/$pid/sched
        if [[ ! -e $statusPath || ! -e $schedPath ]]
        then
                echo "File not found $statusPath or $schedPath"
                continue
        fi
        ppid=$(cat $statusPath | grep "PPid" | awk '{print $2}')
        runtime=$(cat $schedPath | grep "se.sum_exec_runtime" | awk '{print $3}')
        switches=$(grep "^nr_switches" $schedPath | awk '{print $3}')
        if [[ $switches -eq 0 || -z $switches ]]
        then
                continue
        fi
        art=$(echo "$runtime/$switches" | bc -l)
        result="$result$pid $ppid $art"$'\n'
done

sort -n --key=2 <<< "${result%?}" | awk '{print "ProcessID = " $1 " : " "Parent_ProcessID = " $2 " : " "ART = " $3 }' > $"4.out"
