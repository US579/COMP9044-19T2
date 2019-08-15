#!/bin/sh

file=$1

name=".$1."
if ! test -e ".$1.0"
then
    cp "$file" "$name"0
else
    lis=""
    for i in `ls -a | egrep "\.$1\."`
        do
            num=`echo $i | sed "s/.*\.//"`
            lis="$lis $num"    
            echo $lis 
        done
    maxx=`echo $lis | tr " " "\n" | sort | tail -1`
    echo $maxx
    maxx=$((maxx+1))
    echo $name$maxx 
    cp "$file" "$name$maxx"
fi 
