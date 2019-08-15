#!/bin/bash

if test  $# -ne 3 
then 
    echo "Usage: $0 <digit> <digit> <file>"
    exit 1;
fi

first=$1

while test $first -le $2
do
    echo "$first" >> $3
    first=$((first+1))
done




