#!/bin/bash

for file in *.htm
do
   name="$file"l
   if test -e "$name"
   then 
      echo "$name exists" 
      exit 1
   fi 
   mv "$file" "$name" 
done
