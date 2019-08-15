#!/bin/bash

cat $i | egrep F$ | cut -d"|" -f2 | sort
