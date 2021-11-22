#!/bin/bash
sudo apt-get update
sudo apt-get install phpmyadmin
sudo ln -s /usr/share/phpmyadmin /var/www/html
sudo phpenmod mcrypt
sudo systemctl restart php8.0-fpm
