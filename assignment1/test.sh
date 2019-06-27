#!/bin/bash

#for f in `ls`
#do 
#    echo $f
#done


echo "--force" | grep "\-\-force"
sin=$?
if [ $sin  ]
then
    echo "true"
else
    echo "flase"
fi
