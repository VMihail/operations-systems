#!bin/bash
result=$1
if [[ $2 -ge $3 && $2 -ge $1 ]]
then
        result=$2
fi
if [[ $3 -ge $2 && $3 -ge $1 ]]
then
        result=$3
fi
echo "$result"
