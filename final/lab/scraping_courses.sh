#!/bin/sh

if test $# -ne 1
then
    echo "Usage:$0 <string>"
    exit 1;
fi

string=$1
flag=${string:0:1}
echo $flag
pg="http://legacy.handbook.unsw.edu.au/vbook2018/brCoursesByAtoZ.jsp?StudyLevel=Postgraduate&descr=$flag"
wget -q -O-  url $pg
