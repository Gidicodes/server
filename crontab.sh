#!/bin/bash
title=system
CRON_FILE="./$title"
if [ ! -f "$CRON_FILE" ]; then
  echo "cron file for root does not exist, creating.."
  touch "$CRON_FILE"
  /usr/bin/crontab "$CRON_FILE"
fi

echo "Enter project path"
read path
echo "Enter username"
read user;
echo "* * * * * php $path/artisan schedule:run >> /dev/null 2>&1" >> "$CRON_FILE"
crontab -u "$user" "$CRON_FILE"