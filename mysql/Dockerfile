FROM hub.c.163.com/library/alpine:latest

#设置alpine的仓库源
RUN  { \
        echo 'https://mirror.tuna.tsinghua.edu.cn/alpine/latest-stable/main/'; \
        echo 'https://mirror.tuna.tsinghua.edu.cn/alpine/latest-stable/community/'; \
    } | tee /etc/apk/repositories

RUN set -x \
	&& addgroup -g 82 -S mysql \
	&& adduser -u 82 -D -S -G mysql mysql

#install mariadb
RUN apk -U add --no-cache mysql mysql-client \
    && rm -fr /usr/bin/mysql*_embedded /usr/bin/mysql*test*

VOLUME /var/lib/mysql

EXPOSE 3306

COPY run.sh /bin/
COPY my.cnf /etc/mysql/

ENTRYPOINT ["run.sh"]