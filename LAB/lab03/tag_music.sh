#!/bin/bash

for file in "$@"
do 
   album=`echo "$file" | cut -d"/" -f2` 
   year=`echo "$file" | cut -d"/" -f2 | cut -d"," -f2 | sed "s/^[ ]*//"`
   for fi in "$file"/*.mp3
    do
      f=`echo "$fi" | sed "s/\/\//\//"`
      track=`echo "$f" | cut -d"/" -f3 | cut -d " " -f 1`
      temp=`echo "$f" | cut -d"/" -f3 |sed "s/[ ]-[ ]/\//g"`
      title=`echo "$temp" | cut -d"/" -f2` 
      artist=`echo "$temp" | cut -d"/" -f3 | sed "s/\.mp3$//"`
      id3 -t "$title" -T "$track" -a "$artist" -A "$album" -y "$year" "$f" >/dev/null
    done
done
