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
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32mrepo dir exists , but no commit PASSED\n\e[0m"
else
  echo -en "\e[31mrepo dir exists , but no commit failed\n\e[0m"
fi

# 3. has one commit 
echo "hello" > a
sh legit-add a
sh legit-commit -m "commit" > /dev/null
std1="0 commit"
out1=$(sh legit-log )
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32m has one commit PASSED\n\e[0m"
else
  echo -en "\e[31mr has one commit failed\n\e[0m"
fi
rm -rf .legit

# 3. has two commit , must be descending order
sh legit-init > /dev/null
echo "hello" > a
sh legit-add a
sh legit-commit -m "commit" > /dev/null
echo "hello" > b
sh legit-add b
sh legit-commit -m "commit" > /dev/null
std1="1 commit
0 commit"
out1=$(sh legit-log )
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32m have two commit PASSED\n\e[0m"
else
  echo -en "\e[31m have two commit failed\n\e[0m"
fi

echo ""
rm -rf .legit
