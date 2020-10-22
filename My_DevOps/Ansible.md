# ANSIBLE

useradd ansibleuser

passwd ansibleuser

visudo

ansibleuser   	ALL=(ALL)		 NOPASSWD: ALL

vi /etc/ssh/sshd_config

password Authentication yes

service sshd reload

ssh-keygen

ssh-copy-id  ssh  ansibleuser@10.x.x.x

### Go to ansible location

$ cd /etc/ansible  ls

ansible.cfg 		hosts		roles

$ vi hosts

[allmyservers]

ansibleuser1@10.x.x.x

ansibleuser2@10.x.x.x

## Ping Command:

$ ansible –m ping allmyservers

Installing Application on Target Servers:

$ ansible –m yum –a “name=docker state=present” allmyservers –b 
	         |		 |					                             |
	    Module    Arguments						    Root

$ ansible –m service –a “name=docker state=started” allmyservers –b

## Ansible Playbooks:

$ ansible-playbook myplaybook.yml - -syntax –check

$ ansible-playbook myplaybook.yml  To run the Playbook

## Ansible Roles:

$ cd /etc/ansible/roles ls

roles]# ansible-galaxy init myrole

Role successfully created with the name as myrole

roles]# ls

myrole

$ cd myrole

myrole]# ls

defaults   files   handlers   meta   README.md   tasks   templates   tests   vars

$ cd tasks

# $ vi main.yml

-	name: Installing httpd service


-	service: “name=httpd state=restarted”

$ cd vars

## vi main.yml

- mypackages

  - httpd

  - git

  - mysql

  - docker

$ vi myroleplaybook.yml
-	hosts: all
become: true
become_true: root
roles:
-myrole
To execute the above role
ansible]# ansible-playbook myroleplaybook.tml
It will run the ansible playbooks with roles
$ yum install tree
myrole]# tree 
 
      				  8 Directories and 8 Files
Sample Playbook:
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
                  

























        				     ANSIBLE AR Shankar
What is Ansible:
Radically simple open-source IT automation engine
Ansible Automates:
Configuration management
Provisioning
Application Deployment
Orchestration
Why Ansible:
Ansible uses YAML format and it is very simple and human readable. No special code skills requires.
Tasks executed in order
Powerful:
Configuration
App Deployment
Provisioning
Orchestration
 

Working of Ansible:
: 

Ansible Terminology:
Control node:
Any machine with Ansible installed
Managed nodes:
The network devices (servers) you manage with Ansible
Inventory:
A list of managed nodes. An inventory file is also sometimes called a “hostfile”.
Modules:
The unit of code Ansible executes. Each module has a partiicular functionality
Tasks:
The units of action in Ansible
Playbooks:
Ordered list of tasks
Ansible Lab Setup:
 

	create an EC2 Instance
	hostname ansible-control-node
	vi /etc/hostname  ansible-control-node
	useradd ansadmin
	passwd ansadmin
	visudo
	ansadmin 	ALL=(ALL) 	NOPASSWD: ALL
	vi /etc/ssh/sshd_config
	password authentication yes
	service sshd reload
	sudo su – ansadmin (Create keys under ansadmin user)
	ssh-keygen

Ansible Installation and setup:
Pre-requisites
1.	An AWS EC2 instance (on Control node)
Ansible Installation:
On Amazon EC2 instance
1.	Install python and python-pip
yum install python
yum install python-pip
2.	Install ansible using pip check for version
pip install ansible
ansible --version
3.	Create a user called ansadmin (on Control node and Managed host)
useradd ansadmin
passwd ansadmin
4.	Below command grant sudo access to ansadmin user. But we strongly recommended using "visudo" command if you are aware vi or nano editor. (on Control node and Managed host)
echo "ansadmin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
5.	Log in as a ansadmin user on master and generate ssh key (on Control node)
sudo su - ansadmin
ssh-keygen
6.	Copy keys onto all ansible managed hosts (on Control node)
ssh-copy-id ansadmin@<target-server>
7.	Ansible server used to create images and store on docker registry. Hence install docker, start docker services and add ansadmin to the docker group.
yum install docker

# start docker services 
service docker start

# add user to docker group 
usermod -aG docker ansadmin
8.	Create a directory /etc/ansible and create an inventory file called "hosts" add control node and managed hosts IP addresses to it.
Validation Test:
1.	Run ansible command as ansadmin user it should be successful (Master)
ansible all -m ping




Ansible ad-hoc commands:
An Ansible ad-hoc command uses the /usr/bin/ansible command-line tool to automate a single task on one or more managed nodes. Ad-hoc commands are quick and easy, but they are not reusable.
Ping Module:
$ ansible all –m ping

Command Module:
$ ansible all –m command –a “uptime” 
$ ansible all –m command –a “date” 
$ ansible all –m command –a “who”

Stat Module:
$ ansible all –m stat –a “path=/etc/hosts”  Checks file exists or not 

Yum Module:
$ ansible all –m yum –a “name=git” –b

User Modules: (Creating users by using user modules)
$ ansible all –m user –a “name=Mahesh” –b

Setup Module:
$ ansible all –m setup    It gives entire system information about the managed nodes

Ansible Inventory:
Ansible works against multiple managed nodes or “hosts” in your infrastructure at the same time, using a list or group of lists known as Inventory.
Inventory file is a collection of hosts(nodes) which are managed by ansible control node.
Hosts information can be defined in following ways:
	Default Location: /etc/ansible/hosts
	Use –I option: ansible – I my_hosts
	Defined in ansible.cfg file
Ping our own hosts file:
Create hosts file in your desired location. 
After that you can ping our own host using the below command.
$ ansible all –m ping – i hosts
** If we want the our own hosts as a default. 
$ vi ansible.cfg  
Under [defaults]
Inventory  =  /home/ansadmin/hosts
So that ansible will selects the default hosts location which you have specified in the ansible.cfg
To ping only particular group:
ansible rhel –m ping – i /etc/ansible/hosts 

If you don’t specify any privilages, Ansible will selects the default configuration which has been stored in ansible.cfg
 
 **  In the command line we will use –b as a root user. To avoid this we can do as follow
$ sudo vi /etc/ansible/ansible.cfg
Under [privilage escalation]
become = True
Now we can use any commands without –b

** Also, we can create our own ansible.cfg in ansadmin, we can create ansible.cfg own file as follow
$ vi ansible.cfg
[Privilage_escalation]
Become = True
Through this we can run the command without -b

Ansible Configuration Settings
Ansible supports several sources for configuring its behavior, including an ini file named ansible.cfg, environment variables, command-line options, playbook keywords, and variables. See Controlling how Ansible behaves: precedence rules for details on the relative precedence of each source.
The ansible-config utility allows users to see all the configuration settings available, their defaults, how to set them and where their current value comes from. See ansible-config for more information.
The configuration file
Changes can be made and used in a configuration file which will be searched for in the following order:
•	ANSIBLE_CONFIG (environment variable if set)
•	ansible.cfg (in the current directory)
•	~/.ansible.cfg (in the home directory)
•	/etc/ansible/ansible.cfg
Ansible will process the above list and use the first file found, all others are ignored.
 Ansible Modules:
 
Working with Modules
•	Introduction to modules
•	Return Values
•	Module Maintenance & Support
•	Module Index
Ansible ships with a number of modules (called the ‘module library’) that can be executed directly on remote hosts or through Playbooks.
Users can also write their own modules. These modules can control system resources, like services, packages, or files (anything really), or handle executing system commands.
$ ansible-doc –l   shows the list of the modules

Creating Own Ansible Playbook:
What is a Playbook?
Playbooks are essentially sets of instructions (plays) that you send to run on a single target or groups of targets (hosts). Think about the instructions you get for assembling an appliance or furniture. The manufacturer includes instructions so you can put the parts together in the correct order. When followed in order, the furniture looks like what was purchased.
Ansible Playbooks Format:
 

Setting Up Ansible Environment: 
 

Running A Playbook:
ls
ansible.cfg		 hosts		 ansible_user.yml
Note: In unubtu system, it wont create home directory. That’s why while creating use the below command
$ useradd ansadmin -m –d /home/ansadmin ansadmin
Why Home directory: Bcz the keys will copy into the home directory.

First Ansible Playbook:
vi first_ansibleplaybook.yml
---
- name: this playbook is to create a user
  hosts: all
  become: true 
  tasks:
  - name: creating user john
    user: name=john
                  (OR)
  - name: creating user john
    user:
    - name: john

Yum Module: (Installing Package):
vi yum_module_package.yml
---
- name: this playbook install packages
  hosts: webservers
  become: true
  tasks:
  - name: install apckage
    yum:
      name: git
      state: installed

File Module – create/remove a file/directory:
 vi create_file.yml
---
- name: this playbook creates a file or dir
  hosts: all
  become: true
  tasks:
  - name: creating a file
    file:
       path: /home/ansadmin/demofile
       state: touch
Above file create the file in all the servers.

Note: Ansible command to list hosts
$ ansible all – i hosts - - list-hosts

To Create a Directory:
vi create_directory.yml
- - -
- name: this playbook creates a file or dir
  hosts: all
  become: true
  tasks:
   - name: creating a file
      file:
           path: /home/ansadmin/dir1
	state: directory
To Remove The Above Directory:
       file:
           path: /home/ansadmin/dir1
	state: absent

Copy Module:
vi index.html
<h1!> This file should copy to the target servers

vi  copy_file.yml
---
- name: ansible playbook to copy a file
  hosts: all
  become: true
  tasks:
  - name: copy a file
    copy: 
        src: /opt/ansible/index.html
        dest: /home/ansadmin
        mode: 0600
        owner: john

Install Apache on RHEL:
vi install_httpd.yml
---
- name: this playbook install httpd
  hosts: webservers
  become: true
  tasks:
  - name: install apckage
    yum:
      name: httpd
      state: installed
  - name: start httpd service
      service:
      name: httpd
      state: started

Removing the packages:
vi uninstall_httpd.yml
---
- name: this playbook uninstall httpd
  hosts: webservers
  become: true
  tasks:
  - name: stop httpd service
      service:
      name: httpd
      state: stopped
  - name: remove httpd service
    yum:
      name: httpd
      state: removed

Install Aache on Ubuntu:
In ubuntu yum command will not work. Instead of yum command we will use apt install
$ apt install git
$ apt install apache2
$ service apache2 start

vi install_apche2.yml
---
- name: install apache2 on ubuntu servers
  hosts: dbservers
  become: true
  tasks:
  - name: install apache2
    apt: 
      name: apache2
      state: present
  - name: start apache2
    service:
      name: apache2
      state: started

Notify & Handlers In A Playbook:
vi notify_handlers.yml
---
- name: this playbook install httpd
  hosts: webservers
  become: true
  tasks:
  - name: install apckage
    yum:
      name: httpd
      state: installed
      notify: start httpd service
      
      handlers: 
  - name: start httpd service
    service:
      name: httpd
      state: started
Note: Notify and handlers names should be same as mentioned below
      notify: start httpd service
      handlers: 
   - name: start httpd service
How Gathering Facts Works:
Gathering facts will retrieve the sytem information from the remote system.

If we want to disable gathering facts, we will use gather_facts: no
- - -
- name: this playbook creates a file or dir
  hosts: all
  become: true
  gather_facts: no
  tasks:
   - name: creating a file
      file:
           path: /home/ansadmin/dir1
	state: directory
Why we disable gathering facts:
In real time it may 100 of servers, it will take longer time to gather all the facts.

When Condition:
vi install_httpd_apache2.yml
---
- name: this playbook install httpd and apache2 by using when  condition
  hosts: all
  become: true
  tasks:
  - name: install package
    yum:
      name: httpd
      state: installed
    when: ansible_os_family == “Redhat”
  - name: start apache
    service:
      name: httpd
      state: started
    when: ansible_os_family == “Redhat”
  - name: install apache2
    apt: 
      name: apache2
      state: present
    when: ansible_os_family == “Debian”
  - name: start apache2
    service:
      name: apache2
      state: started
    when: ansible_os_family == “Debian”
Note: Below fig shows the above programming
 

Uninstall Apache using When Condition:
vi unistall_httpd_using_when_condition.yml
---
- name: this playbook uninstall httpd
  hosts: webservers
  become: true
  tasks:
  - name: stop httpd service
    service:
      name: httpd
      state: stopped
    when: ansible_os_family == “Redhat”
   
  - name: remove httpd service
    yum:
      name: httpd
      state: removed
    when: ansible_os_family == “Redhat”

  - name: stop apache2 services
    service:
      name: apache2
      state: stopped
    when: ansible_os_family == “Debian”
 
  - name: uninstall apache2 
    apt:
      name: apache2
      state: removed
    when: ansible_os_family == “Debian”
Above Programming Fig:
 

Adding Copy Task To Apache Playbook:
vi copy_indexfile_task_to_apache_playbook.yml 
<h1> Welcome to Apache tomcat </h1>
---
- name: this playbook install httpd and apache2 by using when  condition
  hosts: all
  become: true
  tasks:
  - name: install package
    yum:
      name: httpd
      state: installed
    when: ansible_os_family == “Redhat”
   
  - name: start apache
    service:
      name: httpd
      state: started
    when: ansible_os_family == “Redhat”
   
  - name: install apache2
    apt: 
      name: apache2
      state: present
    when: ansible_os_family == “Debian”
 
  - name: start apache2
    service:
      name: apache2
      state: started
    when: ansible_os_family == “Debian”

  - name: copy index.html
    copy:
      src: /opt/ansible/index.html
      dest: /var/www/html
      mode: 0666

Lists & With_items:
Vi lists_with_items.yml
---
- name: this playbook installs so many packages
  hosts: all
  become: true
  tasks:
  - name: install packages
    yum:
    name: ['git', 'docker', 'make', 'gcc', 'wget', 'telnet', 'gzip'] While using Lists
    name: "{{ item }}" While using With_items. Now in latest version is not used
      state: installed
    with_items:
      - git
      - make
      - gcc
      - docker
      - gzip
      - wget

Ansible Variables:

 




