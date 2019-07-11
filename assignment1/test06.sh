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
rm a b 
echo ""
rm -rf .legit


