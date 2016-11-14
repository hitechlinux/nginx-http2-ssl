#!/bin/bash
apt-get update; apt-get upgrade -y
apt-get purge --remove nginx
echo "
deb http://nginx.org/packages/mainline/ubuntu/ trusty nginx
deb-src http://nginx.org/packages/mainline/ubuntu/ trusty nginx
" >> /etc/apt/sources.list.d/nginx.http2.list
apt-get update; apt-get install nginx -y
