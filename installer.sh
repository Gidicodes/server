sudo echo  "alias new_laravel=\"bash $PWD/laravel.sh\"" > ~/.bashrc
sudo echo  "alias laravel_file=\"bash $PWD/laravel-file.sh\"" > ~/.bashrc
sudo echo  "alias install_nginx=\"bash $PWD/nginx.sh\"" > ~/.bashrc
sudo echo  "alias install_mysql=\"bash $PWD/mysql.sh\"" > ~/.bashrc
sudo echo  "alias install_certbot=\"bash $PWD/certbot.sh\"" > ~/.bashrc
sudo echo  "alias install_composer=\"bash $PWD/composer.sh\"" > ~/.bashrc
sudo echo  "alias install_php=\"bash $PWD/php7.4.sh\"" > ~/.bashrc
sudo echo  "alias install_php8=\"bash $PWD/php8.sh\"" > ~/.bashrc
sudo echo  "alias addCron=\"bash $PWD/cron.sh\"" > ~/.bashrc
sudo echo  "alias newDB=\"bash $PWD/create-mysql.sh\"" > ~/.bashrc
sudo echo  "alias newSupervisor=\"bash $PWD/supervisor.sh\"" > ~/.bashrc
sudo rm "$PWD/installer.sh"