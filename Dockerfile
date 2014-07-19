# Web development environment in node et. al.

# Build: sudo docker build -t rgill/angular-webui .
# Development: sudo docker run -v $PWD/web:/mount/angular-webui -p 9000:9000 -p 35729:35729 -e IP=$(hostname -I | awk '{print $1}') -i -t rgill/angular-webui bash
#							 cd /mount/workspace/
#							 npm install
#							 grunt serve

FROM lgsd/docker-rails
MAINTAINER Richard Gill <richard@rgill.co.uk>
# Web development environment in node et. al.

# Build: sudo docker build -t peenuty/nodej-npm-sass-docker .


FROM peenuty/rails-passenger-nginx-docker-i:1.0.1
MAINTAINER Richard Gill <peenuty@gmail.com>

RUN apt-get update -y && apt-get install --no-install-recommends -y -q curl python build-essential git ca-certificates

RUN mkdir /nodejs && curl http://nodejs.org/dist/v0.10.29/node-v0.10.29-linux-x64.tar.gz | tar xvzf - -C /nodejs --strip-components=1

ENV PATH /nodejs/bin:$PATH

# Grunt needs git
    RUN apt-get -y install git

# Install Sass

    RUN bash -l -c "gem install sass"

RUN npm cache clean

# Install grunt
    RUN npm install -g grunt-cli

# Install Bower
    RUN npm install -g bower

# Install Karma
  RUN npm install -g karma

# Install protractor
    RUN npm install -g protractor

# Intstall JFK which protractor needs to work
    RUN apt-get -y install openjdk-7-jre-headless

# Setup firefox + a display to run tests.
run     apt-get install -y x11vnc xvfb firefox
run     mkdir ~/.vnc
# Setup a password
run     x11vnc -storepasswd 1234 ~/.vnc/passwd

run 		echo "Xvfb -ac :99 &" > ~/startXserver.sh
RUN     chmod u+x ~/startXserver.sh

ENV DISPLAY :99

RUN mkdir /tmp/node_modules
RUN mkdir /tmp/bower_components

# Expose the port
EXPOSE 9000
EXPOSE 9876
EXPOSE 35729
EXPOSE 4444
EXPOSE 80
