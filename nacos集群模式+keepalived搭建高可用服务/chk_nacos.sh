#!/bin/bash
COUNT=$(ps -ef | grep nacos |grep -v "chk_nacos" | grep -v "grep" | wc -l )
echo "nacos服务数量为：$COUNT"
#判断nacos 是否都挂掉了
if [ $COUNT -lt 1 ]; then    
   echo “nacos服务失败，让出master”
   exit 1
else
   echo "检测成功"
   exit 0
fi