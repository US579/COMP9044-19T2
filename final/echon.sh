#!/bin/bash


if  test $# -ne  2
then
    echo "Usage:$0 <number of lines> <string>"
    exit 1
fi

n=$1

if test $1 -gt 0  2>/dev/null
then
    :
else
    echo "$0 must be interger"
    exit 1;
fi





text=$2
f=1;
while test $f -le $n
do
    echo $text
    f=$((f+1))
done

