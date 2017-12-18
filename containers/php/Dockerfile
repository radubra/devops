FROM php:7.1-apache

RUN apt-get update \
    && pecl install redis-3.1.4 \
    && pecl install xdebug-2.5.0 \
    && docker-php-ext-enable redis xdebug

RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.1.0-amd64.deb \
    && dpkg -i filebeat-6.1.0-amd64.deb \
    && update-rc.d filebeat defaults \
    && update-rc.d filebeat enable \
    && mkdir -p /var/log/php_app

RUN cp /etc/apache2/mods-available/proxy.load /etc/apache2/mods-enabled/ \
    && cp /etc/apache2/mods-available/proxy_fcgi.load /etc/apache2/mods-enabled/ \
    && rm -rf /etc/apache2/sites-available/000-default.conf

COPY ./conf/filebeat.yml /etc/filebeat/filebeat.yml
COPY ./conf/000_default.conf /etc/apache2/sites-available/000-default.conf
COPY ./conf/php.ini /usr/local/etc/php/
COPY ./www/ /var/www/html/
