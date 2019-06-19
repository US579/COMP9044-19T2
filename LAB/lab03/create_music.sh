#!/bin/bash

sample="$1"
dir="$2"

wget -q -O- 'https://en.wikipedia.org/wiki/Triple_J_Hottest_100?action=raw'|
while read line
do   
    if !([[ "$line" =~ (Triple J Hottest 100, )+[0-9]{4} ]])
    then
        continue
    fi
        echo "qweqweqweqweqweqwe"
        echo "$line"
        temp=`echo "$line" | egrep -o "(Triple J Hottest 100, )+[0-9]{4}"`
        album=`echo "$temp" | sed "s/.*\[\[//;s/\|.*//"`
        year=`echo $album | sed 's/.*, //'`
        fil="$2/Triple J Hottest 100, $year"
        echo "$year"
        mkdir -p -m 755 "$dir/Triple J Hottest 100, $year"
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
        echo "$artist"
 #           echo "$title"
        file="$fil/$time - $title - $artist.mp3"
        cp -p "$sample" "$file"
        time=$(( time + 1 ))    
    done
done

