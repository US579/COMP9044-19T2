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


echo -en "\e[35mALL TESTS BEGIN\n\e[0m"

# Test 

## 1 init repo
std1='Initialized empty legit repository in .legit';
out1=$(sh legit-init )

# 1 init 
if [ "$std1" = "$out1" ] && [ -d "$legitdir" ]
then
  echo -en "\e[32minit PASSED\n\e[0m"
else
  echo -en "\e[31minit failed\n\e[0m"
fi


# add file 
touch a
sh legit-add a
if [ -e "$fullpath/$indexdir/a" ]
then
    echo -en "\e[32madd file success\n\e[0m"
else
    echo -en "\e[31madd file failed\n\e[0m"
fi

# commit 
sh legit-commit -m "commit" > /dev/null
if [ -e "$fullpath/.commit_0/a" ]
then
    echo -en "\e[32mcommit success\n\e[0m"
else
    echo -en "\e[31mcommit failed\n\e[0m"
fi

# creat file but not add 

echo "hello" > b
sh legit-commit -m "commit" > /dev/null
if [ ! -e "$fullpath/.commit_0/b" ]
then
    echo -en "\e[32mcommit success\n\e[0m"
else
    echo -en "\e[31mcommit failed\n\e[0m"
fi


# switch to  new branch 
std1="Switched to branch 'new'"
perl legit-branch new 
perl legit-checkout new > .a
out1=`cat .a` 
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32mswitch to  new branch PASSED\n\e[0m"
else
  echo -en "\e[31mswitch to  new branch failed\n\e[0m"
fi

# switch back
std1="Switched to branch 'master'"
perl legit-checkout master > .a
out1=`cat .a` 
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32mswitch to  new branch PASSED\n\e[0m"
else
  echo -en "\e[31mswitch to  new branch failed\n\e[0m"
fi




rm a b .a

rm -rf .legit
echo -en "\e[35mTESTS FINISHED\n\e[0m"
