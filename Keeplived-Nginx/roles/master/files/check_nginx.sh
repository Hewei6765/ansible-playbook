#!/bin/bash
COUNT=$(ps -C nginx --no-header |wc -l)
echo $COUNT
# 判断Nginx 是否都挂掉了
if [ $COUNT -eq 0 ];then
#如果挂掉了，就启动nginx
    docker restart nginx
    echo "重启nginx"
    #等5秒钟后，再次查看是否 启动成功
    sleep 2
    #如果nginx没有启动起来，就直接干掉keepalived
    COUNT=$(ps -C nginx --no-header |wc -l)
    if [ $COUNT -eq 0 ];then
        echo "干掉keepalived"
        systmctl stop keepalived
    fi
else
    echo "nginx 服务是正常的"
fi
