#!/bin/bash

for i in *.htm
do
    if test -e "$i"l
    then 
       echo "$i exists"
       exit 1;
    fi
    name="$i"l
    mv "$i" "$name"
done 
