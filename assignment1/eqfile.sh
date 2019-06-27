#!/bin/sh


file1=$1
file2=$2

if ( diff $file1  $file2 )
then
    echo "same"
else
    echo "different"
fi


