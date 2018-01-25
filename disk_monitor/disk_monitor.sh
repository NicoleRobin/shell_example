#!/bin/sh

MAIN_PATH="/home/zhangjianwei/github/shell_example/"
LIST=`ls ${MAIN_PATH}`
for file in ${LIST}; do
	echo ${file} `du -sh ${MAIN_PATH}${file} | awk '{print $1}'`
done
