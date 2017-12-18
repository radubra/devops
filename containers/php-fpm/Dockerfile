FROM php:7.1-fpm

RUN pecl install redis-3.1.4 \
    && pecl install xdebug-2.5.0 \
    && docker-php-ext-enable redis xdebug

COPY ./conf/www.conf /usr/local/etc/php-fpm.d/www.conf
COPY ./www/ /var/www/html/
