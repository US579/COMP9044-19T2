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

# 3. test for error
rm -rf $legitdir
sh legit-init > /dev/null
std1='nothing to commit';
out1=$( sh legit-commit -m "commit" )
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32mnothing to commit PASSED\n\e[0m"
else
  echo -en "\e[31mnothing to commit failed\n\e[0m"
fi


echo ""
rm -rf .legit
echo -en "\e[35mTESTS FINISHED\n\e[0m"
