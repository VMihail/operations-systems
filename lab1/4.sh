#!bin/bash
if [[ "$PWD" == "$HOME" ]]
then
        echo "$HOME"
        exit 0
else
        echo "The script is not running from the home directory"
        exit 1
fi
