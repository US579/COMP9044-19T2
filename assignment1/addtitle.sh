#!/bin/bash


n='echo -en "\e[35mTESTS FINISHED\\n\e[0m"'
# echo "$n" >> test07.sh
for file in `ls | grep "test*"`
do
    echo "$n" >> $file
# sed -i '' -e '2i \
# #written by Wanze Liu z5137189' $file
done
