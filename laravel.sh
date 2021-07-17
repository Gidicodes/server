#!/bin/bash
echo "Enter host name"
read name
echo "Enter project path"
read path
echo "Enter domain names"
read domain
echo "Enter username"
read user
echo "Enter password"
read pass

mysql -u "${user}" -p "${pass}"  -e "CREATE DATABASE IF NOT EXISTS \`$name\` DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_unicode_ci";

sudo composer install --ignore-platform-reqs

echo "APP_NAME=$name
APP_ENV=project
APP_KEY=
APP_DEBUG=false
APP_URL=http://$domain

LOG_CHANNEL=stack

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=$name
DB_USERNAME=$user
DB_PASSWORD=$pass

BROADCAST_DRIVER=log
CACHE_DRIVER=file
QUEUE_CONNECTION=sync
SESSION_DRIVER=file
SESSION_LIFETIME=120

REDIS_HOST=127.0.0.1
REDIS_PASSWORD=null
REDIS_PORT=6379

MAIL_DRIVER=smtp
MAIL_HOST=smtp.mailtrap.io
MAIL_PORT=2525
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null

PUSHER_APP_ID=
PUSHER_APP_KEY=
PUSHER_APP_SECRET=
PUSHER_APP_CLUSTER=mt1

MIX_PUSHER_APP_KEY=\"\${PUSHER_APP_KEY}\"
MIX_PUSHER_APP_CLUSTER=\"\${PUSHER_APP_CLUSTER}\"
" >"$path/.env";

php artisan key:generate;

sudo chmod -R 777 storage;

echo "server{
    root $path/public;
    index index.php index.html index.htm index.nginx-debian.html;
    server_name $domain;

    add_header X-XSS-Protection \"1; mode=block\" always;
    add_header X-Content-Type-Options nosniff always;
    add_header X-Frame-Options \"DENY\" always;
    add_header Referrer-Policy no-referrer-when-downgrade always;

    server_tokens off;
    charset utf-8;

    location = /favicon.ico {
        access_log off; log_not_found off;
    }

    location / {
        try_files \$uri \$uri/ /index.php\$is_args\$args;
    }

    location ~ \.php$ {
       fastcgi_pass unix:/run/php/php7.4-fpm.sock;
       fastcgi_split_path_info ^(.+\.php)(/.+)$;
       fastcgi_index index.php;
       fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
       include fastcgi_params;
    }
    location ~ /\.ht {
        deny all;
    }
    location = /xmlrpc.php {
        deny all;
    }
    location ~ /\.(?!well-known).* {
        deny all;
    }
}
" > "/etc/nginx/sites-available/$name"
sudo ln -s /etc/nginx/sites-available/"$name" /etc/nginx/sites-enabled/
sudo nginx -t

echo "Would you like to restart nginx server?
Y|n"
read r

if [[ "$r" == "y" || "$r" == "yes" ]]; then
  sudo service nginx restart
fi
echo "$name added to sites"
