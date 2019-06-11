#!/bin/sh

echo "hello"

case $# in 
    1)
        first=1
        increment=1
        last=$1;;
    *)
        echo "Usage: $0 [first] [increement] <last>"
esac




echo "last"

i=$first
while test $i -le $last
do 
  echo $i
  i=`expr $i + 1`
  #i=$(( i + 1 ))
done
