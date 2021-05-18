## Docker day 1 revision 


### COntainer reality 

<img src="real_cont.png">


### more closure look to container 

<img src="conte.png">

###  Docker components 

<img src="compo.png">


## web application. containerization 

### web server understanding 

<img src="web_opts.png">

### apache HTTPD 

<img src="httpd.png">

### Webapp -- containrization 

<img src="webappcont.png">

### Trick to remove containers and images (ALL)

```
10176  docker  rm  $(docker ps -aq) 
10177  docker rmi $(docker images -q) -f

```

### Bulding docker images  for webapp 

```
❯ ls
CODE_OF_CONDUCT.md LICENSE            images             styles
Dockerfile         README.md          index.html
❯ 
❯ docker  build   -t    ashuhttpd:18thmay2021v1  .
Sending build context to Docker daemon  63.49kB
Step 1/5 : FROM oraclelinux:8.3
 ---> 816d99f0bbe8
Step 2/5 : MAINTAINER ashutoshh@linux.com
 ---> Running in 460df8aa26c6
Removing intermediate container 460df8aa26c6
 ---> b760a59e74d3
Step 3/5 : RUN  dnf  install  httpd -y
 ---> Running in 790df0be43c8
Oracle Linux 8 BaseOS Latest (x86_64)            66 MB/s |  32 MB     00:00    
Oracle Linux 8 Application Stream (x86_64)       15 MB/s |  24 MB     00:01    
Last metadata expiration check: 0:00:41 ago on Tue May 18 05:28:00 2021.


```

### checking image build history 

```
❯ docker  history  ashuhttpd:18thmay2021v1
IMAGE          CREATED         CREATED BY                                      SIZE      COMMENT
f152b301212a   3 minutes ago   /bin/sh -c #(nop)  CMD ["httpd" "-DFOREGROUN…   0B        
02b90ab78f62   3 minutes ago   /bin/sh -c #(nop) COPY dir:a10de42d8e22bf749…   57.1kB    
f4402e750aae   3 minutes ago   /bin/sh -c dnf  install  httpd -y               128MB     
b760a59e74d3   6 minutes ago   /bin/sh -c #(nop)  MAINTAINER ashutoshh@linu…   0B        
816d99f0bbe8   4 weeks ago     /bin/sh -c #(nop)  CMD ["/bin/bash"]            0B        
<missing>      4 weeks ago     /bin/sh -c #(nop) ADD file:8d6d5e7607cbe7af8…   224MB    

```

### dumping internal infor about docker images

```
❯ docker   inspect  ashuhttpd:18thmay2021v1
[
    {
        "Id": "sha256:f152b301212ab8a83053052bb8662829258371b7ba78ed531ce7aa9fa38d8572",
        "RepoTags": [
            "ashuhttpd:18thmay2021v1"
        ],
        "RepoDigests": [],
        "Parent": "sha256:02b90ab78f620161d062b5f55abf2ce44fc79f970d4500b751eb08ba53687403",
        "Comment": "",
        "Created": "2021-05-18T05:30:34.292751719Z",
        "Container": "7f4a3a148fd5212af1f1732b19f17f46c7015edcaeba112a7ce29a9f17e221bf",
        "ContainerConfig": {
            "Hostname": "7f4a3a148fd5",
            "Domainname": "",
            "User": "",
            "AttachStdin": false,
            "AttachStdout": false,
            "AttachStderr": false,
            "Tty": false,
            "OpenStdin": false,
            "StdinOnce": false,
            "Env": [
                "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
            ],
            "Cmd": [
```


### filtering out in inspect command 

```
10197  docker   inspect  ashuhttpd:18thmay2021v1   --format='{{.Id}}'
10198  docker   inspect  ashuhttpd:18thmay2021v1   --format='{{.RepoTags}}'
10199  docker   inspect  ashuhttpd:18thmay2021v1   --format='{{.Cmd}}'
10200  docker   inspect  ashuhttpd:18thmay2021v1   --format='{{.ContainerConfig.Cmd}}'


```



