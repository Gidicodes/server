#!/bin/bash
echo "Enter Project path E.g /var/www/MYPROJECT"
read path
if [[ -d "$path" ]]; then
  echo "Enter App Name E.g(NewsApp) without space"
  read name
  echo "Enter domain names E.g google.com"
  read domain

  echo "Would you like to generate an nginx VHost?
Y|n"
  read s
  if [[ "$s" == "y" || "$s" == "yes" ]]; then
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
" >"/etc/nginx/sites-available/$name"
    sudo ln -s /etc/nginx/sites-available/"$name" /etc/nginx/sites-enabled/
    sudo nginx -t

    echo "Would you like to restart nginx server?
Y|n"
    read r
    if [[ "$r" == "y" || "$r" == "yes" ]]; then
      sudo service nginx restart
    fi
    echo "$name added to sites"
  fi

else
  echo "Error: Directory $path does not exists."
fi
