#!/bin/bash


dir1="$1";
dir2="$2";

# echo $dir1;
# echo $dir2;
for file in "$dir1"/*
do
	if diff "$file" "$dir2" > /dev/null 2>&1 
	then
		echo "$file" | sed "s/.*\///"
		#basename $file
	fi
done
