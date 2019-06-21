#!/bin/bash

if [[ $# != 1 ]]
then
   echo "usage: $0 <file> "
   exit 1
fi
file=$1
cat "$file" | egrep "COMP[29]041" | cut -d"|" -f3 | cut -d"," -f2 | cut -d" " -f2 | sort | uniq -c | sort -nr | head -1 | sed "s/.* //"
