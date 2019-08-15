#!/bin/sh

if test $# -eq 0
then 
    echo "Usage:$0 <number of  lines> <string>"
    exit 1
fi


if test $# -gt 2
then 
    echo "Usage:$0 <number of  lines> <string>"
    exit 1
fi




num=$1
word=$2

if ( echo $num | egrep  -v "^[0-9]+$") >/dev/null
then 
    echo "$0: argument 1 must be a non-negative integer"
    exit 1
fi





k=0
while test $k -lt $num
do
    echo $word
    k=$((k+1))
done
