## Getting started with Docker -- the container platform.

## who can attend

<img src="at.png">

### app deployment problems in past

<img src="app_prob.png">

### solution by Hypervisor 

<img src="hyper.png">


### limitations with Hypervisor technology 

<img src="vmlimit.png">


## Solution to above discussed problem is COntainers 

<img src="cont.png">


# INtroduction to containers 

<img src="contplt.png">

## Container finally 

<img src="container.png">

## Docker info 

<img src="info.png">

## Installation info 

<img src="install.png">

## Docker Desktop info 

<img src="dd.png">

## Docker desktop download link 

### FOR MAC 

[docker desktop](https://hub.docker.com/editions/community/docker-ce-desktop-mac)

### WIndows 10 

[Docker Desktop](https://docs.docker.com/docker-for-windows/install/)


# Docker architecture 

##  CLient side 

<img src="client.png">


## Installing Docker on LInux (OL|RHEL)

```
[root@ip-172-31-71-168 ~]# yum  install docker  -y
Failed to set locale, defaulting to C
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
amzn2-core                                                                                               | 3.7 kB  00:00:00     
Resolving Dependencies
--> Running transaction check
---> Package docker.x86_64 0:20.10.4-1.amzn2 will be installed
--> Processing Dependency: runc >= 1.0.0 for package: docker-20.10.4-1.amzn2.x86_64
--> Processing Dependency: libcgroup >= 0.40.rc1-5.15 for package: docker-20.10.4-1.amzn2.x86_64
--> Processing Dependency: containerd >= 1.3.2 for package: docker-20.10.4-1.amzn2.x86_64
--> Processing Dependency: pigz for package: docker-20.10.4-1.amzn2.x86_64
--> Running transaction check
---> Package containerd.x86_64 0:1.4.4-1.amzn2 will be installed
---> Package libcgroup.x86_64 0:0.41-21.amzn2 will be installed
---> Package pigz.x86_64 0:2.3.4-1.am

```

## COnfigure docker engine to accept remote connection 


```
[root@ip-172-31-71-168 ~]# cd  /etc/sysconfig/
[root@ip-172-31-71-168 sysconfig]# ls
acpid       clock     docker          init        modules          nfs            rpc-rquotad  run-parts  sysstat.ioconf
atd         console   docker-storage  irqbalance  netconsole       raid-check     rpcbind      selinux
authconfig  cpupower  grub            keyboard    network          rdisc          rsyncd       sshd
chronyd     crond     i18n            man-db      network-scripts  readonly-root  rsyslog      sysstat
[root@ip-172-31-71-168 sysconfig]# vim docker
[root@ip-172-31-71-168 sysconfig]# cat  docker
# The max number of open files for the daemon itself, and all
# running containers.  The default value of 1048576 mirrors the value
# used by the systemd service unit.
DAEMON_MAXFILES=1048576

# Additional startup options for the Docker daemon, for example:
# OPTIONS="--ip-forward=true --iptables=true"
# By default we limit the number of open files per container
OPTIONS="--default-ulimit nofile=1024:4096 -H tcp://0.0.0.0:2375"

# How many seconds the sysvinit script waits for the pidfile to appear
# when starting the daemon.
DAEMON_PIDFILE_TIMEOUT=10

```

### starting docker engine 

```
[root@ip-172-31-71-168 sysconfig]# systemctl start  docker 
[root@ip-172-31-71-168 sysconfig]# systemctl status  docker 
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; disabled; vendor preset: disabled)
   Active: active (running) since Mon 2021-05-17 06:32:14 UTC; 6s ago
     Docs: https://docs.docker.com
  Process: 32384 ExecStartPre=/usr/libexec/docker/docker-setup-runtimes.sh (code=exited, status=0/SUCCESS)
  Process: 32371 ExecStartPre=/bin/mkdir -p /run/docker (code=exited, status=0/SUCCESS)
 Main PID: 32396 (dockerd)
    Tasks: 8
   Memory: 40.7M
   CGroup: /system.slice/docker.service
           └─32396 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock --default-ulimit nofile=1024:4096 -...

May 17 06:32:13 ip-172-31-71-168.ec2.internal dockerd[32396]: time="2021-05-17T06:32:13.814852270Z" level=info msg="ccRes...grpc
May 17 06:32:13 ip-172-31-71-168.ec2.internal dockerd[32396]: time="2021-05-17T06:32:13.814872164Z" level=info msg="Clien...grpc
May 17 06:32:13 ip-172-31-71-168.ec2.internal dockerd[32396]: time="2021-05-17T06:32:13.866195018Z" level=info msg="Loadi...rt."
May 17 06:32:14 ip-172-31-71-168.ec2.internal dockerd[32396]: time="2021-05-17T06:32:14.250145309Z" level=info msg="Defau...ess"
May 17 06:32:14 ip-172-31-71-168.ec2.internal dockerd[32396]: time="2021-05-17T06:32:14.469196704Z" level=info msg="Loadi...ne."
May 17 06:32:14 ip-172-31-71-168.ec2.internal dockerd[32396]: time="2021-05-17T06:32:14.504259952Z" level=info msg="Docke...10.4
May 17 06:32:14 ip-172-31-71-168.ec2.internal dockerd[32396]: time="2021-05-17T06:32:14.504390198Z" level=info msg="Daemo...ion"
May 17 06:32:14 ip-172-31-71-168.ec2.internal systemd[1]: Started Docker Application Container Engine.
May 17 06:32:14 ip-172-31-71-168.ec2.internal dockerd[32396]: time="2021-05-17T06:32:14.527174126Z" level=info msg="API l...ock"
May 17 06:32:14 ip-172-31-71-168.ec2.internal dockerd[32396]: time="2021-05-17T06:32:14.541586641Z" level=info msg="API l...375"
Hint: Some lines were ellipsized, use -l to show in full.
[root@ip-172-31-71-168 sysconfig]# systemctl enable  docker 
Created symlink from /etc/systemd/system/multi-user.target.wants/docker.service to /usr/lib/systemd/system/docker.service.
[root@ip-172-31-71-168 sysconfig]# 

```


## Docker Destkop behind the scene 

<img src="ddh.png">

### connecting client to remote context 

```
10007  docker   context    ls
10008  docker   context    create   cloud_de   --docker  host="tcp://54.236.128.18:2375"
10009  docker   context    ls

10014  docker   context    ls


10018  docker   context    use  cloud_de

```

## Docker client options 

<img src="options.png">

### to know more info about docker engine / server

```
❯ docker  info
Client:
 Context:    cloud_de
 Debug Mode: false
 Plugins:
  app: Docker App (Docker Inc., v0.9.1-beta3)
  buildx: Build with BuildKit (Docker Inc., v0.5.1-docker)
  scan: Docker Scan (Docker Inc., v0.5.0)

Server:
 Containers: 0
  Running: 0
  Paused: 0
  Stopped: 0
 Images: 0
 Server Version: 20.10.4
 Storage Driver: overlay2
  Backing Filesystem: xfs
  Supports d_type: true
  Native Overlay Diff: true
  
 
 ```
 
 




