#!/bin/sh

monitor_log="/usr/local/push_server/log/monitor.log"
procnum=`ps -ef|grep "dovecot_push_server"|grep -v grep|wc -l`
echo `date` "procnum:" $procnum >> $monitor_log
if [[ $procnum -eq 0 ]]; then
	cd /usr/local/push_server/bin
	./dovecot_push_server >> $monitor_log 2>&1 &
	procnum=`ps -ef|grep "dovecot_push_server"|grep -v grep|wc -l`
	if [[ $procnum -eq 0 ]]; then
		echo "Failed!" >> $monitor_log
	else
		echo "Success!" >> $monitor_log
	fi
fi
