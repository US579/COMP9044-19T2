#!/bin/bash

if [ $# == 0 ];
then 
 echo "usage:$0 <attachment>"
fi 

for file in $@
do
  date=`ls -l $file |  awk -F " " '{print $6,$7,$8}'`
  echo $date
  temp="$file.$$"
  echo $temp
  if test -e $temp
  then
      echo "file $temp is exist"
  else
      convert -gravity south -pointsize 36 -draw "text 0,10 '$date'" $file $temp
      touch -r "$file" "$temp"
      mv "$temp"  "$file" 
done
