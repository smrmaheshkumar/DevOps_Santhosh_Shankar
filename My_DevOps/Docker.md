# Docker

## VM’s vs Containers:

## Docker Containers:

## Docker Architecture:

•Docker Client		-	Provides UI to Docker daemon

•Docker daemon 		-	To run command. Creating Images, containers etc

•Docker Registry	-	Storage place for images


## Docker Installation:

$ yum install docker –y

$ service docker start

$ chkconfig docker on

$ docker version 	- 	It will show client (UI) version & server version

$ docker --version 	- 	Shows Docker version

$ docker images

$ docker ps 		- 	Shows only active containers

$ docker ps –a 		- 	Shows stopped containers including active


## Running Containers In Attached Mode:

$ docker run –it myimage - 	we will go inside the container

root@bchked:/#
                  |
	Container

To exit from the container there are two ways

1)exit 			- 	container will stopped after exit

2)ctrl+p   ctrl+q 	- 	container will active after exit


## Stop the Running Containers:

$ docker stop container name or id

$ docker rm container 			-	Removes the stopped container

$ docker rm –f container id or name 	- 	Force Remove

$ docker start container name or id   	-	Start the container


## Running Container in Detached mode:

$ docker run –itd myimage

Itd - Ineractive Terminal Detached Mode 

  In this we don’t go into the shell of a container. It won’t be stop untill you stop the container.

If you want to go into the shell of the conatiner use the below command

$ docker attach container id or name

(or)

$ docker exec –it container name or id /bin/bash


## Removing docker images:

$ docker rmi myimage


## Docker Volumes

Back up of the containers

Creating Docker volumes:

$ docker volume ls 		-	list all the volumes

$ docker volume create vol1 	-	creates volume with vol1

$ docker volume inspect vol1	-	Inpects the vol1
	{
		“Mount point:”/var/lib/docker/volumes/vol1/_data”,
	}

$ cd /var/lib/docker/volumes/vol1/_data -  Location of docker volume

[root@vol1_data]#   -  Entered into the docker volume


## Attaching Volumes to the containers:

$ docker run –it –-name container1 –v vol1:/data tomcat

-v flag indicates source & dest

We will enter into the shell

ls

cdkc  ckhd data dev etc

$ cd data ls

If we create any file here, we will get the files in the destination

$ exit

$ docker volume ls

$ docker volume inspect vol1

If we delete the container, data will be backup automatically


## Attaching volume to the another containers

$ docker run –it - - name container2 –v vol1:/data1 ubuntu


## Deleting Volume

$ docker volume rm vol1

Delete unused volumes. We cannot remove volumes if containers is using the volumes.


## Creating Volume with V flag:

$ docker run –it - - name container –v vol2:/data2 ubuntu

Creates volume vol2 along with the container


## Bind Mount:

Access location from Hostfile to the container

root@pwd

tmp/logs - This is  the location we have to share
 

## Migrating Docker Volumes: Check Once

$ docker volume ls

$ docker volume inspect vol2

$ cd /var/lib/docker/volumes/vol2/_data


[root@vol1_data]# docker run –it - - name container –v vol2:/data ubuntu

It copies data from one container to another

$ docker run –it - - name container1 - - volumes – from container2 ubuntu


## Building Docker Images:

vi Dockerfile

FROM tomcat:latest

MAINTAINER Mahesh

COPY ./webapp.war /usr/local/tomcat/webapps

RUN apt-get-update

RUN apt-get install vim –y

CMD /bin/echo “Hello World”

$ docker build –t myimage .

Dockerfile _________build________________ Docker images


## Docker Networks:

$ docker network ls

Network ID 			Name 		Driver			Scope
				bridge  Default
				host
				none


$ docker network inspect bridge

Containers by default get into the Bridge Network and it will origins subnets in default bridge.

$ docker inspect container-id  Inspects container


## Ping:

$ docker attach container

shell@]# ping 172.x.x.x.x - ip address

Containers with same bridge network will communicate with each other. Docker containers can communicate with each other through only ip address but not names.

User Defined bridge Network In Docker:

$ docker network create - - driver bridge bridge1

$ docker network ls

Network ID 			Name 		Driver			Scope
				Bridge1                 	bridge
				bridge  Default	bridge
				host			host
				none			null

If we want to run a container with our bridge network

$ docker run –itd - - name container - - network bridge1 ubuntu

In this containers can communicate with each other by name and also with the ip addressess


## Creating Own Networks:

Docker network create newnet –subnet= 192.168.0.0/16


## Port Publishing:

$ docker run –its - - name container –p 8080:80 nginx


## Removing Docker Network:
 $ docker network rm chdabcka


## Deploying Docker Containers via Jenkins:

Dockerfile

Job:

/opt/docker

cd /home/dockeradmin;

docker build –t myimage .;

docker run –d - - name container –p 8080:8080 tomcat;


# Docker Swarm: Container Orchestration & Clustering Tool

## Why Docker Swarm:

$	High availabilty of services

$	Load Balancing

$	Scaling the containers

$	Rolling the updates


## Architecture:

Manager Node	- 	Manages

Worker Node 	- 	Load

Services


## Starting Docker Swarm:

$ docker swarm init - - advertise – addr 10.x.x.x
						          |
Here ip address is which one we want as a Manager Node 

We will get one link to add workers. Paste that command in worker nodes. It will join as workers.

$ docker node ls

$ docker swarm join-token worker 	-	To retrieve the command

$ docker swarm join-token manager 	- 	Retrieve manager link


## Starting Services:

$ docker service create –p 8000:80 - - name websvc nginx 

$ docker service ls

$ docker service ps websvc

$ docker node update --availabilty drain manager

$ docker node update --availabilty active manager


## Scaling & Load balancing on Docker Swarm:

$ docker service scale websvc=10

$ docker service ls

$ docker service ps websvc

$ docker ps

$ docker network ls

