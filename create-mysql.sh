#!/usr/bin/env bash
if [[ "$1" && "$2" && "$3" ]]
	then
	    DB=$3;
	    USER=$1;
	    PASSWORD=$2;
	    mysql -u "${USER}" -p "${PASSWORD}"  -e "CREATE DATABASE IF NOT EXISTS \`$DB\` DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_unicode_ci";
	else
	    echo "Error: missing required parameter."
	    echo "Usage: User, Password, DATABASE NAME"
	fi
