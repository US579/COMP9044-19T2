#!/bin/sh

legitdir='.legit'
sub_legitdir='.git'
fullpath="$legitdir/$sub_legitdir"
indexdir="objects"

if [ -d ".legit" ]
then
    rm -rf ".legit/"
fi


echo -en "\e[37mALL TESTS BEGIN\n\e[0m"

#test legit-commit

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

# 2. empty commit 
std1="nothing to commit";
out1=$(sh legit-commit -m "message")
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32mempty commit PASSED\n\e[0m"
else
  echo -en "\e[31mempty commit failed\n\e[0m"
fi






echo ""
rm -rf .legit
