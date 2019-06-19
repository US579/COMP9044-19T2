#!/bin/bash

sample="$1"
dir="$2"

wget -q -O- 'https://en.wikipedia.org/wiki/Triple_J_Hottest_100?action=raw'|
while read line
do
    if [[ "$line" =~ (Triple J Hottest 100, )+[0-9]{4} ]]
    then
        echo "$line"
    fi
done
