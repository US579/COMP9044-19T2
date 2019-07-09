#!/bin/sh

if ([ -d ".legit" ]);
then
    rm -rf ".legit/"
fi


echo "test1 (add files (and status))"
sh legit-init >>output1.txt
touch a b c d e f
touch output1.txt
touch output2.txt
sh legit-add a b c d e f
sh legit-commit -m "hello" >>output1.txt
sh legit-status >>output1.txt
rm -rf ".legit" &>/dev/null
sh legit-init >>output1.txt
sh legit-add a b d e
sh legit-commit -m "123" >>output1.txt
sh legit-status >>output1.txt
rm -rf ".legit" &>/dev/null

2041 legit-init >>output2.txt
2041 legit-add a b c d e f
2041 legit-commit -m "123" >>output2.txt
2041 legit-status >>output2.txt
rm -rf ".legit" &>/dev/null
2041 legit-init >>output2.txt
2041 legit-add a b d e
2041 legit-commit -m "123" >>output2.txt
2041 legit-status >>output2.txt
rm -rf ".legit" &>/dev/null

#echo "$difference"
if cmp -s "output1.txt" "output2.txt"
then
	echo "autotest passed congratulations!"
else
	echo "autotest failed, different output than expected see below"
	echo "==============> your output <============================"
	cat output1.txt
	echo "==============> expected output <========================"
	cat output2.txt
fi
rm a b c d e f
rm output1.txt
rm output2.txt
