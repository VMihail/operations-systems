#!/bin/bash
echo $$ > .pid

term()
{
        echo "Handler: Signal from Generator is 'TERM' -> Finish work"
        exit 0
}

add()
{
        operation="add"
}

multiply()
{
        operation="multiply"
}

sub()
{
        operation="sub"
}

div()
{
        operation="div"
}

operation="add"
answer = 1

trap 'term' SIGTERM
trap 'add' USR1
trap 'multiply' USR2
trap 'sub' SIGQUIT
trap 'div' SIGPWR

while true
do
        echo "Handler: Current operation is $operation"
        case $operation in
        "add")
        let answer=$answer+2
        ;;
        "multiply")
        let answer=$answer*2
        ;;
        "sub")
        let answer=$answer-2
        ;;
        "div")
        let answer=$answer/2
        ;;
        esac
        echo "Handler: Current answer is $answer"
        sleep 1
done
