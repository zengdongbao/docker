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


ENV PHPEXT php

#install php-cli
RUN apk -U add --no-cache php7 php7-dev

#extensions
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
     php7-mongodb \
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


#xdebug
RUN apk -U add --no-cache php7-xdebug \
    && echo 'zend_extension=xdebug.so' >> /etc/php7/php.ini



RUN set -x \
	&& addgroup -g 82 -S www \
	&& adduser -u 82 -D -S -G www www



#composer
COPY src/composer.phar /tmp/
RUN cd /tmp \
    && mv composer.phar /bin/composer \
    && chmod +x /bin/composer


#phpunit
COPY src/phpunit-6.1.4.phar /tmp/
RUN cd /tmp \
    && mv phpunit-6.1.4.phar /bin/phpunit \
    && chmod +x /bin/phpunit


#tideway
COPY src/tideways-php.tar.gz /tmp/
RUN cd /tmp \
    && tar xzvf tideways-php.tar.gz \
    && cd tideways-php-4.1.2 \
    && sh install.sh \
    && echo 'extension=tideways.so' >> /etc/php7/php.ini \
    && rm -fr /tmp/*


EXPOSE 9000

COPY run /bin/

ENTRYPOINT ["run"]