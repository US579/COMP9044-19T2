#!/bin/sh
backdir="snapshot"
lastseq(){
    for i in `ls -a`
    do
        if ( echo $i | grep ".snapshot.") >/dev/null
        then
            num=`echo $i | sed "s/.*\.//"`
            seq="$seq $num"
        fi
    done
    last=`echo $seq | tr " " "\n" | sort -n | tail -1`
    last=$((last+1))
    return $last;
}



if ( test $# -ne 1 )
then
    echo "usage: $0 <num>"
    exit 1
fi


lastseq
seq="$?"
echo $seq
mkdir ".$backdir.$seq"
for f in `ls`
do
    cp -rf "$f" "./.$backdir.$seq"
done
echo "Creating snapshot $seq"


for f1 in `ls ".$backdir.$1"`
do 
    echo $f1
    cp -rf "$f1" "./"
done
 echo "Restoring snapshot $1"



