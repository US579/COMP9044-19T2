#!/bin/bash


#change the uppercase file name to the lowercase
for file in *
do
    lowercase=$(echo "$file"|"tr A-Z a-z")
    test "$lowercase" = "$file" && continue
    # if lowercase equal to file then continue
    if test -e "$lowercase"
    then
        echo "$lowercase" already exists
        continue
    fi
    #1
    mv "$file" "$lowercase"
    #2
    cp "$file" "$lowercase" || exit
    rm "$file"
done


for f in *.c;do clang $f && ./a.out 

#same code
for file1 in "$@"
do
    for file2 in "$@"
    do
        test "$file1" = "$file2" && continue
        #delete the comments
        sed "s?//.*??;s/[a-zA-Z_][a-zA-Z0-9_]*/andrew/g" | sort "$file1" > temp1
        sed "s?//.*??;s/[a-zA-Z_][a-zA-Z0-9_]*/andrew/g" | sort "$file2" > temp2
       
        differences=$(diff "$temp1" "$temp2")

        n_difference=$(diff -iBw temp1 temp2 | wc -l)
       #if test -z "differences"
        if test $n_differences -lt 10
        then
            echo same code "$file1" "$file2"
        fi
    done
done

#change every variable to the same name and chechk the diff



