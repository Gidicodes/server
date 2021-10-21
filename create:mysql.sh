#!/usr/bin/env bash
echo "Enter database name"
read name
echo "Enter username"
read user

mysql -u "${user}" -p  -e "CREATE DATABASE IF NOT EXISTS \`$name\` DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_unicode_ci";
