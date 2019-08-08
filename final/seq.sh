#!/bin/dash

if test $# -eq 1
then
    start=1
    end=$1
    flag=1
elif test  $# -eq 2 
then
    start=$1
    end=$2
    flag=2
else
    start=$1
    step=$2
    end=$3
    flag=3
fi


while ((start <= end))
do 
    echo "$start"
    if test  $flag == 1 
    then 
        start=$((start+1))
    elif ((flag == 2))
    then 
        start=$((start+1))
    else
        start=$((start+step))
    fi
done






