#!/bin/bash
# Usage ./staticd <host> <git> <user>
set -e
WEBDIR="/var/www/$1/public_html"
sudo mkdir -p $WEBDIR
sudo chown $3 $WEBDIR
git clone $2 $WEBDIR
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/$1
sudo ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/
sudo service nginx restart
