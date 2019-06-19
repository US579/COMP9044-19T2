#!/bin/bash

sample="$1"
dir="$2"

wget -q -O- 'https://en.wikipedia.org/wiki/Triple_J_Hottest_100?action=raw'|
while read line
do
    if [[ "$line" =~ (Triple J Hottest 100, )+[0-9]{4} ]]
    then
        temp=`echo "$line" | egrep -o "(Triple J Hottest 100, )+[0-9]{4}"`
        album=`echo "$temp" | sed "s/.*\[\[//;s/\|.*//"`
        echo "$album"
        year=`echo $album | sed 's/.*, //'`
        echo $year
        mkdir -p -m 755 "$dir/Triple J Hottest 100, $year"
    fi
done

