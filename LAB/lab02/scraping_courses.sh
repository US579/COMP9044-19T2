#!/bin/bash

if [ $# != 1 ]
then
   echo "Usage: "$0" <prefix>"
   exit 1
fi
string=$1
flag=${string:0:1}
pg="http://legacy.handbook.unsw.edu.au/vbook2018/brCoursesByAtoZ.jsp?StudyLevel=Postgraduate&descr=$flag"
ug="http://legacy.handbook.unsw.edu.au/vbook2018/brCoursesByAtoZ.jsp?StudyLevel=Undergraduate&descr=$flag"


wget -q -O- url $pg $ug | egrep "$1[0-9]{4}.html" | sed "s/.*\($1[0-9]\{4\}\).html[^>]*>*\([^<]*\).*/\1 \2/" | sed 's/ *$//'| sort | uniq 
