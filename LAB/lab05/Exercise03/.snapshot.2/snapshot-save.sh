#!/bin/sh

backdir="snapshot"

lastseq(){
	for i in `ls -a`
	do
		if ( echo $i | grep ".snapshot.") >/dev/null
		then
			num=`echo $i | sed "s/.*\.//"`
			seq="$seq $num"
		fi
	done
	last=`echo $seq | tr " " "\n" | sort -n | tail -1`
	last=$((last+1))
	return $last;
}



# for file in `ls`
# do
# 	string_file="$string_file $file"
# done

# file_split=`echo $string_file | tr " " "\n"`
# echo $file_split
# for f in "$file_split"
# do
# 	echo $f
# done


if !(test -e ".$backdir.0")
then
	mkdir ".$backdir.0"
	for f in `ls`
	do
		cp "$f" "./.$backdir.0"
	done
	echo "Creating snapshot 0"
else
	lastseq
	seq="$?"
	mkdir ".$backdir.$seq"
	for f in `ls`
	do
		cp "$f" "./.$backdir.$seq"
	done
	echo "Creating snapshot $seq"
fi

