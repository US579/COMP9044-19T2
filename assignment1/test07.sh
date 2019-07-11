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

# Test for test for legit-branch 

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


# 2. error check
std1='legit-branch: error: your repository does not have any commits yet';
out1=$( perl legit-branch new )

if [ "$std1" = "$out1" ] 
then
  echo -en "\e[32merror check PASSED\n\e[0m"
else
  echo -en "\e[31merror check failed\n\e[0m"
fi

# 2. branch name check 
std1="legit-branch: error: invalid branch name '.new'";
touch a
sh legit-add a 
sh legit-commit -m 'commit' > /dev/null
out1=$( perl legit-branch .new )
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32mbranch name check PASSED\n\e[0m"
else
  echo -en "\e[31mbranch name check commitfailed\n\e[0m"
fi
rm -rf $legitdir 

# 3. create a new branch
sh legit-init > /dev/null
touch a 
sh legit-add a
sh legit-commit -m "commit"
perl legit-branch new 
if [ -e "$fullpath/Branch.new" ]
then
  echo -en "\e[32mcreate a new branch PASSED\n\e[0m"
else
  echo -en "\e[31mcreate a new branch commitfailed\n\e[0m"
fi

# 4. delete a master
std1="legit-branch: error: can not delete branch 'master'";
perl legit-branch -d master > .a 
out1=`cat .a`
rm .a
if [ "$std1" = "$out1" ] && [ -e "$fullpath/Branch.master" ]
then
  echo -en "\e[32mdelete a master PASSED\n\e[0m"
else
  echo -en "\e[31mdelete a master failed\n\e[0m"
fi

# 4. list all the branch 
rm -rf .legit
sh legit-init > /dev/null
touch a 
sh legit-add a 
sh legit-commit -m "commit"
perl legit-branch new
perl legit-branch new1
perl legit-branch new2
perl legit-branch > .a
out1=`cat .a`
std1="master
new
new1
new2"
if [ "$std1" = "$out1" ]
then
  echo -en "\e[32mlist all the branch PASSED\n\e[0m"
else
  echo -en "\e[31mlist all the branch failed\n\e[0m"
fi
rm .a







# 2. file changed, changes staged for commit
# sh legit-init > /dev/null
# std1='a - file changed, changes staged for commit';
# touch a
# sh legit-add a
# sh legit-commit -m 'commit' > /dev/null
# echo "world" >> a
# sh legit-add a
# out1=$( sh legit-status )
# out=$(echo $out1 | sed "s/.*\(a \- file changed.*for commit\).*/\1/")
# if [ "$std1" = "$out" ]
# then
#   echo -en "\e[32mfile changed, changes staged for commit PASSED\n\e[0m"
# else
#   echo -en "\e[31mfile changed, changes staged for commit failed\n\e[0m"
# fi
# rm -rf $legitdir

# # 3. file changed, changes not staged for commit
# sh legit-init > /dev/null
# std1='a - file changed, changes not staged for commit';
# touch a
# sh legit-add a
# sh legit-commit -m 'commit' > /dev/null
# echo "world" >> a
# out1=$( sh legit-status )
# out=$(echo $out1 | sed "s/.*\(a \- file changed.*not staged for commit\).*/\1/")
# if [ "$std1" = "$out" ]
# then
#   echo -en "\e[32mfile changed, changes not staged for commit PASSED\n\e[0m"
# else
#   echo -en "\e[31mfile changed, changes not staged for commit failed\n\e[0m"
# fi



# # 3. file deleted
# sh legit-init > /dev/null
# std1='a - file deleted';
# touch a
# sh legit-add a
# sh legit-commit -m 'commit' > /dev/null
# rm a
# out1=$( sh legit-status )
# out=$(echo $out1 | sed "s/.*\(a \- file deleted\).*/\1/")
# if [ "$std1" = "$out" ]
# then
#   echo -en "\e[32mfile deleted PASSED\n\e[0m"
# else
#   echo -en "\e[31mfile deleted failed\n\e[0m"
# fi
# rm -rf $legitdir


# # 3. deleted (either current dir or index)
# sh legit-init > /dev/null
# std1='a - deleted';
# touch a
# sh legit-add a
# sh legit-commit -m 'commit' > /dev/null
# sh legit-rm a
# out1=$( sh legit-status )
# out=$(echo $out1 | sed "s/.*\(a \- deleted\).*/\1/")
# if [ "$std1" = "$out" ]
# then
#   echo -en "\e[32mdeleted PASSED\n\e[0m"
# else
#   echo -en "\e[31mfile deleted failed\n\e[0m"
# fi
# rm -rf $legitdir

# # 4. same as repo
# sh legit-init > /dev/null
# std1='a - same as repo';
# touch a
# sh legit-add a
# sh legit-commit -m 'commit' > /dev/null
# out1=$( sh legit-status )
# out=$(echo $out1 | sed "s/.*\(a \- same as repo\).*/\1/")
# if [ "$std1" = "$out" ]
# then
#   echo -en "\e[32msame as repo PASSED\n\e[0m"
# else
#   echo -en "\e[31msame as repo failed\n\e[0m"
# fi
# rm -rf $legitdir

# # 5. added to index
# sh legit-init > /dev/null
# std1='b - added to index';
# touch a b
# sh legit-add a
# sh legit-commit -m "commit" > /dev/null
# sh legit-add b
# out1=$( sh legit-status )
# out=$(echo $out1 | sed "s/.*\(b \- added to index\).*/\1/")
# if [ "$std1" = "$out" ]
# then
#   echo -en "\e[32madded to index PASSED\n\e[0m"
# else
#   echo -en "\e[31madded to index failed\n\e[0m"
# fi
# rm -rf $legitdir

# # 5. untracked
# sh legit-init > /dev/null
# std1='a - untracked';
# touch a b
# sh legit-add b
# sh legit-commit -m "commit" > /dev/null
# out1=$( sh legit-status )
# out=$(echo $out1 | sed "s/.*\(a \- untracked\).*/\1/")
# if [ "$std1" = "$out" ]
# then
#   echo -en "\e[32muntracked PASSED\n\e[0m"
# else
#   echo -en "\e[31muntracked failed\n\e[0m"
# fi
# rm a b 
# echo ""
# rm -rf .legit


echo -en "\e[35mTESTS FINISHED\n\e[0m"
