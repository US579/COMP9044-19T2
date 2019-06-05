# COMP9044-19T2
Software Construction 

# LAB 01

Shell 正则表达式(BRE)

- `?` 表示前面的字符可以出现0次或1次,匹配成立

- `'+'` 表示前面的字符可以出现1次或者多次,但必须出现至少1次

-  `u*` 表示字母u可能出现或者不出现的匹配模式的文本中

  (在字符后面放置星号标明该字符必须在匹配模式的版本中出现0次或者多次)

### cat

- `-n` number output lines (starting from 1)  输出多少行
- `-s` squeeze consecutive blank lines into single blank line 将连续的空白行压缩成一行空白行
- `-v` display control-characters in visiable form 

### wc

- `-c` counts the number of characters (include "." )
- `-w` count the number of words(non-white space)
- `-l` count the number of lines

### tr

tr ’sourceChars’ ’destChars’ < dataFile 

将dataFile 里面的’sourceChars’替换成’destChars’

- `-c` map all characters not occurring in sourceChars
- `-s` squeeze adjacent repeated characters out(only copy the first)
- `-d` delete all characters in sourceChars
  - Example 
    - tr -cs ’a-zA-Z0-9’ ’\n’ < text (break text file into individual words, one per line)

### head/tail

* `-n` 前/后n行

### egrep

- `-i` ignore upper/lower-case difference in matching 
- `-v` only display lines that do not match the pattern 
- `-w` only match pattern if it makes a complete word

egrep其实就是grep的扩展版

- `grep -P` Perl-like extended regular expressions
  - Lab01 question中有一道题利用此条命令
    - grep -P '^(A(?1)?B)$' input.txt (AABB)





