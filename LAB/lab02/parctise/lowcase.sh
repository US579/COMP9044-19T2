#!/bin/bash

for file in * 
do 
    lowercasefile=$(echo $file | tr A-Z a-z)
    mv $file $lowercasefile
done 
