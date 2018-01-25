#!/bin/sh

CREATE_SEND_MAIL="CREATE TABLE send_mail_%s (
  uid int(11) NOT NULL COMMENT 'Uid',
  mailbox char(20) NOT NULL COMMENT '邮箱名',
  from_user char(100) NOT NULL COMMENT '发件人',
  to_user char(100) NOT NULL COMMENT '收件人',
  send_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '邮件接收时间',
  subject varchar(1024) DEFAULT NULL COMMENT '标题'
);"
DROP_SEND_MAIL="DROP TABLE IF EXISTS send_mail_%s;"

CREATE_RECV_MAIL="CREATE TABLE recv_mail_%s (
  uid int(11) NOT NULL COMMENT 'Uid',
  mailbox char(20) NOT NULL COMMENT '邮箱名',
  from_user char(100) NOT NULL COMMENT '发件人',
  to_user char(100) NOT NULL COMMENT '收件人',
  recv_time timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '邮件接收时间',
  subject varchar(1024) DEFAULT NULL COMMENT '标题'
);"
DROP_RECV_MAIL="DROP TABLE IF EXISTS recv_mail_%s;"

CREATE_SEND="create_send_mail_tables.sql"
DROP_SEND="drop_send_mail_tables.sql"
CREATE_RECV="create_recv_mail_tables.sql"
DROP_RECV="drop_recv_mail_tables.sql"
rm ${CREATE_SEND} ${DROP_SEND} ${CREATE_RECV} ${DROP_RECV}

for((i=0; i<100; i++)); 
do
	printf "${CREATE_SEND_MAIL}\n" ${i} >> ${CREATE_SEND}
	printf "${DROP_SEND_MAIL}\n" ${i} >> ${DROP_SEND}
	printf "${CREATE_RECV_MAIL}\n" ${i} >> ${CREATE_RECV}
	printf "${DROP_RECV_MAIL}\n" ${i} >> ${DROP_RECV}
done
