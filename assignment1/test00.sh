#!/bin/sh


std='Initialized empty legit repository in .legit';
std1='';
#test legit-add


echo -en "\e[37mALL TESTS BEGIN\n\e[0m"

## 1 init repo
out1=$( sh legit-init )



## 1 init 

if [ "$std" = "$out1" && test -d ".legit" ]; then
  echo -en "\e[32minit PASSED\n\e[0m"
else
  echo -en "\e[31minit failed\n\e[0m"
fi


# 2 add a adding it to index and staged
echo "hello" > a
sh legit-add a
if [ test -e "$" ]; then
  echo -en "\e[32minit PASSED\n\e[0m"
else
  echo -en "\e[31minit failed\n\e[0m"
fi


# 2 add a   adding it to index and staged
echo ""
rm -rf .legit




if [ $? == 0 ]
then
	echo -en "\e[32mALL TESTS PASSED\n\e[0m"
else
	echo -e "\e[31mautotest failed\e[0m"
fi
