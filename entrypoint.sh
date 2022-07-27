#!/bin/sh -l

echo "$1"
eval $1

if [ $? -eq 0 ];then
   exit 0
else
   exit 1
fi

time=$(date)
echo "::set-output name=time::$time"
