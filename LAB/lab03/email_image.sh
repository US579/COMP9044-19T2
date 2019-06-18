#!/bin/bash

if [ $# == 0 ];
then 
 echo "usage:$0 <attachment>"
 exit 1
fi

for file in $@
do
  echo "Address to e-mail this image to? "
  read addr
  if [ ! -n "$addr" ];
    then
      echo "Email address can not be empty"
      exit 1
  fi
  echo "Message to accompany image?"
  read message
  mes=`echo $file | sed "s/\.jpg//"`\!
  echo "$message"|mutt -s "$mes" -e 'set copy=no' -a $file -- $addr
done

