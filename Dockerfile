# Web development environment in node et. al.

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

# Install yeo

RUN npm install -g yo
