#!/bin/bash
echo "Enter Root Username"
read mysql_root_username

echo "Enter username"
read mysql_username

echo "Enter password"
read mysql_password

export DEBIAN_FRONTEND="noninteractive"
sudo debconf-set-selections <<<"mysql-server mysql-server/root_password password $mysql_password"
sudo debconf-set-selections <<<"mysql-server mysql-server/root_password_again password $mysql_password"

sudo apt update
sudo apt install mysql-server -y
sudo mysql_secure_installation

sed -i '/^bind-address/s/bind-address.*=.*/bind-address = */' /etc/mysql/my.cnf

mysql --user="$mysql_root_username" --password="$mysql_password" -e "GRANT ALL ON *.* TO $mysql_root_username@'0.0.0.0' IDENTIFIED BY '$mysql_password';"
mysql --user="$mysql_root_username" --password="$mysql_password" -e "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY '$mysql_password';"
sudo service mysql restart

mysql --user="$mysql_root_username" --password="$mysql_password" -e "CREATE USER '$mysql_username'@'0.0.0.0' IDENTIFIED BY '$mysql_password';"
mysql --user="$mysql_root_username" --password="$mysql_password" -e "GRANT ALL ON *.* TO '$mysql_username'@'0.0.0.0' IDENTIFIED BY '$mysql_password' WITH GRANT OPTION;"
mysql --user="$mysql_root_username" --password="$mysql_password" -e "GRANT ALL ON *.* TO '$mysql_username'@'%' IDENTIFIED BY '$mysql_password' WITH GRANT OPTION;"
mysql --user="$mysql_root_username" --password="$mysql_password" -e "FLUSH PRIVILEGES;"
sudo service mysql restart
