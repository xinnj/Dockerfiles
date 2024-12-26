#!/bin/sh
set -e

cp -rf /source/fancyindex /data/
mkdir -p /data${URL_PREFIX}download
cp -rf /source/ios-install-images /data${URL_PREFIX}/
chown uploader:uploader /data${URL_PREFIX}
chown -R uploader:uploader /data${URL_PREFIX}/ios-install-images
sed -i -e "s#<URL_PREFIX>#${URL_PREFIX}#g" /etc/nginx/nginx.conf
/usr/sbin/nginx -g 'daemon off;'