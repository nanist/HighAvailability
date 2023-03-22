#!/bin/bash
#version 0.0.1
#当mysql进程不存在时，会自动重启mysql容器；
A=`ps -ef|grep mysqld|grep -v grep|grep -v bash|wc -l`
if [ $A -eq 0 ];then
     docker restart keepalivedMysql     #重启mysql容器
     sleep 2
     if [ `ps -ef|grep mysqld|grep -v grep|grep -v bash|wc -l` -eq 0 ];then
        systemctl stop keepalived  #停掉keepalived服务
     fi 
fi