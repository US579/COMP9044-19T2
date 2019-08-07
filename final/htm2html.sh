#!/bin/dash

for i in *
do  
    if ( echo $i | egrep ".htm$" ) > /dev/null
    then
        if [ -e "$i""l" ]
        then
            echo "$i"l" exist"
            exit
        fi 
        mv "$i" "$i""l" 
    fi
done

