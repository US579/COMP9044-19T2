#!/bin/bash



if test $# -ne 2
then
    echo "Usage:$0 <><>"
    exit 1
fi


if test $1 -gt 0  2>/dev/null
then
    :
else
    echo $1
    exit 1
fi
f=0;
while test $f -lt $1
do
    echo $2
    f=$((f+1))
done
