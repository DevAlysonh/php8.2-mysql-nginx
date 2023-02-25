FROM php:8.2-fpm

RUN apt-get update && \
    apt-get install -y libpq-dev libzip-dev && \
    docker-php-ext-install pdo pdo_mysql zip

WORKDIR /var/www/html

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

EXPOSE 9000
