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

count=0;
cut=0;

echo -en "\e[37mALL TESTS BEGIN\n\e[0m"

#test legit-commit

## 1 init repo
std1='Initialized empty legit repository in .legit';
out1=$(sh legit-init )

## 1 init 
if [ "$std1" = "$out1" ] && [ -d "$legitdir" ]
then
  echo -en "\e[32minit PASSED\n\e[0m"
  ((cout++))
else
  echo -en "\e[31minit failed\n\e[0m"
  cut=$((cut+1))
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

# 2.the first commit 
touch a 
sh legit-add a
std1="Committed as commit 0";
out1=$(sh legit-commit -m "message")
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32mfirst commit PASSED\n\e[0m"
  count=$(($conut+1))
else
  echo -en "\e[31mfisrt commit failed\n\e[0m"
  cut=$((cut+1))
fi
rm a 


# 3. commit with the latest number 
echo "hello" > b
sh legit-add b
std1="Committed as commit 1";
out1=$(sh legit-commit -m "message")
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32mcommit with the latest number PASSED\n\e[0m"
  count=$(($conut+1))
else
  echo -en "\e[31mcommit with the latest number failed\n\e[0m"
  cut=$((cut+1))
fi


# 3. after commit , file in last commit dir is same as the index dir
if ( diff "b" "$fullpath/$indexdir/b" ) > /dev/null
then
  echo -en "\e[32mfile in last commit dir is same as the index dir PASSED\n\e[0m"
  count=$(($conut+1))
else
  echo -en "\e[31mfile in last commit dir is same as the index dir failed\n\e[0m"
  cut=$((cut+1))
fi
rm b



# 3. if file in index dir differs from working dir and last commit 
echo "hello" > a
sh legit-add a
sh legit-commit -m "message" > /dev/null
echo "world" >> a
sh legit-add a
echo "yeah!" >> a
std1="legit-rm: error: 'a' in index is different to both working file and repository";
out1=$(sh legit-rm a)
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32mif file in index dir differs from working dir and last commit PASSED\n\e[0m"
  count=$(($conut+1))
else
  echo -en "\e[31mif file in index dir differs from working dir and last commit failed\n\e[0m"
  cut=$((cut+1))
fi


echo ""
rm -rf .legit

# echo -en "\e[32mPASSED $count TESTS[0m"
# echo -en "\e[31mFAILED $cut TESTS[0m"


