FROM php:8.0.0-fpm

RUN apt-get update && apt-get install -y \
        libpng-dev \
        libjpeg-dev \
        libpq-dev \
        libfreetype6-dev \
        zip \
        unzip \
        git \
        curl && \
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install -j$(nproc) gd pdo pdo_mysql pdo_pgsql

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY ./nginx-config /var/www/nginx-temp
COPY ./project-setting /var/www

COPY ./laravel-boilerplate /var/www/boilerplate

RUN mv /var/www/boilerplate/.env.example /var/www/boilerplate/.env
RUN chown -R www-data:www-data /var/www/
WORKDIR /var/www/boilerplate

EXPOSE 9000
CMD ["php-fpm","-F"]
