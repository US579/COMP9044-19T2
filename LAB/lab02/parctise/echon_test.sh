#!/bin/bash

if [[ $# != 2 ]]
then
    echo "useage: $0 <int> <string>"
    exit
fi

if !(echo "$1" | egrep ^[[:digit:]]) >/dev/null
then
    echo "$0": argument 1 must be a non-negative integer
    exit
fi

for ((i=0;i<$1;i++))
do
    echo "$2"
done




