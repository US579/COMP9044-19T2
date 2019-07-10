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

# add file with invalid file name

echo "hello" > _a
out3=$( sh legit-add _a )
std3="legit-add: error: invalid filename '_a'"
if [ "$std3" = "$out3" ]
then
  echo -en "\e[32madd invalid name file  PASSED\e[0m"
else
  echo -en "\e[31madd invalid name file failed\e[0m"
fi

#  .legit dir is not exit when adding file
rm -rf "$legitdir"
out4=$(sh legit-add a )
std4="legit-add: error: no $legitdir directory containing legit repository exists"
if [ "$std4" = "$out4" ]
then
  echo -en "\e[32madd with no repo PASSED\e[0m"
else
  echo -en "\e[31madd  with no repo failed\e[0m"
fi
sh legit-init >/dev/null




rm _a a 
echo ""
rm -rf .legit
