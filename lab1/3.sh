#!bin/bash
echo "enter 1 to run nano"
echo "enter 2 to run vi"
echo "enter 3 to run links"
echo "enter 4 to exit"
read command
if [[ command -eq 1 ]]
then
        nano
elif [[ command -eq 2 ]]
then
        vi
elif [[ command -eq 3 ]]
then
        links
elif [[ command -eq 4 ]]
then
        exit
else
        echo "Unknow command"
fi
