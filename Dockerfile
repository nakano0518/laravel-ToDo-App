FROM php:7.3-fpm

RUN apt-get update \
	&& apt-get install -y wget git unzip libpq-dev \
	&& : 'Install PHP Extensions' \
	&& docker-php-ext-install -j$(nproc) pdo_pgsql

RUN apt-get -y install postgresql

RUN curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/local/bin/composer

WORKDIR /var/www/html/todos