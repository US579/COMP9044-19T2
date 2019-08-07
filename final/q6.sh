#!/bin/dash

while read line 
do
    echo $line | tr ".[0-4]+[0-9]*"  ""
done
