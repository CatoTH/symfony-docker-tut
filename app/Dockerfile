FROM php:8.1-fpm


RUN apt-get update && apt install -y zlib1g-dev g++ git libicu-dev zip libzip-dev zip \
    && docker-php-ext-install intl opcache pdo pdo_mysql \
    && docker-php-ext-configure zip \
    && docker-php-ext-install zip

WORKDIR /var/www/symfony_docker

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . /var/www/symfony_docker

RUN mkdir /var/www/symfony_docker/vendor /var/www/symfony_docker/var
RUN chown www-data:www-data /var/www/symfony_docker/vendor /var/www/symfony_docker/var

USER www-data
RUN /usr/local/bin/composer install