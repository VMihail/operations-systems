#!bin/bash
outputFileName="5.out"
if [[ -e $outputFileName ]]
then
        $(rm $outputFileName)
fi
ppidNow=0
countChild=0
sumArt=0
while IFS= read -r line
do
        pid=$(echo $line | awk '{print $7}')
        art=$(echo $line | awk '{print $11}')
        if [[ $ppidNow -eq $pid ]]
        then
                countChild=$(($countChild+1))
                art=$(echo $art $sumArt | awk '{print($1+$2)}')
                echo $line >> $outputFileName
        else
                avg=$(echo $art $countChild | awk '{print($1/$2)}')
                echo "Average_Running_Children_of_ParentID=$ppidNow is $avg" >> $outputFileName
                countChild=1
                sumArt=$art
                ppidNow=$pid
                echo $line >> $outputFileName
        fi
done < $1
