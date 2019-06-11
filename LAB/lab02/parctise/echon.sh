#!bin/bash

if [[ $# != 2 ]]
then
    echo "$0 <error1>"
fi

if !(echo $1 | egrep ^[[:digit:]+]) 1>/dev/null
then
    echo "$0 <error2>"
fi


for((i=0;i<$1;i++))
do
    echo "$2"
done

