#!/bin/bash
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt install php8.0 php8.0-common -y
sudo apt install php8.0-fpm php8.0-mysql php8.0-redis php8.0-imagick php8.0-curl php8.0-bcmath php8.0-xmlrpc php8.0-gd php8.0-mysql php8.0-dom php8.0-cli php8.0-json php8.0-common php8.0-mbstring php8.0-opcache php8.0-readline php8.0-zip php8.0-soap php8.0-mongodb php8.0-xml php8.0-pear -y
echo "To verify just run following command"
echo "php -m"
echo "php --ini