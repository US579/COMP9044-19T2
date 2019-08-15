#!/bin/bash

for i in $@
do
    name=`cat $i | egrep "#include \".*\"" | cut -d"\"" -f2`
    for j in $name
    do
    if ! test -e "$j"
    then
        echo "$j included into $i does not exist"
    fi
    done
done

