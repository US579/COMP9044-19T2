#!/bin/bash


for i in *.htm
do
    if  test -e  "$i"l
    then 
        echo $i'l exists' 
        exit 1;
    fi
    name="$i"l
    mv "$i" "$name" >/dev/null  2>&1
done
