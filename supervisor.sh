#!/bin/bash
echo "Welcome to supervisor"
echo "What will you like to do"
echo "1. Install Supervisor"
echo "2. Add new config"
read r

if [[ "$r" == "1" || "$r" == "2" ]]; then
  if [[ $r == "1" ]]; then
    sudo apt update
    sudo sudo apt install supervisor -y
  else
    echo "Enter config/project name"
    read name
    echo "Enter project path"
    read path
    echo "Enter username path"
    read user
    echo "[program:$name]
process_name=%(program_name)s_%(process_num)02d
command=php $path/artisan queue:work --sleep=3 --tries=3
autostart=true
autorestart=true
user=$user //don't use root
numprocs=8
redirect_stderr=true
stdout_logfile=$path/storage/logs/worker.log" >"./$name.conf"
    sudo supervisorctl reread
    sudo supervisorctl update
    sudo supervisorctl start all
  fi
else
  echo "Wrong selection"
  die 0
fi
