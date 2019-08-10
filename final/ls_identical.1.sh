#!/bin/sh

dir1=$1
dir2=$2

for file in "$1/*"
do
    if test -e "$dir2/$file"
    then 
        echo "$file"
        if diff "$1/$file" "$2/$file"
        then
            echo "$file"
        fi
    fi
done


