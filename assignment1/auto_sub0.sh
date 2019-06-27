#!/bin/dash

./legit-init

echo line 1 >a
echo hello world >b

./legit-add a b
./legit-commit -m "first commit"
echo line 2 >>a
./legit-add a
./legit-commit -m "second commit"
./legit-log
echo line 3 >>a
./legit-add a
echo line 4 >>a
./legit-show 0:a
./legit-show 1:a
./legit-show :a
./legit-show 0:b
./legit-show 1:b


