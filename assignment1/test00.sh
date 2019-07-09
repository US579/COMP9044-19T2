#!/bin/sh


rm -rf ".legit/"

# your output
echo -e "\e[36mTEST1 init add status \n\e[0m"

touch a b c d e f
touch out1.txt
touch out2.txt
sh legit-init >> out1.txt
sh legit-add a b c d e f
sh legit-commit -m "hello" >>out1.txt
sh legit-status >>out1.txt
rm -rf ".legit" &>/dev/null

# correct output
2041 legit-init >>out2.txt
2041 legit-add a b c d e f 
2041 legit-commit -m "hello" >>out2.txt
2041 legit-status >>out2.txt
rm -rf ".legit" &>/dev/null

if cmp -s "out1.txt" "out2.txt"
then
	echo -en "\e[32mALL TESTS PASSED\n\e[0m"
else
	echo -e "\e[31mautotest failed\e[0m"
	echo "\e[31m===================> your output <============================\n\e[0m"
	cat out1.txt
	echo "\e[32m===================> expected output <========================\n\e[0m"
	cat out2.txt
fi

rm a b c d e f 
rm out1.txt
rm out2.txt
