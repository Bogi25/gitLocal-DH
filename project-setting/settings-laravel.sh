#!/bin/bash
mkdir /var/www/nginx-config
cp /var/www/nginx-temp/default.conf /var/www/nginx-config/default.conf 
sleep 60

COMPOSER_ALLOW_SUPERUSER=1
rm /var/www/boilerplate/composer.lock
cd /var/www/boilerplate
composer self-update
composer self-update --2.2 
composer install --no-interaction

php artisan key:generate

php artisan migrate

php artisan db:seed

php artisan storage:link

echo "end setting php"
chown -R www-data:www-data /var/www/
php-fpm -F
