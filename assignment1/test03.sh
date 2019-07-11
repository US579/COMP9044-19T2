#!/bin/sh
#written by Wanze Liu z5137189

legitdir='.legit'
sub_legitdir='.git'
fullpath="$legitdir/$sub_legitdir"
indexdir="objects"

if [ -d ".legit" ]
then
    rm -rf ".legit/"
fi


echo -en "\e[37mALL TESTS BEGIN\n\e[0m"

#test legit-show

## 1 init repo
std1='Initialized empty legit repository in .legit';
out1=$(sh legit-init )

## 1 init 
if [ "$std1" = "$out1" ] && [ -d "$legitdir" ]
then
  echo -en "\e[32minit PASSED\n\e[0m"
else
  echo -en "\e[31minit failed\n\e[0m"
fi

# 2. no repo dir 
rm -rf .legit
std1="legit-show: error: no .legit directory containing legit repository exists"
out1=$(sh legit-show )
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32mno repo dir exists PASSED\n\e[0m"
else
  echo -en "\e[31mno repo dir exists failed\n\e[0m"
fi


#3 .repo dir exists , no input
sh legit-init > /dev/null
std1="usage: legit-show <commit>:<filename>"
out1=$(sh legit-show )
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32mno input PASSED\n\e[0m"
else
  echo -en "\e[31mno input failed\n\e[0m"
fi

# 3. invalid object
echo "hello" > a
sh legit-add a
sh legit-commit -m "commit" > /dev/null
std1="legit-show: error: invalid object a"
out1=$(sh legit-show a )
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32minvalid object PASSED\n\e[0m"
else
  echo -en "\e[31minvalid object failed\n\e[0m"
fi

# 4. unknow object
std1="legit-show: error: unknown commit 'a'"
out1=$(sh legit-show a:0 )
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32munknow object PASSED\n\e[0m"
else
  echo -en "\e[31munknow object failed\n\e[0m"
fi



echo ""
rm -rf .legit
echo -en "\e[35mTESTS FINISHED\n\e[0m"
