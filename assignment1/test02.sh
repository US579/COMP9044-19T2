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

#test legit-log

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

# 2. no repo dir exists
rm -rf .legit
std1="legit-log: error: no .legit directory containing legit repository exists"
out1=$(sh legit-log )
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32mno repo dir exists PASSED\n\e[0m"
else
  echo -en "\e[31mno repo dir exists failed\n\e[0m"
fi

#3 .repo dir exists , but no commit
sh legit-init > /dev/null
std1="legit-log: error: your repository does not have any commits yet"
out1=$(sh legit-log )
echo $out1
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32mrepo dir exists , but no commit PASSED\n\e[0m"
else
  echo -en "\e[31mrepo dir exists , but no commit failed\n\e[0m"
fi

echo ""
rm -rf .legit
