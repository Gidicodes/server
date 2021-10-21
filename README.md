# Overview
Scripts to help during server setup for project hosted on Ubuntu server.
These scripts are for installing dependencies, configuring Cron Job. 

# Requirments
* Ubuntu Server Min:16.04 


# Configure Scripts
These scripts were intended to be run as the root user.
1. Change directory to `~`
```
cd ~
```
2. Clone the repository into `~/server`
```bash
git clone https://github.com/gidicodes/server.git
```

> Note: the scripts must be cloned into the any other folder, but we recommend `~/server`

### Check for help
```bash
bash help.sh
```
### Install LEMP Stack
LEMP stands for Linux, Nginx (Engine-X), MariaDB/MySQL and PHP.
```bash
bash install:lemp.sh
```
Run to install all required dependencies and configure the server for production.

### Install NGINX Server 
```bash
bash install:nginx.sh
```
### Install MariaDB
```bash
bash install:maria.sh
```
### Install MySQL
```bash
bash install:mysql.sh
```
### Install PostgreSQL
```bash
bash install:postgres.sh
```
 
### Install PHP
```bash
bash install:php.sh
````

### Install PHP 7.4
```bash
bash install:php7.sh
```
### Install Node
```bash
bash install:node.sh
```
 
### Install Composer
```bash
bash install:composer.sh
```
 
### Install MongoDB
```bash
bash install:mongo.sh
```
 
### Install Certbot
```bash
bash install:certbot.sh
```

## Laravel Projects
#### Setup Laravel Project
```bash
bash laravel.sh
```
#### Add Cron Job for Laravel Project
```bash
bash add:cron.sh
```

#### Run Supervisor
```bash
bash supervisor.sh
```
#### Create a new Nginx Host
```bash
bash nginx:host.sh
```
#### Configure Laravel File Permissions
```bash
bash laravel:file.sh
```


## Express, NodeJS Projects
```bash
bash setup:express.sh
```
 

 