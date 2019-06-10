#!/bin/bash

for file in *
do
   flag=`wc -l < $file`
   if test $flag -lt 10 
   then
      small="$small $file"
   elif test $flag -gt 100
   then
      large="$large $file"
   else
      medium="$medium $file"
   fi
done

echo "Small files: $small"
echo "Medium-sized files: $medium"
echo "Large files: $large"
exit 0
