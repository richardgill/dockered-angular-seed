# Web development environment in node et. al.

# Build: sudo docker build -t peenuty/garner-webui .
# Development: sudo docker run -v /media/sf_Workspace/:/mount/sf_Workspace/:rw -i -t -p 9000:9000 peenuty/garner-webui bash
#							 bower --allow-root install

FROM ubuntu:12.04
MAINTAINER Richard Gill <richard@rgill.co.uk>

# Install Node

	# GET NODE INSTALL DEPS
	RUN       apt-get update --fix-missing
	RUN       apt-get install -y build-essential python wget

	ENV 			NODE_VERSION 0.10.26

	RUN       wget http://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION.tar.gz
	RUN       tar -zxvf node-v$NODE_VERSION.tar.gz
	RUN       rm node-v$NODE_VERSION.tar.gz
	WORKDIR   node-v0.10.26

	# INSTALL NODE
	RUN       ./configure
	RUN       make
	RUN       make install

	# CLEAN UP
	WORKDIR   ..
	RUN       rm -r node-v$NODE_VERSION
	RUN       apt-get remove -y build-essential python wget

# Grunt needs git
	RUN apt-get -y install git 

# Install yeo

	RUN npm install -g yo

	# Get angular generator
	RUN npm install -g generator-angular

	# Add a yeoman user because grunt doesn't like being root
	RUN adduser --disabled-password --gecos "" yeoman; \
		echo "yeoman ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
	
	ENV HOME /home/yeoman
	USER yeoman
	WORKDIR /home/yeoman

USER root

# Setup firefox + a display to run tests.
run     apt-get install -y x11vnc xvfb firefox
run     mkdir /.vnc
# Setup a password
run     x11vnc -storepasswd 1234 ~/.vnc/passwd



# Expose the port
EXPOSE 9000

