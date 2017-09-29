FROM hub.c.163.com/zengdongbao/php7-alpine:latest

USER root

RUN cd /bin \
    && php -r "copy('https://phar.phpunit.de/phpunit-6.3.phar', 'phpunit');" \
    && chmod +x phpunit

VOLUME ["/home/www-data","/etc/php7/conf.d","/etc/php7/php-fpm.d"]

COPY php.ini /etc/php7/php.ini
COPY php-fpm.conf /etc/php7/php-fpm.conf
COPY www.conf /etc/php7/php-fpm.d/www.conf



