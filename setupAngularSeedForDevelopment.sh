#!/bin/sh
{
    echo "This script requires superuser access"
    echo "You will be prompted for your password by sudo."

    # clear any previous sudo permission
    sudo -k

    # run inside sudo
    sudo sh <<SCRIPT
        echo "Building angular webui docker instance"
        docker build -t angular-webui .

        echo "Running container"


        echo "You need to run:\n"
        # npm and bower try to chown things... this causes alot of problems with docker, so we symblink the directories so they are local and not mounted.
        echo "cd /mount/angular-webui/web && ln -s /tmp/node_modules . && ln -s /tmp/bower_components . && npm install && bower install --allow-root && grunt serve"

SCRIPT

sudo docker run -v $PWD:/mount/angular-webui/ -p 9000:9000 -p 9876:9876 -p 35729:35729 -e IP=$(hostname -I | awk '{print $1}') -i -t angular-webui bash


}
