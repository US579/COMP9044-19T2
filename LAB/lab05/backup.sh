#!/bin/bash


name=$@
if !( test -e ".$name.0")
then 
    cat $name > ".$name.0"
    exit 0
fi

for i in `ls -a`
do
    echo "$i"
    if ( echo $i | egrep ".$name.[0-9]*" )
    then
        seq=`echo $i | cut -d. -f4`
        num="$num $seq"
    fi
done

new=`echo $num | tr " "  "\n" | sort -n | tail -1`

cat $name > ".$name.$new"

