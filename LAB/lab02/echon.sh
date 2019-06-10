#!/bin/bash
num=$1
str=$2

if ( test "$#" != 2 );
then 
   echo "Usage: "$0" <number of lines> <string>"
   exit 1
fi 

if !( echo "$1" | egrep ^[[:digit:]]+) 1>/dev/null;
then
   echo "$0": argument 1 must be a non-negative integer
   exit 1
fi

for((i=0;i<$num;i++));
do 
   echo $str
done

