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
	fi
done

# st1=""
# for file in $dir2/*
# do
# 	# echo "$file";
# 	fi=`echo $file | sed "s/.*\///"`
# 	st1="$st1 $fi";
# done


# st1Len=`echo $st | tr " " "\n" | wc -l`;
# st2Len=`echo $st1 | tr " " "\n" | wc -l`;


# st1Lis=`echo $st | tr " " "\n" `;
# st2Lis=`echo $st1 | tr " " "\n" `;


# for i in $st1Lis
# do
# 	echo $i
# done

# if [ $st1Len > $st2Len ]
# then
# 	echo "ok"
# fi



# # if [[  ]]; then
# # 	#statements
# # fi
# echo $st1Len; 
# echo $st2Len;
# # echo $st1;
# # echo $st;
