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

#test legit-commit [-a] -m message

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


# 2. file not found
echo "hello" > a
sh legit-add a
sh legit-commit -m "commit" > /dev/null
std1="legit-show: error: 'c' not found in commit 0"
out1=$(sh legit-show 0:c )
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32file not found PASSED\n\e[0m"
else
  echo -en "\e[31mfile not found failed\n\e[0m"
fi
rm a


# 2. test for -a flag
rm -rf $legitdir
sh legit-init > /dev/null
echo "hello" > a
sh legit-add a
sh legit-commit -m "commit" > /dev/null
echo "world" >> a
sh legit-commit -a -m "commit" > /dev/null
if ( diff "a" "$fullpath/$indexdir/a" )
then
  echo -en "\e[32mtest for -a flagPASSED\n\e[0m"
else
  echo -en "\e[31mtest for -a flagfailed\n\e[0m"
fi
rm a



echo ""
rm -rf .legit


