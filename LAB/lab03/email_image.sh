#!/bin/bash


if [ $# == 0 ];
then 
   echo "usage:$0 <attachment>"
fi

for file in $@
do
   echo 'Address to e-mail this image to?'
   read addr
   echo 'Message to accompany image?'
   read message
   name=`echo $file | sed "s/\.jpg//"`
   echo "$message" | mutt -s "$name!" -e 'set copy=no' -a "$file" -- "$addr"
   echo ---------------------------------
   echo "$file has been sent to the $addr"
   echo ---------------------------------
done


