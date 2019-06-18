#!/bin/bash

suffix=".png"
for file in *.jpg
do
   name=`echo $file | cut -d"." -f1`
   png=$name$suffix
   if test -e "$png"
   then 
     echo "$png already exists"
     exit 1
   else
     convert "$file" "$png" && rm "$file"
   fi
done
