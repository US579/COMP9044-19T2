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

# Test for test for legit-checkout

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
if [ -e "$fullpath/.commit_0/a" ]
then
    echo -en "\e[32mcommit success\n\e[0m"
else
    echo -en "\e[31mcommit failed\n\e[0m"
fi



rm a b 

# # 2. the branch switch to is not exist
# std1="legit-checkout: error: unknown branch 'new'"
# sh legit-init > /dev/null
# touch a 
# sh legit-add a
# sh legit-commit -m "commit" > /dev/null
# perl legit-checkout new > .a
# out1=`cat .a`
# if [ "$std1" = "$out1" ]
# then
#   echo -en "\e[32mthe branch switch to is not exist PASSED\n\e[0m"
# else
#   echo -en "\e[31mthe branch switch to is not exist failed\n\e[0m"
# fi
# rm .a
# rm -rf .legitdir


# # 2. switch to  new branch 
# std1="Switched to branch 'new'"
# sh legit-init > /dev/null
# touch a 
# sh legit-add a
# sh legit-commit -m "commit" > /dev/null
# perl legit-branch new 
# perl legit-checkout new > .a
# out1=`cat .a` 
# if [ "$std1" = "$out1" ]
# then
#   echo -en "\e[32mswitch to  new branch PASSED\n\e[0m"
# else
#   echo -en "\e[31mswitch to  new branch failed\n\e[0m"
# fi
# rm .a
# rm -rf $legitdir

# # 3. check wether the branch is already in that branch
# std1="Already on 'new'"
# sh legit-init > /dev/null
# touch a 
# sh legit-add a
# sh legit-commit -m "commit" > /dev/null
# perl legit-branch new > /dev/null
# perl legit-checkout new  > /dev/null
# perl legit-checkout new > .a 
# out1=`cat .a`
# if [ "$std1" = "$out1" ]
# then
#   echo -en "\e[32mscheck wether the branch is already in that branch PASSED\n\e[0m"
# else
#   echo -en "\e[31mcheck wether the branch is already in that branch failed\n\e[0m"
# fi
# rm .a
# rm -rf $legitdir

# # 4. when switch the branch , the new file added in the current branch will not exist in the 
# #    branch we switch to 
# std1="Already on 'new'"
# sh legit-init > /dev/null
# touch a 
# sh legit-add a
# sh legit-commit -m "commit" > /dev/null
# perl legit-branch new > /dev/null
# perl legit-checkout new  > /dev/null
# touch b
# sh legit-add b
# sh legit-commit -m "commit" > /dev/null
# perl legit-checkout master > /dev/null

# if [ -e "$fullpath/$indexdir/a" ] && [ ! -e "$fullpath/$indexdir/b" ]
# then
#   echo -en "\e[32mfile change PASSED\n\e[0m"
# else
#   echo -en "\e[31mfile change failed\n\e[0m"
# fi

# # 5. when switch back to the new , the file b should restore to current dir
# # and index dir 
# perl legit-checkout new > /dev/null

# if [ -e "$fullpath/$indexdir/a" ] && [ -e "$fullpath/$indexdir/b" ]  && [  -e a ] && [ -e b ]
# then
#   echo -en "\e[32mfile change retored PASSED\n\e[0m"
# else
#   echo -en "\e[31mfile change resotred failed\n\e[0m"
# fi

# # 5. when modified file is also exist in another branch, it will pump out the error
# # message 

# perl legit-checkout master> /dev/null
# echo "siyu" >> b
# sh legit-add b
# sh legit-commit -m "message"> /dev/null
# echo "mimi" >> b
# sh legit-add b
# echo "sy" >> b
# perl legit-checkout new >.a
# out1=`cat .a`
# std1="legit-checkout: error: Your changes to the following files would be overwritten by checkout:
# b"
# if [ "$std1" = "$out1" ] 
# then
#   echo -en "\e[32moverwritten check PASSED\n\e[0m"
# else
#   echo -en "\e[31moverwritten check failed\n\e[0m"
# fi
# rm b a


rm -rf .legit
echo -en "\e[35mTESTS FINISHED\n\e[0m"
