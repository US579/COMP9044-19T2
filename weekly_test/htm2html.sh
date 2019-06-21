#!/bin/bash

for file in *.htm
do 
   name=`echo  $file | sed "s/\..*//"`
   if test -e "$name.html"
   then 
      echo "$name.html exists" 
      exit 1
   fi 
   mv "$file" "$name.html" 
done
