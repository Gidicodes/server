#!/bin/bash
echo "Enter Project path E.g /var/www/path"
read path

if [[ -d "$path" ]]; then
    echo "Path validated"
else
    echo "Path validation failed"
    echo "Enter a git repo to clone to the path"
    read git
    if [[ "$git" ]]; then
    sudo git clone "$git" $path
    fi
fi

echo "Enter App entry file E.g(server.js)"
read index

if [ -f "$path/$index" ]; then
    cd "$path";
    echo "Enter App Name E.g(news_app) without space"
    read name
    echo "Enter user system username not root"
    read user
    sudo npm install pm2@latest -g
    pm2 start "$index"
    pm2 startup systemd
    pm2 save
    sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u "$user" --hp /home/"$user"
    sudo systemctl start pm2-"$user"

    echo "Would you like to generate an nginx VHost?
    Y|n"
    read s

    if [[ "$s" == "y" || "$s" == "yes" || "$s" == "Y"  || "$s" == "YES" || "$s" == "Yes" ]]; then
        echo "Enter domain names E.g google.com for Nginx server_name"
        read domains;
        echo "Enter app port number E.g 3000"
        read port;

        echo "server {
      listen 80;
      server_name $domains;
      location / {

          proxy_pass http: //localhost:$port;
          proxy_http_version 1.1;
          proxy_set_header Upgrade \$http_upgrade;
          proxy_set_header Connection 'upgrade';
          proxy_set_header Host \$host;
          proxy_cache_bypass \$http_upgrade;

          proxy_connect_timeout 60s;
          proxy_read_timeout 5400s;
          proxy_send_timeout 5400s;
          proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
          proxy_set_header X-Real-IP \$remote_addr;
          proxy_redirect default;
      }
}" > "/etc/nginx/sites-available/$name"
        sudo ln -s /etc/nginx/sites-available/"$name" /etc/nginx/sites-enabled/
        sudo nginx -t

        echo "Would you like to restart nginx server?
        Y|n"
        read r
        if [[ "$r" == "y" || "$r" == "yes" || "$r" == "Y" ]]; then
            sudo service nginx restart
        fi
        echo "$name added to sites"
    fi
else
    echo "Entry file does not exist" 
fi
