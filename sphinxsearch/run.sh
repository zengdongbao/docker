#!/bin/sh

if [ ! -d "/etc/periodic/min" ]; then
    mkdir -p /etc/periodic/min
fi

CONFILE=/etc/sphinx.conf

if [ ! -f "$CONFILE" ]; then
    echo "config file not found"
    exit 1
fi

if [ ! -d "/var/lib/sphinx/log" ]; then
    mkdir -p /var/lib/sphinx/log
fi

if [ ! -d "/var/lib/sphinx/data" ]; then
    mkdir -p /var/lib/sphinx/data
fi


#built indexer
indexer --all --quiet --config $CONFILE

#cron job
{
    echo "#!/bin/sh";
    echo "indexer --rotate --quiet --config $CONFILE";
} | tee /etc/periodic/min/sphinx
chmod +x /etc/periodic/min/sphinx
echo "* * * * * run-parts /etc/periodic/min" >> /var/spool/cron/crontabs/root

crond -b

exec searchd --console --config $CONFILE


