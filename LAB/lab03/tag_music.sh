#!/bin/bash

for file in $@
do 
   album=`echo "$file" | cut -d"/" -f2` 
   year=`echo "$file" | cut -d"/" -f2 | cut -d"," -f2 | sed "s/^[ ]*//"`
   for f in "$file"/*.mp3
    do
      track=`echo "$f" | cut -d"/" -f3 | sed "s/ - .*//"`
      title=`echo "$f" |sed "s/[^-]*- \([a-zA-Z ]*\) -.*/\1/"`
      artist=`echo "$f" |  cut -d"-" -f3 | sed "s/[ ]*\([a-zA-Z ]*\).mp3/\1/"`
      id3 -t "$title" -T "$track" -a "$artist" -A "$album" -y "$year" "$f" > /dev/null
    done
done
