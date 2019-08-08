#!/bin/bash

for i in  *
do
    if cat $i | egrep "<blink>" > /dev/null
    then 
        if [ "$i" == "$0" ]
        then 
            echo $i
        fi

    fi
done
