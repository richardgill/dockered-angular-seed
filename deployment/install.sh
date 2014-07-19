#!/bin/bash

cd /tmp/
git clone git@bitbucket.org:rgill/garner-webui.git
cd /tmp/garner-webui/web/
npm install
bower install --allow-root
grunt
mv /tmp/garner-webui/web/app/* /var/www/garner-webui/
