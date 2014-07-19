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
        echo "cd /mount/angular-webui/web && ln -s /tmp/node_modules . && ln -s /tmp/bower_components . && scripts/startXServerForFirefox.sh && npm install && bower install --allow-root && scripts/setupE2ETests.sh"

        echo "\nThen you can do: \n\n"
        echo "grunt serve             -> This will serve the application to http://$IP:8888 open it in your browser :)"
        echo "grunt karma             -> Runs the unit tests and watches for changes."
        echo "grunt protractor:e2e    -> Runs the end to end tests."

SCRIPT

sudo docker run -v $PWD:/mount/angular-webui/ -p 9000:9000 -p 9876:9876 -p 4444:4444 -p 35729:35729 -e IP=$(hostname -I | awk '{print $1}') -i -t angular-webui bash


}
