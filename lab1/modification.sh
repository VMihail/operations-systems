#!bin/bash
subStr () # arg = string
{
        local str=$1
        local len=${#str}
        if [[ $len -lt 6 ]]
        then
                echo $str
                return
        fi
        let "i = $len - 3"
        echo ${str:0:3}${str:$i}
}

while IFS= read -r line
do
        subStr $line
done < $1
