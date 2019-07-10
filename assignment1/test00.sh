#!/bin/sh

legitdir='.legit'
sub_legitdir='.git'
fullpath="$legitdir/$sub_legitdir"
indexdir="objects"


echo -en "\e[37mALL TESTS BEGIN\n\e[0m"

#test legit-add

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

# 2 add file a

echo "hello" > a
sh legit-add a

if [ -e "$fullpath/$indexdir/a" ]
then
  echo -en "\e[32minit PASSED\n\e[0m"
else
  echo -en "\e[31minit failed\n\e[0m"
fi

# 3 add file that not exists

std2="legit-add: error: can not open 'b'"
out2=$( sh legit-add b )
if [ "$std2" = "$out2" ]
then
  echo -en "\e[32madd non-exist PASSED\n\e[0m"
else
  echo -en "\e[31madd non-exist failed\n\e[0m"
fi

# 4 add same file
out2=$( sh legit-add a )
if (diff "a" "$fullpath/$indexdir/a" > /dev/null )
then
  echo -en "\e[32madd same file PASSED\n\e[0m"
else
  echo -en "\e[31madd same file failed\n\e[0m"
fi


# 5 add same file but changing after been added
out2=$( sh legit-add a )
echo asd >> a 
if ! (diff "a" "$fullpath/$indexdir/a" > /dev/null )
then
  echo -en "\e[32madd same file PASSED(changed)\n\e[0m"
else
  echo -en "\e[31madd same file failed(changed)\n\e[0m"
fi

# 6 add file with invalid file name

echo "hello" > _a
out3=$( sh legit-add _a )
std3="legit-add: error: invalid filename '_a'"
if [ "$std3" = "$out3" ]
then
  echo -en "\e[32madd invalid name file  PASSED\n\e[0m"
else
  echo -en "\e[31madd invalid name file failed\n\e[0m"
fi

# 7 .legit dir is not exit when adding file
rm -rf "$legitdir"
out4=$(sh legit-add a )
std4="legit-add: error: no $legitdir directory containing legit repository exists"
if [ "$std4" = "$out4" ]
then
  echo -en "\e[32madd with no repo PASSED\n\e[0m"
else
  echo -en "\e[31madd  with no repo failed\n\e[0m"
fi
sh legit-init >/dev/null


# 8 add file not exist in current dir but exist in index dir
echo "hello" > b
sh legit-add b >/dev/null
rm b
sh legit-add b >/dev/null
if [ -e "$fullpath/$indexdir/b" ]
then
  echo -en "\e[31madd file not exist in current dir but exist in index dir failed\n\e[0m"
else
  echo -en "\e[32madd file not exist in current dir but exist in index dir PASSED\n\e[0m"
fi



rm _a a 
echo ""
rm -rf .legit
