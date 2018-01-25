#!/bin/sh

procname='nginx_auth'
monitor_log="/usr/local/auth/log/monitor.log"
procnum=`ps -ef|grep $procname|grep -v grep|wc -l`
echo `date` "procnum:" $procnum >> $monitor_log
if [[ $procnum -eq 0 ]]; then
	cd /usr/local/auth/
	./$procname & >> $monitor_log 2>&1 &
	procnum=`ps -ef|grep $procname|grep -v grep|wc -l`
	if [[ $procnum -eq 0 ]]; then
		echo "Failed!" >> $monitor_log
	else
		echo "Success!" >> $monitor_log
	fi
fi
