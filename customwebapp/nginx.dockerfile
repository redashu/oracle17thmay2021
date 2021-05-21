FROM nginx 
#  this standard image is present in docker hub
MAINTAINER  ashutoshh@linux.com
COPY  ashu.html  /usr/share/nginx/html/index.html
ADD  oke.jpeg  /usr/share/nginx/html/oke.jpeg
# copy and add both are same
# but ADD can take input from URL also 
# while copy can only take from the location where Dockerfile is present
EXPOSE 80 
# these days this is optional 
# CMD / ENTRYPOINT 
# Note: IF we don't define parent process then FROM image
# parent process will be default 
