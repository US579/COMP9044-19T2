#!/bin/bash


if  test $# -ne  2
then
    echo "Usage:$0 <number of lines> <string>"
    exit 1
fi

n=$1
if 



text=$2
f=1;
while test $f -le $n
do
    echo $text
    f=$((f+1))
done

