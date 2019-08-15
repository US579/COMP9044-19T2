#!/bin/bash


for i in "$1"/*
do
    if  diff "$i" "$2" > /dev/null 2>&1
    then
        basename  "$i"
    fi
done



