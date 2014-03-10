# Web development environment in node et. al.

# Build: sudo docker build -t peenuty/garner-webui .
# Development: sudo docker run -v $PWD/web:/mount/garner-webui -p 9000:9000 -p 35729:35729 -e IP=$(hostname -I | awk '{print $1}') -i -t peenuty/garner-webui bash
#							 cd /mount/workspace/
#							 npm install
#							 grunt serve

FROM peenuty/peenuty/nodejs-npm-sass-docker
MAINTAINER Richard Gill <richard@rgill.co.uk>

# Expose the port
EXPOSE 9000
EXPOSE 9876
EXPOSE 35729
EXPOSE 4444

