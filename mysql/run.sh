#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
    mkdir -p /run/mysqld
    chown -R mysql:mysql /run/mysqld
fi

DATADIR=/var/lib/mysql

if [ ! -d "${DATADIR}/mysql" ]; then

    echo "[i] MySQL data directory not found, creating initial DBs"

    chown -R mysql:mysql $DATADIR

    mysql_install_db --user=mysql > /dev/null


    mysqld --basedir=/usr --datadir=$DATADIR  --user=mysql --socket=/run/mysqld/mysqld.sock --port=3306  &
    pid="$!"

    for i in `seq 0 30`; do
        if echo 'SELECT 1' | mysql -uroot &> /dev/null; then
            break
        fi
        echo 'MySQL init process in progress...'
        sleep 1
    done

    if [ "$i" = 30 ]; then
        echo >&2 'MySQL init process failed.'
        exit 1
    fi


    if [ "$MYSQL_ROOT_PASSWORD" = "" ]; then
        MYSQL_ROOT_PASSWORD="123456"
        echo "MySQL root Password: $MYSQL_ROOT_PASSWORD"
    fi

    echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION;GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}' WITH GRANT OPTION; FLUSH PRIVILEGES;" | mysql -uroot

    echo "try kill process id: $pid"
    kill -9 $pid

    for j in `seq 0 4`; do
        re=$(ps aux|grep mysqld|grep -v grep|wc -l)

        if [ "$re" = 0 ]; then
            echo "MySQL process killed!"
            break
        fi

        echo "try killing process..."
        sleep 1
    done

    if [ "$j" = 4 ]; then
        echo >&2 'MySQL kill process failed.'
        exit 1
    fi

fi



exec mysqld_safe