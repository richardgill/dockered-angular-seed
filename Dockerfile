# Web development environment in node et. al.

FROM lgsd/docker-rails
MAINTAINER Richard Gill <richard@rgill.co.uk>

RUN apt-get update -y && apt-get install --no-install-recommends -y -q curl python build-essential git ca-certificates

RUN mkdir /nodejs && curl http://nodejs.org/dist/v0.10.29/node-v0.10.29-linux-x64.tar.gz | tar xvzf - -C /nodejs --strip-components=1

ENV PATH /nodejs/bin:$PATH

# Grunt needs git
    RUN apt-get -y install git

# Install Sass

    RUN bash -l -c "gem install sass"

RUN npm cache clean
# Install coffee-script
  RUN npm install -g coffee-script

# Install grunt
  RUN npm install -g grunt-cli

# Install Bower
  RUN npm install -g bower

# Install Karma-cli
  RUN npm install -g karma-cli

# Install protractor
  RUN npm install -g protractor

# Install JFK which protractor needs to work
  RUN apt-get -y install openjdk-7-jre-headless

# Setup firefox + a display to run tests.
run     apt-get install -y x11vnc xvfb
run     mkdir ~/.vnc
# Setup a password
run     x11vnc -storepasswd 1234 ~/.vnc/passwd

ENV DISPLAY :99
ENV NODE_ENV development

RUN mkdir /tmp/node_modules
RUN mkdir /tmp/bower_components

# Expose the port
EXPOSE 9000
EXPOSE 9876
EXPOSE 35729
EXPOSE 4444
EXPOSE 80
