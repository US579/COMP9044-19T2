#!/bin/sh

if ([ -d ".legit" ]);
then
    rm -rf ".legit/"
fi

# your output
echo "test1 (add files (and status))"
sh legit-init >>out1.txt
touch a b c 
touch out1.txt
touch out2.txt
sh legit-add a b c
sh legit-commit -m "hello" >>out1.txt
sh legit-status >>out1.txt
rm -rf ".legit" &>/dev/null
sh legit-init >>out1.txt
sh legit-add a b d e
sh legit-commit -m "123" >>out1.txt
sh legit-status >>out1.txt
rm -rf ".legit" &>/dev/null

# correct output
2041 legit-init >>out2.txt
2041 legit-add a b c d e f
2041 legit-commit -m "123" >>out2.txt
2041 legit-status >>out2.txt
rm -rf ".legit" &>/dev/null
2041 legit-init >>out2.txt
2041 legit-add a b d e
2041 legit-commit -m "123" >>out2.txt
2041 legit-status >>out2.txt
rm -rf ".legit" &>/dev/null

if cmp -s "out1.txt" "out2.txt"
then
	echo -e "\e[32mALL TEST PASSED\e[0m"
else
	echo "\e[31mautotest failed, different output than expected see below\e[0m"
	echo "=================> your output <============================"
	cat out1.txt
	echo "=================> expected output <========================"
	cat out2.txt
fi
rm a b c d e f
rm out1.txt
rm out2.txt
