#!/bin/bash




small="samll: "
medium="medium: "
large="large: "
for i in *
do
    size=`cat $i | wc -l`
    if test $size -lt 10
    then
        small="$small $i"
        continue
    elif test $size -lt 100
    then
        medium="$medium $i"
        continue
    else
        large="$large $i"
    fi
done


echo $small
echo $medium
echo $large
