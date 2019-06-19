#!/bin/bash


if [ $# == 0 ];
then 
   echo "usage:$0 <attachment>"
fi

for file in $@
do
   read -p 'Address to e-mail this image to? '  addr
   read -p  'Message to accompany image? ' message
 
   name=`echo $file | sed "s/\.jpg//"`
   echo "$message" | mutt -s "$name!" -e 'set copy=no' -a "$file" -- "$addr"
   echo ---------------------------------
   echo "$file has been sent to the $addr"
   echo ---------------------------------
done


