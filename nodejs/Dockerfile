FROM hub.c.163.com/library/node:8.4.0-alpine

#设置alpine的仓库源
RUN  { \
        echo 'https://mirror.tuna.tsinghua.edu.cn/alpine/latest-stable/main/'; \
        echo 'https://mirror.tuna.tsinghua.edu.cn/alpine/latest-stable/community/'; \
    } | tee /etc/apk/repositories


RUN yarn config set registry https://registry.npm.taobao.org \
    && npm config set registry https://registry.npm.taobao.org \
    && npm install -g pm2







