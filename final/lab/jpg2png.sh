#!/bin/sh


for i in *.jpg
do
    echo $i
    name=`echo $i | cut -d"." -f1`
    name="$name".png
    if test -e $name
    then 
        echo "$name already exists"
        exit 1;
    fi
    convert "$i" "$name" && rm $i
done
