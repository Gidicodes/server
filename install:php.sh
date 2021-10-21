#!/bin/bash
sudo apt update
sudo apt install php php-fpm php-redis php-imagick php-curl php-bcmath php-xmlrpc php-gd php-mysql php-dom php-cli php-json php-common php-mbstring php-opcache php-readline php-zip php-soap php-mongodb php-xml php-pear -y
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt install php7.4 php7.4-gd php7.4-common -y

echo "To verify just run following command"
echo "php -m"
echo "php --ini

sudo apt install php8.0-fpm