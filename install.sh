#!/bin/bash
# X Ubuntu 14.04.
if [ "`lsb_release -is`" == 'Ubuntu' ]; then
sudo apt-get purge --remove nginx
echo "deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx" >> /etc/apt/sources.list.d/nginx.http2.list
echo "deb-src http://nginx.org/packages/mainline/ubuntu/ trusty nginx" >> /etc/apt/sources.list.d/nginx.http2.list
wget -q -O- http://nginx.org/keys/nginx_signing.key | sudo apt-key add -
sudo apt-get update; apt-get upgrade -y
apt-get install nginx -y
service nginx stop; service apache2 stop
apt-get install build-essential libssl-dev openssl nano git wget curl -y
echo "Wrote Domain Name example.com For SSL CRT! (And Hit Enter)"
read domain
echo "Starting To Generate Private Key for $domain..."
openssl genrsa -out /etc/ssl/private/$domain.key 2048
echo "Generating the Certificate Signing Request For $domain..."
openssl req -new -key /etc/ssl/private/$domain.key -out /etc/ssl/private/$domain.csr
chmod 0400 /etc/ssl/private/$domain.*
cd ~/
git clone https://github.com/letsencrypt/letsencrypt
cd ~/letsencrypt
./letsencrypt-auto --help
./letsencrypt-auto certonly --standalone -d $domain
echo "**********************************************"
echo "**********************************************"
echo "**********************************************"
echo "KEY INTO /etc/ssl/private/ DIR"
echo "CRT INTO /etc/letsencrypt/live/$domain/ DIR"
else 
   This Script is only for ubuntu 14.04. 
   For problems or different distro create a issue!
fi
