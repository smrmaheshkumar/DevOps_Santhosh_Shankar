# DevOps

## DevOps:-
DevOps is the combination of cultural philosophies, practices and tools that increases an organization’s ability to deliver applications and services at high velocity: evolving and improving products at a faster pace than organizations using traditional software development and infrastructure management processes. 
This speed enables organizations to better serve their customers and compete more effectively in the market.

## Git:-
Git is a distributed version-control system for tracking changes in source code during software development. It is designed for coordinating work among programmers, but it can be used to track changes in any set of files. Its goals include speed, data integrity, and support for distributed, non-linear workflows. Wikipedia

## To Setup the configuration:

	$ git config --global user.name “smrmaheshkumar”

	$ git config --global user.email “smr.maheshkumar@gmail.com”

## To check the above status:

	$ git config --global --list

	Seeing Git’s user-based config file

	$ cat ~/.gitconfig

## Git Commands:

## Pushing to Github:
 	$ git init
 	$ git add filename or git add .
  	$ git commit -m "first commit'
 	$ git remote add origin https://
 	$ git push -u origin master
	$ git clone https://
	$ git ls-files 		# shows file on localrepo

## Git Logs:
	$ git log
	$ git log --oneline
	$ git log file1.txt
	$ git show
	$ git restore --staged index.html	# Bring back file from staging to working directory
	$ git rev-list -–all -–count 		# To see the commit counts

## Removing file from WD & Local repository:
	$ rm file.txt     	# Removes from working directory
	$ git rm about.html     # Remove files from local repo as well as working directory
	$ git ls-files		# To see the files in repository

If there is two readme file in local and github account. We will encounter an error. To resolve the issue please type the below command.

	$ git pull origin master –allow-unrelated-histories

## Git Conflict:

Changes in both local and repository makes conflict. To merge the files use the below command.

	$ git pull

Changes done in same file and changes of same file in remote repo. It will conflicts.
	
	$ git pull

It will show one conflict file which you edited. So remove the separator lines. Issue resolved.


## To Create a Branch:
	$ git branch –a              	# list all the branches in Git
	$ git branch production		# Create a branch production
	$ git checkout production       # Switches from master to production
 	$ git merge production          # Merges data from master to production
 	$ git push origin production    # Pushes data to production


## To delete the branch:
	$ git branch –d production		# Delete in local
	$ git branch –D production 		# Delete force
	$ git push origin production –delete	# Delete in remote repo

## Deleting files along with the commits:
	$ git reset bdhbcks –hard
	$ git push –f 				# Push forcefully

## EC2 Instance:-
An EC2 instance is a virtual server in Amazon's Elastic Compute Cloud (EC2) for running applications on the Amazon Web Services (AWS) infrastructure. 
AWS is a comprehensive, evolving cloud computing platform; EC2 is a service that allows business subscribers to run application programs in the computing environment.

## Git Bash:-
Git Bash is an application for Microsoft Windows environments which provides an emulation layer for a Git command line experience. 
Bash is an acronym for Bourne Again Shell. A shell is a terminal application used to interface with an operating system through written commands.

## Putty:-
PuTTY is a free and open-source terminal emulator, serial console and network file transfer application. 
It supports several network protocols, including SCP, SSH, Telnet, rlogin, and raw socket connection. 
It can also connect to a serial port. The name "PuTTY" has no official meaning. Wikipedia

# JENKINS    

## Jenkins:-
Jenkins is a free and open source automation server. 
It helps automate the parts of software development related to building, testing, and deploying, facilitating continuous integration and continuous delivery. 
It is a server-based system that runs in servlet containers such as Apache Tomcat. Wikipedia

## Jenkins Installation:-
Create an EC2 instance and go through Putty or git bash.

## Jenkins Installation:-
Go through Jenkins.io/download and select centos and copy two package commands and paste it in the terminal.
	$ yum install git –y
	$ yum install jenkins –y
	$ rpm –qa jenkins 	# To check the jenkins version

Java removal and installation of newer version:
	$ yum remove java-1.7.0-openjdk
	$ yum install java-1.8.0-openjdk
	$ java -version

Service Jenkins:
	$ service jenkins start
	$ chkconfig jenkins on
	$ service jenkins status

Getting Jenkins Homepage:
Copy the ip address of the EC2 instance and paste it in the browser like 3.171.22.32/8080. 
It will ask credentials to create. After the it will show the password location. 
Copy that link and paste it in putty.

	$ cat /var/lib/jenkins/secrets/initialAdminPassword
	
After this we will get password and paste it in the browser. We will get the Jenkins Homepage.


# Docker

## Docker:
Docker is a set of platform as a service products that uses OS-level virtualization to deliver software in packages called containers. 
Containers are isolated from one another and bundle their own software, libraries and configuration files; they can communicate with each other through well-defined channels. Wikipedia

## Docker installation:
	$ yum install docker –y 
	$ Service docker start
	$ Chkconfig docker on

## Commands:
	# docker ps		# List the containers running
	# docker ps –a 	        # List all the containers including stopped
	# docker images  	# List all the images
	# docker rm bkvbsk	# Remove container
	# docker rm fhsbv –f	# Remove container forcefully
	# docker rmi bcvnbc 	# Remove docker images

### Running Docker images with containers in two ways:
	1) Running container in daemon mode. In this mode the container will run in disconnected mode.
	$ docker run –d tomcat

	2) Running docker in port forwarding mode
	$ docker run –d –p 8000:8080 tomcat
	$ docker run –d –p 8001:80 nginx

Copy the ip address and paste it in the browser with port :8000. We will get the tomcat running.

## Creation of Docker Images in two types:

### 1) Pulling Docker Images
	$ docker pull nginx		# Pulls the nginx image
	$ docker pull nginx:1.12	# Pulls the version 1.12
	$ docker pull tomcat 		# Pulls tomcat
	$ docker inspect container id 	# It will show where container is running also it will show the ip address of the container
	$ docker rm container id 	# To remove the container

### 2) Docker Image Creation

	$ vi Dockerfile
	  FROM php:7.2-apache
	  COPY index.php .
	  EXPOSE 80

	$ vi index.php
	  <?php
	  echo “Hi Mahesh”
	  ?>

After this we have to build the image
	
	$ docker build –t myimage .

It will pull the base image php and also it will pull our image. After this we will run the container with this image.
	
	$ docker run –d –p 8000:80 myimage 

To push this images into our DockerHub account:
	
	$ docker login
	
	$ docker tag myimage:latest smrmaheshkumar/myimage:latest

Now it will form another image with smrmaheshkumar/myimage:latest. To push this image into our account.
	
	$ docker push smrmaheshkumar/myimage:latest



# Docker Network:

## Commands:
	$ docker network ls		# list out all the networks

## Creating Docker Network:
	$ docker network create mybridge	# creates a network in the name mybridge    
	$ docker network create mybridge1      	# creates a network in the name mybridge1
	$ docker inspect container id 		# shows the ip address

## Run the Network with the container:
	$ docker run –d –network=mybridge nginx

	Network will run with the nginx

## To create our own network:
	$ docker network create newnet –subnet=192.168.0.0/16

## To remove Network:
	$ docker network rm ajncdkjnvsbkjvd

## To remove the container:
	$ docker rm bcdakhbvkad –f





# Docker Swarm       

### Starting Docker Swarm:

	$ docker swarm init
It will give one command as a master to join as a worker. Paste that command in two another instances so that the remaining two instances will join as a workers.
	
	$ docker node ls		# list out all the nodes
	
	$ docker network ls		# list all the networks
 	
	$ docker service ls		# list all the services with replica
	
	$ docker service ps hksbvkh	# shows ip address

It will give two networks docker-gwbridge and ingress

## To create a docker service:
	
	$ docker service create –p 8000:80 –name mynginxsvc  nginx
	
	$ docker service create –p 8000:80 –name mynginxsvc  nginx

## To scale up the containers:
	
	$ docker service scale mynginx=5

## To remove docker service:
	
	$ docker service rm mynginx

## To drain the node:
	
	$ docker node update –availability drain ip-172-31-47-55

## To active the node:
	
	$ docker node update –availability active ip-172-31-47-55
-p


# Ansible
Take 3 EC2 Instances

change user to root user

	$ sudo -i

create a user named "ansibleuser"

	$ useradd ansibleuser

set password for user "ansibleuser"

	$ passwd ansibleuser

give privileges for the ansibleuser

	$ visudo

add following line below to root user privilage
	$ ansibleuser ALL=(ALL) NOPASSWD: ALL

	$ vi /etc/ssh/sshd_config

edit following line to yes
	$ PasswordAuthentication yes

you have to restart sshd service in machine
	$ service sshd restart

Login with the following below

	$ ssh ansibleuser@172.225.58.51

Open an EC2 instance with ansibleuser 

## Install ansible in the instance 
	$ yum install ansible
It will give one command to install ansible. Install as per the process
After this goto
	$ ssh ansibleuser@172.28.255.22 	
it will ask password. To remove that generate one key as follow

	$ ssh-keygen
Copy the id to both the servers

$ ssh-copy-id ssh ansibleuser@172.28.255.22 

Goto ansible location

$ cd /etc/ansible              ls

ansible.cfg hosts roles

Set target users

Vi hosts

Give privileages

[allmyservers]

ansibleuser@12.55.225.12

ansibleuser1@115.225.225.2

Goto 

[root@ip-172-22-32-1 ansible]# 

## Ping allmysevers
$ ansible –m ping allmyservers

Installation of applications in the target servers
$ ansible –m yum –a “name=docker state=present” allmyservers –b

## Ansible Playbooks
$ ansible –m ping allmyservers
$ vi myplaybook.yml
  ---
  - hosts: allmyservers
  become: true
  become_user: root
  vars:
  - mypackages:
    - httpd
    - git
    - mysql
    - docker
  tasks:
  - name: Installing httpd service
    yum: "name={{mypackages}} state=present"
  - name: starting httpd service
    service: "name=httpd state=started"
  - name: Deploying application
    copy: "src=index.html dest=/var/www/html"
    notify: "Restarting httpd service"

  handlers:

  - name: Restarting httpd service
    service: "name=httpd state=restarted"

$ vi index.html

## To check our playbook is correct or not
	$ ansible-playbook myplaybook.yml –syntax-check

## To ping all the servers
ansible –m ping allmyservers
 
## To run the playbook
$ ansible-playbook myplaybook.yml



# Ansible Roles
$ cd /etc/ansible       ls
 
## To initiate roles
	$ ansible-galaxy init myrole

## To install tree
	$ yum install tree

Edit roles in main.yml in vars, taks etc

## Run the roles
	$ ansible-playbook roleplaybook.yml

## Command Module
$ ansible –m command –a “rm /var/www/html/index.html” allmyservers -b

	Galaxy-Ansible.com

ansible-galaxy install geerlingguy.java --roles-path=/etc/ansible/roles

ansible-playbook roleplaybook.yml


## Kubernetes

To start minikube
$ minikube start

To list out the nodes
$ kubectl get nodes


## To run the pods
	$ kubectl run hello-minikube --image=gcr.io/google_containers/echoserver:1.4 --port=8080
If we want to run nginx replace nginx in image

	$ kubectl run hello-minikube --nginx=gcr.io/google_containers/echoserver:1.4 --port=80

To see the deployments (Like docker service ls)
	$ kubectl get deplyments

## To describe the deployments

	$ Kubectl describe deployments hello-minikube

## To see the details of the pods

	$ Kubectl describe pod hello-mimikube-hvfbskbvks-ggpz4

## Scalingup the pods
	$ kubectl scale –replica=5 deployments/hello-minikube

## To Drain
	$ kubectl get pods
	$ kubectl drain podname

Pods are in pending state. To uncordon it
	$ kubectl uncordon minikube

Now see the activate status by doing
$ kubectl get pods

## To delete the pods
	$ kubectl delete pods podname
	$ kubectl get pods

## Kubernetes can be managed by UI
To get the dashboard
	$ minikube dashboard


## Replica Sets & Replication Controller:
By using yml we can create this
Example: my-rc.yaml file for creating a object based Replication Controller

apiVersion: v1
kind: ReplicationController
metadata:
name: nginx
spec:
replicas: 3
selector:
app: nginx
template:
metadata:
name: nginx
labels:
app: nginx
spec:
containers:
- name: nginx
image: nginx
ports:
- containerPort: 80

# create resource(s)
	$ kubectl create -f my-rc.yaml

replicationcontroller “nginx” created

# Adding a Label
	$ kubectl label pods busybox-sleep new-label=new-busybox-sleep pod “busybox-sleep” labeled

