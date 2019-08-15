#!/bin/sh


small="Small files: "
medium="Medium-sized files: "
large="Large files: "

for i in *
do
    line=`cat $i | wc -l`
    if test $line -lt 10
    then
        small="$small $i"
    elif test $line -gt 100
    then
        large="$large $i"
    else
        medium="$medium $i"
    fi
done

echo $small
echo $medium
echo $large
