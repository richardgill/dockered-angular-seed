#!/bin/bash

/opt/nginx/sbin/nginx -c /opt/nginx/conf/nginx.conf && tail -1000f /var/log/nginx/nginx_error.log