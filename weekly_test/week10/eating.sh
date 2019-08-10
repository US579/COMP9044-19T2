#!/bin/sh

cat $1 | egrep '"name":'| cut -d":" -f2 | cut -d"," -f1 | sed s/\"// | sed s/\"$// | sort | uniq
