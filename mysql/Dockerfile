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

RUN set -x \
	&& addgroup -g 82 -S mysql \
	&& adduser -u 82 -D -S -G mysql mysql

#install mariadb
RUN apk -U add --no-cache mysql mysql-client \
    && rm -fr /usr/bin/mysql*_embedded /usr/bin/mysql*test*

VOLUME /var/lib/mysql

EXPOSE 3306

COPY run.sh /bin/

ENTRYPOINT ["run.sh"]