FROM office.luoo.net:8000/alpine:latest

#set repositories
RUN  { \
        echo 'http://office.luoo.net/alpine/latest-stable/main/'; \
        echo 'http://office.luoo.net/alpine/latest-stable/community/'; \
        echo 'http://office.luoo.net/alpine/edge/main/'; \
        echo 'http://office.luoo.net/alpine/edge/community/'; \
        echo 'http://office.luoo.net/alpine/edge/testing/'; \
        echo 'http://office.luoo.net/alpine/v3.5/main/'; \
        echo 'http://office.luoo.net/alpine/v3.5/community/'; \
        echo 'https://mirror.tuna.tsinghua.edu.cn/alpine/v3.5/main/'; \
        echo 'https://mirror.tuna.tsinghua.edu.cn/alpine/v3.5/community/'; \
    } | tee /etc/apk/repositories



#install mariadb
RUN apk -U add --no-cache mongodb \
    && mkdir -p /var/lib/mongodb/data \
    && mkdir -p /var/lib/mongodb/logs \
    && chown -R mongodb.mongodb /var/lib/mongodb \
    && { \
       echo 'dbpath=/var/lib/mongodb/data'; \
       echo 'logpath=/var/lib/mongodb/logs/log'; \
    } | tee /etc/mongodb.conf


EXPOSE 27017

VOLUME /var/lib/mongodb

ENTRYPOINT ["mongod"]

CMD ["-f" , "/etc/mongodb.conf"]





