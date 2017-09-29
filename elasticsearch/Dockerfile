FROM hub.c.163.com/library/elasticsearch:5.5.2-alpine

#设置alpine的仓库源
RUN  { \
        echo 'https://mirror.tuna.tsinghua.edu.cn/alpine/latest-stable/main/'; \
        echo 'https://mirror.tuna.tsinghua.edu.cn/alpine/latest-stable/community/'; \
    } | tee /etc/apk/repositories


RUN set -e \
    && cd /tmp \
    && apk -U add openssl ca-certificates wget \
    && update-ca-certificates \
    && wget https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v5.5.2/elasticsearch-analysis-ik-5.5.2.zip \
    && unzip elasticsearch-analysis-ik-5.5.2.zip \
    && mv elasticsearch /usr/share/elasticsearch/plugins/ik \
    && rm -r /tmp/elasticsearch-analysis-ik-5.5.2.zip


USER elasticsearch












