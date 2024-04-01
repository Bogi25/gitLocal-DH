#!/bin/bash
rm /var/www/boilerplate/yarn.lock

cd /var/www/boilerplate

echo "yarn install"
yarn install

echo "yarn upgrade"
yarn upgrade

echo "npm install"
npm install

echo "update vue до 3.4.21"
npm install vue@3.4.21

echo "npm audit fix --force"
npm audit fix --force

echo "yarn run prodject"
yarn run watch

node -e "setInterval(()=> console.log(new Date()), 30000)"