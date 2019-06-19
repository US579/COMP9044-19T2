#!/bin/bash

sample="$1"
dir="$2"

wget -q -O- 'https://en.wikipedia.org/wiki/Triple_J_Hottest_100?action=raw'|
while read line
do   
    if [[ "$line" =~ (Triple J Hottest 100, )+[0-9]{4} ]]
    then
        echo "$line"
        temp=`echo "$line" | egrep -o "(Triple J Hottest 100, )+[0-9]{4}"`
        album=`echo "$temp" | sed "s/.*\[\[//;s/\|.*//"`
        year=`echo $album | sed 's/.*, //'`
        echo "$year"
        mkdir -p -m 755 "$inter"
    fi
    time=1
    while read line && test $time -le 10
    do
        if !([[ "$line" =~ ^# ]])
        then
            continue
        fi
            tem=`echo "$line" |sed "s/[^[]*//" | tr -d '[]"#'`
  #          echo "$tem"
            artist=`echo "$tem" | sed 's/–.*//' | sed "s/^[ ]*//;s/[ ]*$//"`
            title=`echo "$tem" | sed 's/.*–//'| sed "s/^[ ]*//;s/[ ]*$//"`
#            echo "$artist"
 #           echo "$title"
            file="$inter/$time - $title - $artist.mp3"
#            cp -p "$sample" "$file"
            time=$(( time + 1 ))    
    done
done

