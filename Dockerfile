# Web development environment in node et. al.

# Build: sudo docker build -t peenuty/garner-webui .
# Development: sudo docker run -v $PWD/web:/mount/garner-webui -p 9000:9000 -p 35729:35729 -e IP=$(hostname -I | awk '{print $1}') -i -t peenuty/garner-webui bash
#							 cd /mount/workspace/
#							 npm install
#							 grunt serve

FROM peenuty/nodejs-npm-sass-docker
MAINTAINER Richard Gill <richard@rgill.co.uk>


# Set up the public / private key (bitbucket has public key added https://confluence.atlassian.com/display/BITBUCKET/Set+up+SSH+for+Git)
ADD ./deployment/ssh/id_rsa /root/.ssh/id_rsa 
RUN chmod 400 /root/.ssh/id_rsa
ADD ./deployment/ssh/id_rsa.pub /root/.ssh/id_rsa.pub 

# Stop ssh from prompting yes/no to allow key.
ENV BITBUCKET bitbucket.org
ENV KNOWN_HOSTS /root/.ssh/known_hosts

RUN touch $KNOWN_HOSTS
RUN ssh-keygen -R $BITBUCKET
RUN ssh-keyscan -H $BITBUCKET >> $KNOWN_HOSTS

ADD deployment/nginx.conf /opt/nginx/conf/nginx.conf
RUN mkdir -p /var/log/nginx/

RUN mkdir ~/scripts
RUN mkdir -p /var/www/garner-webui
ADD deployment/install.sh /scripts/install.sh
RUN chmod 777 /scripts/install.sh
ADD deployment/run.sh /scripts/run.sh
RUN chmod 777 /scripts/run.sh



# Expose the port
EXPOSE 9000
EXPOSE 9876
EXPOSE 35729
EXPOSE 4444
EXPOSE 80
