#!/bin/sh

while read line
do
	#echo $line
	echo `echo $line | base64 -`
done < $1
