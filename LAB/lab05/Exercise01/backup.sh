#!/bin/bash


name=$@
if !( test -e ".$name.0")
then 
    cat $name > ".$name.0"
    echo "Backup of '$name' saved as '.$name.0'"
    exit 0
else
	for i in `ls -a`
	do  
	    if ( echo $i | egrep ".$name.[0-9]*" ) > /dev/null
	    then
	        seq=`echo $i | cut -d. -f4`
	        num="$num $seq"
	    fi
	done
fi

new=`echo $num | tr " "  "\n" | sort -n | tail -1` > /dev/null
new=$((new +1 ))
cat $name > ".$name.$new"
echo "Backup of '$name' saved as '.$name.$new'"

