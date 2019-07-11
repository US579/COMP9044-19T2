#!/bin/bash

for i in `ls | grep "test*"`
do
    sh $i
done
