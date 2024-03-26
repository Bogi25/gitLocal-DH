#!/bin/bash
rm /var/www/boilerplate/yarn.lock

echo "yarn.lock видалено"
cd /var/www/boilerplate

echo "перейшли во кореневий каталог проекту"
echo "виконуємо yarn install"
yarn install

echo "виконуємо yarn upgrade"
yarn upgrade

echo "виконуємо npm install"
npm install

echo "оновлюємо vue до 3.4.21"
npm install vue@3.4.21

echo "npm audit fix --force"
npm audit fix --force

echo "виконуємо yarn run prod"
yarn run watch

echo "код НОД завершено"


node -e "setInterval(()=> console.log(new Date()), 30000)"