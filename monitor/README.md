# 进程监控脚本

## 功能
利用ps查看进程是否还在，如果不在就重新启动进程，起到监控进程状态并拉起崩溃进程的作用

## 用法
该脚本仅仅是查看进程状态并拉起进程，要想达到定时监控的目的，还需要配合crontab使用，利用crontab -e编辑crontab，并添加如下一行即可：
* * * * * /usr/local/push_server/monitor/monitor.sh
