# JENKINS

## Continous Integration:
CI is a development practice that requires developers to integrate code into the shared repository at regular intervals several times a day.
 
## Problems before CI:

	Chances of bugs are more

	Integration is done manually

	It will creates new work

	Error Prone

	Time Taking

## Benefits of CI:

	Fixing the bugs is faster

	Less rework

	Less people

	Automation reduces risks of human error

	More flexible for changes

## Jenkins:

Jenkins is a self contained, open source automation server which can be used to automate all sorts of tasks related to building, testing and delivering or deploying the software.
Features of Jenkins:

	Easy to setup

	Easy to configure

	Plugins

	Extensible (Lot of functionalities)

	Distributed

## Jenkins Installation:

Get link from jenkins.io/download from centos

yum install jenkins –y

rpm –qa jenkins

service jenkins start

chkconfig jenkins on

cat /var/lib/jenkins/secrets/initialAdminpassword

We will get Jenkins UI

## User Management

Manage Jenkins  Config Global Security  Enable Security  LDAP Server details (or) Jenkins own database
Matrix Based Security

It enables what were the privilages that should give to the User. Under this we can give privilages to the Users.
Project-Based Matrix Authorization Stategy

Gives specific Jobs to the specific user.

  Go to Job and Config in Jenkins  Under General  Enable Project-based Security

# Job:

After running a sample Job

$ cd /var/lib/jenkins/workspace/jobs ls
Job1 Job2

$ cd Job1 ls
builds             config.xml            nextbuildnumber

## Builds:

$ cd builds ls
1 2 3 4 5 legacyIds permalinks

$ cd 1
Build.xml   changelog.xml   log

Logs  If we want to see the detail logs. We have to install Audit Trail(It will show who performed log at what time)

## Config.xml:
Contains entore configuration of a particular job

## NextBuildnumber:
If we want to change next build number. 

 vi nextbuildnumber and enter the build number that you’d like to go. Restart the Jenkins. So that you can get the nextbuildnumber as you want.

Installation & Configuring Audit Trail:

After installing the plugin Audit Trail. Goto Configuration  Auditrail
		Log Location       	/tmp/jenkins_logs
		Log file size         		10
		Log File Count     		 5

$ cd /tmp/jenkins_logs

$ cat jenkins_logs

If we build any job now. We will get the detailed logs here.

$ cat jenkins_logs | grep job1 (Displays only logs related to job1)

## CI/CD Pipeline

  Global Tool Configuration

  Install JDK & Maven 

## Free Style Project

General				Description

Source Code Management	Git

Build Triggers			Poll SCM + Build after other Projects

Build Environment		

Build					Invoke Top Level Maven targets

Post Build Actions	Publish Over SSH, Email Notifications & Projects to build

If we want to see in Pipeline view, we have to install Build Pipeline plugin

## Test Report:

$ cd workspace/target/surefire-reports

  Job configure  Post build actions  Publish Junit test report

## Publish Junit Test Report

Test report XML’s       /target/surefire-reports/*.xml

Producing Report For Code Analysis:

Install warnings next generation plugin

Go to code analysis job  Post Build Actions  Record Compiler warnings

Tool    	PMD

Report file pattern 	target/pmd.xml

After building the job, we will get PMD warnings with congratulations job suceed.

Agent / Slave setup:
Install Jenkins in another EC2 instance
 Manage Jenkins  Nodes  New Node  Give Node Name

Name	slave1
Remote root directory	/home/ec2-user/jenkins
Launch method 	Launch agents via SSH
Host	10.0.0.0/24
Credentials	none   Add
Under Credentials Add
Username	ec2-user 
Private key	XXXXXXXXXXXXX

	Launch Agent
	Agent will add successfully
	Goto Particular job  Confg  Restrict where this project can be run  Slave
Multi Configuration Project:

