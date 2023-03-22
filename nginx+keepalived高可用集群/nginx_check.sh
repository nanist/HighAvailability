#!/bin/bash
#version 0.0.1
#当nginx进程不存在时，会自动重启nginx服务；
A=`ps -C nginx --no-header |wc -l`
if [ $A -eq 0 ];then
     docker restart keepalivedNginx     #重启nginx
     sleep 2
     if [ `ps -C nginx --no-header |wc -l` -eq 0 ];then
        systemctl stop keepalived
     fi 
fi