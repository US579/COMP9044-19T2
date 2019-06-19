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
        year=`echo $album | sed 's/.*, //'`
        #mkdir -p -m 755 "$dir/Triple J Hottest 100, $year"
    fi
    time=1
    while read line && test $time -lt 10
    do
        if !([[ "$line" =~ ^# ]])
        then
            continue
        else
            temp=`echo "$line" |sed "s/[^[]*//" | tr -d '[]"#'`

        fi

done
done

