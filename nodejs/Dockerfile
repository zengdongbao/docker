FROM hub.c.163.com/library/node:7.10.0-alpine

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




RUN yarn config set registry https://registry.npm.taobao.org \
    && npm config set registry https://registry.npm.taobao.org \
    && npm install -g pm2







