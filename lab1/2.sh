#!bin/bash
next=""
result=""
read next
while [["$next" != "q" ]]
do
        result+="$next"
        read next
done
echo "$result"
