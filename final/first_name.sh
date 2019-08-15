#!/bin/bash
cat $1 | egrep "COMP[29]041" | cut -d"|" -f3 | sed -e "s/.*, //" | sed "s/ .*//" | sort | uniq -c |sort | tail -1 | sed "s/.* //"
