#!/bin/bash

start=$1 
last=$2
filename=$3

while test $start -le $last
do
    echo $start 
    echo "$start" >> $3
    start=$((start+1))
done
