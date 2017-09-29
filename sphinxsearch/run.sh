#!/bin/sh

set -ex

if [ "$CONFILE" = "" ]; then
    echo "Please set config file to start server"
    exit 1
fi

if [ ! -f "$CONFILE" ]; then
    echo "config file not found"
    exit 1
fi

#初始化索引
indexer --all --quiet --config $CONFILE

#启动crond
crond

#定时更新索引
echo "*/15   *   *   *   *   indexer --rotate --quiet --config $CONFILE 1>> /dev/null 2>&1" >> /var/spool/cron/crontabs/root

exec searchd --console --config $CONFILE


