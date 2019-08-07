#!/bin/bash

for i in $@
do
    for name in `cat $i | egrep "#include"`
    do
        if ( echo $name | egrep ".h" | egrep -v "<.*>") > /dev/null
        then
        filename=`echo $name | egrep ".h" | egrep -v "<.*>" | sed "s/\"//g"`
#        echo $filename
            if [ -e "$filename" ]
            then 
                echo "$filename include in $i does not exist"
            fi
        fi
    done

    #echo $i
done

