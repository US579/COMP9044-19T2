#!/bin/dash
#written by Wanze Liu z5137189


legitdir='.legit'
sub_legitdir='.git'
fullpath="$legitdir/$sub_legitdir"
indexdir="objects"

# Subset 0
# function 1 inti
# initial the implicit folder ".legit/.git"

init() {
    if test -e  $legitdir
    then 
        echo "$0: error: $legitdir already exists"
    else
        mkdir "$legitdir"
        mkdir "$legitdir/$sub_legitdir"
        echo "Initialized empty legit repository in .legit"
    fi
}


# Subset 0
# function 2 add
# adds the contents of one or more files to the "index"

add() 
{   
    if  test "$#" -eq 1 
    then 
        echo "Maybe you wanted to say 'git add .'?"
        exit 1
    fi 
    if test -e  $legitdir
    then
        if !( test -e "$fullpath/$indexdir" )
        then
            mkdir "$fullpath/$indexdir"
            echo "$indexdir created"
        fi 
        for file in ${@:2}
        do  
            if !( test -e "$file" )
            then
                echo "legit-add: error: can not open '$file'"
                continue
            elif [[ $file =~ [^a-zA-Z0-9\.\_\-] || $file =~ ^[^a-zA-Z0-9] ]]
            then
                echo "legit-add: error: invalid filename '$file'"
                continue 
            else
                cp "$file" "$fullpath/$indexdir"
            fi 
        done
    else
        echo  "legit.pl: error: no $legitdir directory containing legit repository exists"
        exit 1
    fi
}

# Subset 0
# Function 2 commit
# Saves a copy of all files in the index to the repository

last_commit()
{
    count=0
    while ( test $count -ge 0 )
    do
        if [ -d "$fullpath/.commit_$count" ]
        then
            count=$(( count+1 ))
        else
            return $count
        fi
    done
}

commit()
{
    if ([[ "$2" =~ '-m' && $3 ]])
    then
        last_commit
        last_num="$?"
        echo $last_num
    else 
        echo "usage: legit-commit [-a] -m commit-message"
        exit 1
    fi 
}



case "$1" in 
    "add" ) add $@;;
    "pp" ) pp ;;
    "init" ) init ;;
    "commit" ) commit $@;;
    *) error ;;
esac




                
                






