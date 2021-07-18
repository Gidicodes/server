#!/bin/bash
echo "What the project path"
read myproject;

cd "$myproject/.."
sudo find "$myproject" -type f -exec chmod 664 {} \;
sudo find "$myproject" -type d -exec chmod 775 {} \;

cd "$myproject"
sudo chgrp -R www-data storage bootstrap/cache
sudo chmod -R ug+rwx storage bootstrap/cache

cd "$myproject"
sudo rm -rf storage/logs/*.log
sudo chmod g+s storage/logs/
sudo setfacl -d -m g::rwx storage/logs/

sudo php artisan storage:link
