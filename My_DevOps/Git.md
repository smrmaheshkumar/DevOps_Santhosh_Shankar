# VINAYAKA                                                            

## DevOps:	
DevOps is a set of practices that combine software development and IT Operations. It aims to shorten the systems development life cycle and provides continuous delivery with high quality software.

# GIT Architecture:	
           
## Description:
In git we have two repositories, Local repository and Remote repository. Remote repository is also called as central server where all the project code is kept and we create a local repo in our local workstation. Every individual user has their local workstation.
So local repository resides on the local workstation. From remote we will get a copy by using git clone and git pull commands. Initially we will get a copy from Remote repo which is nothing but a local repository.

The working directory is the folder where you are currently working on your Git project. You start with a working directory where all your files are stored. Then add your files to the staging area where ideally ready to connect your files back to the main branch on your Git project. 
Once that’s done, you would want to push all the changes to a local repository where it will commit those files and make them ready for synchronization with the service. Then push your services out to the remote repository. An example of a remote repository is GitHub. 

Later when you want to update your code, you can pull the latest changes from the remote repository so that your copy of the code is always the newest version of the software that the rest of the team is working on. One of the things that you can do is, as you are working on new features within the project, you can create branches. You can merge those branches with the main line code which will ensure that your code is of the highest quality and allows you to add new features to it without breaking the core code. 

## Git Configuration:
$ yum install git –y

$ git - - version

$ git config - - global user.name “smr.maheshkumar”

$ git config - - global user.email “smr.maheshkumar@gmail.com”

To check above configuration:

$ git config - - global - - list

$ cat ~/.gitconfig

## Jenkins GitHub Integration
Install GitHub Integration Plugin and go to GitHub>Settings>Webhooks and enter as follows
http://52.15.102.192:8080/github-webook

## Git Initial Commands from Adding To Push:
$ git init

$ git add .

$ git commit –m “first commit”

$ git remote add origin https://

$ git push –u origin master 

## Git Logs:
$ git log  shows the list of git logs
$ git log - - oneline  Shows list of logs with short commit id with file
EX: 	abcd third commit
	Efgh second commit
	Jklm first commit
$ git log file.txt  shows logs of file.txt

## Git Diff Command:
ls 
file1 	file2 	file3
Before add   $ git diff file3  shows differences before the add
After add      $ git diff - -stage file3.txt  shows differences after add
$ git commit –a –m “final”  editing file already tracked
$ git rev-list - -all - -count  To see all the commit counts

## Removing Files From WD & Local Repo:
$ rm file.txt 		 	Removes file from only WD
$ git rm file.txt 	 	Remove both WD & Local Repo
$ git ls-files			Show the list of files related to Git

## Removing Files From Only Git Local Repo:
$ git rm - - cached file.txt 	 	Removes file from local repo but not WD

## GIT Ignore:
To ignore files and to inform to the GIT to do not track the particular file, we will use git ignore.
$ vi .gitignore and mention the file name in the .gitignore
$ git add .
$ git commit –m “added gitignore”
$ git push –u origin master

## Git Checkout on Files:
If we add some content in the file. To remove that changes, we will use git checkout command.
$ git checkout - - file.txt    (or)   $ git restore file.txt

## Git Reset:
Remove changes from staging area
$ git reset Head file.txt

## Git Reset Mixed:
Removes the commits with content
abcde  third commit
fghijrf  second commit
klmno  first commit
$ git reset - - mixed HEAD~1
			  HEAD~2

## Git Reset Soft:
abcde   third commit
fghijsd  second commit  becomes HEAD
klmno first commit
$ git reset - - soft HEAD~1
If we use this command 2nd commit will be the top most commit and changes will be in staged. We can get back the changes from staged
$ git commit –m “adding again”   we will get back from staged

If we want to remove from staging area use the below command
$ git reset HEAD file.txt

## Git Reset Hard:
abcde  third commit
fghijas second commit 
kasmno  first commit
$ git reset - hard HEAD~2  Permanently removes

## Overall Resets:
         Mixed                                              Soft       				Hard
            WD                                             Staging                                                    X
     $ git add 				    git commit                           Permanently removed
     $ git commit

## Git Branching:
$ git branch –a 			 	List all the branches
$ git branch production 		 	Creates new branch production
$ git checkout production 	 	Switches branch from master to production
$ git merge production master 	 	Merges data from master to production
$ git push origin production 	 	Pushes data to production

## Deleting Branches:
$ git branch –d production 	 	Delete in Local
$ git branch –D production 	 	Force Delete
$ git push origin production - - delete 	   	Delete in Remote Repo

## Deleting Files Along with the Commits:
$ git reset abcdefg - - hard
$ git push –f origin master  Force Push

## Conflicts In Git:
To remove the conflicts in the Git. First remove the unwanted lines in the files.
$ git add .
$ git commit –m “merge”
$ git push –u origin master

## Git Stash:
Temporarily saves the file without pushing and we can come back and we can use it.
     
File1 file2 file3
If we want to stash file1
$ git status
File1 untracked
$ git stash  File1 will be moved to the temp
$ git status
Working tree clean

## Git Stash Pop:
$ git stash list
stash@{0}: WIP on test
$ git stash pop stash@{0}  It will clear the stash. After this  it is not available here.

## Git Stash Apply:
$ git stash apply stash@{0}
$ git stash list [Here stash is available]

## Partial Stash:
To stash the particular file, we will use the below command
$ git stash –p
It will ask file1 or file2 by y (or) n
$ git show stash@{0}  Show details of stash

## Delete The Stash:
$ git stash clear 			 	All stashes will clear
$ git stash drop stash@{1} 	 	Particular stash will delete

## Git Reset:
Removes changes from staging area
$ git reset HEAD file.txt

## Git Clone:
$ git clone https://

## Git Pull:
$ git pull https://  Updates from central Repo

## Git Fetch:
$ git fetch origin  Just show changes but git pull download the changes

