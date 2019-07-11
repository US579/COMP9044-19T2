#!/bin/bash



for file in `ls | grep "legit-*"`
do
    echo $file
sed -i '' -e '2i \
#written by Wanze Liu z5137189' $file
done
