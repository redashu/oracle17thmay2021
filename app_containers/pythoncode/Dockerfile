FROM  oraclelinux:8.3 
# choosing OL as docker image OS
#  image we are choosing it must be present in Docker HUB
# FROM instruction will pull the image from DOCKER HUB
MAINTAINER  ashutoshh@linux.com

# image builder info (optional field)
RUN  dnf  install python3 -y
# DNF is an automated installer in OL 
# DNF will download python and install it from Oracle registry
# RUN will be giving a temporary shell to execute INStruction
RUN  mkdir  /mycode
#  creating directory to copy code here
COPY  hello.py  /mycode/hello.py
#  copy data from Docker client to Docker Engine 
# under that image -- that is getting build
CMD  ["python3","/mycode/hello.py"]
# So this is for running code 
# BUt only as parent process
# CMD is going to decide default parent process for 
# this new image 


