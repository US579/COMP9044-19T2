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

#test legit-rm [--force] [--cached] filenames

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

# 2. index is different to both working file and repository

std1="legit-rm: error: 'a' in index is different to both working file and repository"
echo "hello" > a
sh legit-add a 
sh legit-commit -m "commit" > /dev/null
echo "world" >> a
sh legit-add a
echo "yeah!" >> a
out1=$( sh legit-rm a )
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32mindex is different to both working file and repository PASSED\n\e[0m"
else
  echo -en "\e[31mindex is different to both working file and repository failed\n\e[0m"
fi
rm -rf $legitdir

# 3. file in index dir same as working dir but has not commit

std1="legit-rm: error: 'a' has changes staged in the index"
sh legit-init > /dev/null
echo "hello" > a
sh legit-add a 
out1=$( sh legit-rm a )
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32mfile in index dir same as working dir but has not commit PASSED\n\e[0m"
else
  echo -en "\e[31mfile in index dir same as working dir but has not commit failed\n\e[0m"
fi
rm -rf $legitdir


# 4. file in index dir same as working dir differs from last commit
std1="legit-rm: error: 'a' in repository is different to working file"
sh legit-init > /dev/null
echo "hello" > a
sh legit-add a 
sh legit-commit -m "commit" > /dev/null
echo "world" >> a
out1=$( sh legit-rm a )
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32mfile in index dir same as working dir but has not commit PASSED\n\e[0m"
else
  echo -en "\e[31mfile in index dir same as working dir but has not commit failed\n\e[0m"
fi
rm -rf $legitdir




# 5. test for [--cached] flag




# 6. test for [--force] flag


# 7. if no parameter
std1="usage: legit-rm [--force] [--cached] <filenames>"
out1=$( sh legit-rm )
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32mif no parameter PASSED\n\e[0m"
else
  echo -en "\e[31mif no parameter failed\n\e[0m"
fi
rm -rf $legitdir



echo ""
rm -rf .legit


