FROM hub.c.163.com/library/alpine:latest

#设置alpine的仓库源
RUN  { \
        echo 'https://mirror.tuna.tsinghua.edu.cn/alpine/latest-stable/main/'; \
        echo 'https://mirror.tuna.tsinghua.edu.cn/alpine/latest-stable/community/'; \
    } | tee /etc/apk/repositories


RUN apk -U add --no-cache sphinx


COPY run.sh /bin/run


EXPOSE 9312


VOLUME ["/var/lib/sphinx","/etc/sphinx"]


RUN chmod +x /bin/run


ENTRYPOINT ["run"]









