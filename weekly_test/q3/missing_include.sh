#!/bin/bash

if [[ $# == 0 ]]
then 
   echo "useage : $0 <file1 file2 ... file n>"
fi

for file in $@
do
   cat "$file" | while read line
   do 
     case "$line" in 
     "#"*) ;;
     *) continue;;
     esac
    if [[ "$line" =~ '#include <' ]]
    then 
       continue
    fi 
    name=`echo "$line" | cut -d"\"" -f2`
    if ( test -e "$name" )
    then 
      continue
    else
      echo "$name included into $file does not exist"
    fi
 done
done
