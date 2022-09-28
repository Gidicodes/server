#!/bin/bash
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:ondrej/nginx
sudo apt-get update
sudo apt install php8.1-fpm
sudo apt install php8.1-common php8.1-mysql php8.1-xml php8.1-xmlrpc php8.1-curl php8.1-gd php8.1-imagick php8.1-cli php8.1-dev php8.1-imap php8.1-mbstring php8.1-opcache php8.1-soap php8.1-zip php8.1-redis php8.1-intl -y
echo "===============================DONE INSTALLING PHP8.1===================================="
