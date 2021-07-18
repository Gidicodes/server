#!/bin/bash
CRON_FILE="var/spool/cron/root"
if [ ! -f "$CRON_FILE" ]; then
  echo "Cron file for root does not exist, creating.."
  touch "$CRON_FILE"
  /usr/bin/crontab "$CRON_FILE"
fi

echo "Enter project path"
read path
echo "Enter username"
read user;
echo "* * * * * php $path/artisan schedule:run >> /dev/null 2>&1" >> "$CRON_FILE"
crontab -u "$user" "$CRON_FILE"