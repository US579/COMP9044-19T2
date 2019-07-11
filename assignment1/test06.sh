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

# Test for legit-status

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


# 2. file changed, different changes staged for commit
std1='a - file changed, different changes staged for commit';
touch a
sh legit-add a 
sh legit-commit -m 'commit' > /dev/null
echo "world" >> a
sh legit-add a
echo "hello" >> a
out1=$( sh legit-status )
out=$(echo $out1 | sed "s/.*\(a \- file changed.*for commit\).*/\1/")
if [ "$std1" = "$out" ]
then
  echo -en "\e[32mfile changed, different changes staged for commit PASSED\n\e[0m"
else
  echo -en "\e[31mfile changed, different changes staged for commitfailed\n\e[0m"
fi

# 2. file changed, changes staged for commit
sh legit-init > /dev/null
std1='a - file changed, changes staged for commit';
touch a
sh legit-add a
sh legit-commit -m 'commit' > /dev/null
echo "world" >> a
sh legit-add a
out1=$( sh legit-status )
out=$(echo $out1 | sed "s/.*\(a \- file changed.*for commit\).*/\1/")
if [ "$std1" = "$out" ]
then
  echo -en "\e[32mfile changed, changes staged for commit PASSED\n\e[0m"
else
  echo -en "\e[31mfile changed, changes staged for commit failed\n\e[0m"
fi
rm -rf $legitdir

# 3. file changed, changes not staged for commit
sh legit-init > /dev/null
std1='a - file changed, changes not staged for commit';
touch a
sh legit-add a
sh legit-commit -m 'commit' > /dev/null
echo "world" >> a
out1=$( sh legit-status )
out=$(echo $out1 | sed "s/.*\(a \- file changed.*not staged for commit\).*/\1/")
if [ "$std1" = "$out" ]
then
  echo -en "\e[32mfile changed, changes not staged for commit PASSED\n\e[0m"
else
  echo -en "\e[31mfile changed, changes not staged for commit failed\n\e[0m"
fi
rm -rf $legitdir a


# 3. file deleted
sh legit-init > /dev/null
std1='a - file deleted';
touch a
sh legit-add a
sh legit-commit -m 'commit' > /dev/null
rm a
out1=$( sh legit-status )
out=$(echo $out1 | sed "s/.*\(a \- file deleted\).*/\1/")
if [ "$std1" = "$out" ]
then
  echo -en "\e[32mfile deleted PASSED\n\e[0m"
else
  echo -en "\e[31mfile deleted failed\n\e[0m"
fi
rm -rf $legitdir


# 3. deleted (either current dir or index)
sh legit-init > /dev/null
std1='a - deleted';
touch a
sh legit-add a
sh legit-commit -m 'commit' > /dev/null
sh legit-rm a
out1=$( sh legit-status )
out=$(echo $out1 | sed "s/.*\(a \- deleted\).*/\1/")
if [ "$std1" = "$out" ]
then
  echo -en "\e[32mdeleted PASSED\n\e[0m"
else
  echo -en "\e[31mfile deleted failed\n\e[0m"
fi
rm -rf $legitdir

# 4. same as repo
sh legit-init > /dev/null
std1='a - same as repo';
touch a
sh legit-add a
sh legit-commit -m 'commit' > /dev/null
out1=$( sh legit-status )
out=$(echo $out1 | sed "s/.*\(a \- same as repo\).*/\1/")
if [ "$std1" = "$out" ]
then
  echo -en "\e[32msame as repo PASSED\n\e[0m"
else
  echo -en "\e[31msame as repo failed\n\e[0m"
fi
rm -rf $legitdir

# 5. added to index
sh legit-init > /dev/null
std1='a - added to index';
touch a b
sh legit-add a
sh legit-commit -m "commit"
sh legit-add b
out1=$( sh legit-status )
out=$(echo $out1 | sed "s/.*\(a \- added to index\).*/\1/")
if [ "$std1" = "$out" ]
then
  echo -en "\e[32madded to index PASSED\n\e[0m"
else
  echo -en "\e[31madded to index failed\n\e[0m"
fi
rm -rf $legitdir

# 5. untracked
sh legit-init > /dev/null
std1='a - untracked';
touch a b
sh legit-add b
sh legit-commit -m "commit"
out1=$( sh legit-status )
out=$(echo $out1 | sed "s/.*\(a \- untracked\).*/\1/")
if [ "$std1" = "$out" ]
then
  echo -en "\e[32muntracked PASSED\n\e[0m"
else
  echo -en "\e[31muntracked failed\n\e[0m"
fi



# # 2. index is different to both working file and repository

# std1="legit-rm: error: 'a' in index is different to both working file and repository"
# echo "hello" > a
# sh legit-add a 
# sh legit-commit -m "commit" > /dev/null
# echo "world" >> a
# sh legit-add a
# echo "yeah!" >> a
# out1=$( sh legit-rm a )
# if [ "$std1" = "$out1" ]
# then
#   echo -en "\e[32mindex is different to both working file and repository PASSED\n\e[0m"
# else
#   echo -en "\e[31mindex is different to both working file and repository failed\n\e[0m"
# fi
# rm -rf $legitdir

# # 3. file in index dir same as working dir but has not commit

# std1="legit-rm: error: 'a' has changes staged in the index"
# sh legit-init > /dev/null
# echo "hello" > a
# sh legit-add a 
# out1=$( sh legit-rm a )
# if [ "$std1" = "$out1" ]
# then
#   echo -en "\e[32mfile in index dir same as working dir but has not commit PASSED\n\e[0m"
# else
#   echo -en "\e[31mfile in index dir same as working dir but has not commit failed\n\e[0m"
# fi
# rm -rf $legitdir


# # 4. file in index dir same as working dir differs from last commit
# std1="legit-rm: error: 'a' in repository is different to working file"
# sh legit-init > /dev/null
# echo "hello" > a
# sh legit-add a 
# sh legit-commit -m "commit" > /dev/null
# echo "world" >> a
# out1=$( sh legit-rm a )
# if [ "$std1" = "$out1" ]
# then
#   echo -en "\e[32mfile in index dir same as working dir differs from last commit PASSED\n\e[0m"
# else
#   echo -en "\e[31mfile in index dir same as working dir differs from last commit failed\n\e[0m"
# fi
# rm -rf $legitdir




# # 5. test for [--cached] flag
# # only delete the file in the index dir
# std1="legit-rm: error: 'a' in repository is different to working file"
# sh legit-init > /dev/null
# echo "hello" > a
# sh legit-add a 
# sh legit-commit -m "commit" > /dev/null
# out1=$( sh legit-rm --cached a )
# if [ -e a ]
# then
#   echo -en "\e[32mtest for [--cached] flag PASSED\n\e[0m"
# else
#   echo -en "\e[31mtest for [--cached] flag failed\n\e[0m"
# fi
# rm -rf $legitdir


# # 6. test for [--force] flag
# # if [--force] flag specified , it will ignore all warning
# sh legit-init > /dev/null
# echo "hello" > a
# sh legit-add a 
# sh legit-commit -m "commit" > /dev/null
# echo "world" >> a
# out1=$( sh legit-rm --force a )
# if [ "$out1" = "" ]
# then
#   echo -en "\e[32mtest for [--force] flag PASSED\n\e[0m"
# else
#   echo -en "\e[31mtest for [--force] flag failed\n\e[0m"
# fi
# rm -rf $legitdir

# # 6. test for [--force] flag
# # if [--force] flag specified , it will ignore all warning
# std1="legit-rm: error: 'a' has changes staged in the index"
# sh legit-init > /dev/null
# echo "hello" > a
# sh legit-add a 
# out1=$( sh legit-rm a )
# out1=$( sh legit-rm --force a )
# if [ "$out1" = "" ]
# then
#   echo -en "\e[32mtest for [--force] flag PASSED\n\e[0m"
# else
#   echo -en "\e[31mtest for [--force] flag failed\n\e[0m"
# fi
# rm -rf $legitdir

# # 7. if no parameter
# std1="usage: legit-rm [--force] [--cached] <filenames>"
# out1=$( sh legit-rm )
# if [ "$std1" = "$out1" ]
# then
#   echo -en "\e[32mif no parameter PASSED\n\e[0m"
# else
#   echo -en "\e[31mif no parameter failed\n\e[0m"
# fi
# rm -rf $legitdir



echo ""
# rm -rf .legit


