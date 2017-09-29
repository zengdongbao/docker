FROM hub.c.163.com/library/alpine:latest

#设置alpine的仓库源
RUN  { \
        echo 'https://mirror.tuna.tsinghua.edu.cn/alpine/latest-stable/main/'; \
        echo 'https://mirror.tuna.tsinghua.edu.cn/alpine/latest-stable/community/'; \
    } | tee /etc/apk/repositories

#设置用户
RUN set -x \
    && addgroup -g 82 -S www-data \
    && adduser -u 82 -D -S -G www-data www-data

#安装php-cli
RUN apk -U add --no-cache php7 php7-dev

#安装通用扩展
RUN apk -U add --no-cache  \
     php7-bcmath \
     php7-ctype \
     php7-curl \
     php7-dom \
     php7-fileinfo \
     php7-fpm \
     php7-gettext \
     php7-iconv \
     php7-intl \
     php7-json \
     php7-mbstring \
     php7-memcached \
     php7-mysqli \
     php7-opcache \
     php7-openssl \
     php7-pcntl \
     php7-posix \
     php7-phar \
     php7-pdo \
     php7-pdo_mysql \
     php7-shmop \
     php7-soap \
     php7-session \
     php7-simplexml \
     php7-sysvsem \
     php7-sqlite3 \
     php7-sockets \
     php7-tokenizer \
     php7-redis \
     php7-xml \
     php7-xmlreader \
     php7-xmlrpc \
     php7-xmlwriter \
     php7-xsl \
     php7-zip \
     php7-zlib

#gd
RUN apk -U add --no-cache \
    libpng-dev \
    php7-gd



#composer
RUN php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');"
RUN mv composer.phar /bin/composer \
    && chmod +x /bin/composer

#设置用户和主目录
USER www-data
WORKDIR /home/www-data

#设置composer国内源
RUN composer config -g repo.packagist composer https://packagist.phpcomposer.com

EXPOSE 9000

