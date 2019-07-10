#!/bin/sh

legitdir='.legit'
sub_legitdir='.git'
fullpath="$legitdir/$sub_legitdir"
indexdir="objects"


echo -en "\e[37mALL TESTS BEGIN\e[0m"

#test legit-add

## 1 init repo

std1='Initialized empty legit repository in .legit';

out1=$(sh legit-init )

## 1 init 

if [ "$std1" = "$out1" ] && [ -d "$legitdir" ]
then
  echo -en "\e[32minit PASSED\e[0m"
else
  echo -en "\e[31minit failed\e[0m"
fi


# 2 add file a

echo "hello" > a
sh legit-add a

if [ -e "$fullpath/$indexdir/a" ]
then
  echo -en "\e[32minit PASSED\e[0m"
else
  echo -en "\e[31minit failed\e[0m"
fi

# 3 add file that not exists

std2="legit-add: error: can not open 'b'"
out2=$( sh legit-add b )
if [ "$std2" = "$out2" ]
then
  echo -en "\e[32madd non-exist PASSED\e[0m"
else
  echo -en "\e[31madd non-exist failed\e[0m"
fi

# add same file
out2=$( sh legit-add a )
if (diff "a" "$fullpath/$indexdir/a" > /dev/null )
then
  echo -en "\e[32madd same file PASSED\e[0m"
else
  echo -en "\e[31madd same file failed\e[0m"
fi


# add same file but changing after been added
out2=$( sh legit-add a )
echo asd >> a 
if ! (diff "a" "$fullpath/$indexdir/a" > /dev/null )
then
  echo -en "\e[32madd same file PASSED(changed)\e[0m"
else
  echo -en "\e[31madd same file failed(changed)\e[0m"
fi





echo ""
rm -rf .legit


# if [ $? == 0 ]
# then
# 	echo -en "\e[32mALL TESTS PASSED\n\e[0m"
# else
# 	echo -e "\e[31mautotest failed\e[0m"
# fi
