#!/bin/bash
/usr/local/sbin/php-fpm -c /etc/php.ini -y /etc/php-fpm.conf
/usr/local/sbin/nginx

tail -f /var/log/nginx/error.log
