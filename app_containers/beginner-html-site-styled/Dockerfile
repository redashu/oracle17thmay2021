FROM oraclelinux:8.3
# Pulling OL docker image from Docker HUB
# If not present in Docker engine 
MAINTAINER ashutoshh@linux.com
# contact me if any help required
RUN  dnf  install  httpd -y
# DNF is an installer of OL like YUM 
COPY  . /var/www/html/
# COpy all the code / data from current location
# to /var/www/html/ in DOcker ENgine 
CMD ["httpd","-DFOREGROUND"]
# default parent process is to start webserver 