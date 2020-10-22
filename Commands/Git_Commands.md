# Git Commands
Practical git commands, this will be updated as needed and by needed I mean as I need to remember things I don't know

Commands | Description
-------- | -----------
git --version | git version
git checkout [branchname] | go to branch **first step before any work is done
git status | check status of git repositories
git checkout -b [branchname] | create new branch from current branch
git branch -D [branchname] | delete local branch
git push origin --delete [branchname] | delete remote branch
git push origin :[branchname] | delete remote branch shorthand
git pull | pull all repo changes
git log | shows list of git commits
git show | logs last updates on files, code etc
git show --summary | shows list of last commit on files
git add . | Adds all files
git add new_file.html | add file to cue
git commit -m 'message goes here' | commit files from cue with message
git push | push changes from commit
git push -u origin feature_branch_name | push branch to remote host
git push --force origin [branchname] | force a push even if behind master
git diff [branchname] | check for differences between current branch  and branch after diff command
git diff filename.js --cached | check for differences between local and remote file before pushing
git blame -L 12,22 file.js | git blame lets you see the lines with an L flag as to who made them
git log -p | shows what has been committed with a small diff
git log --stat | shows lines added and removed of commits in history of branch
git whatchanged -p | shows what has changed as history of repo before a commit
git fetch --all | fetch downloads the latest from remote without trying to merge or rebase anything.
git reset --hard origin/master | git reset resets the master branch to what you just fetched. Also get's rid of bad local commits
git init | initialize git repository
git log --graph --oneline --all | show a tree of all your activity and commit history
git merge [branchname] origin [branchname] | merged changes to current branch
git merge [branchname] -X theirs | forces conflict to use their changes instead of you resolving it
git merge [branchname] -X ours | forces conflict to use our code instead of you resolving it
git reset --hard HEAD or [9516516] | removes files not pushed in your repo, you can reset to HEAD (master) or a hash
git reset --hard HEAD~1 | removes last merge or commit into repo
git reset --hard [sha1-commit-id] | removes commit in sha from history
git cherry-pick [62ecb3] | pull in only the commit passed as a param into any branch on same repo
git update-index --assume-unchanged [fileName] | removes file from commit list
git diff --name-only --diff-filter=U | see only files in conflict from merge
git checkout -- path/to/filename.txt | remove file from current changes before commit
git stash save "my_stash_name" | save my stash with a name is a `string`
git stash list | show all stashes in memory
git stash pop stash@{n} | get stash -- `n` means number
git stash drop stash@{n} | delete stash -- `n` means number
git ls-remote --heads | preview all remote branches
git branch -m new-name | If you are on the branch you want to rename
git branch -m old-name new-name | If you are on a different branch
git push origin :old-name new-name | Delete the old-name remote branch and push the
git push origin -u new-name | Reset the upstream branch for the new-name local branch
git tag | Show all tags in repo
git tag -l "v1.*" | Show only6 tags that are part of a 1.x
git tag -a v1.4 -m "my version 1.4" | Create an annotated tag
git tag v1.4.0 | Create a lightweight tag
git tag -a v1.2 9fceb02 | Tag a commit after it was created by using that commit after the version number
git push origin v1.5 | Push only the tag you specify to the remote repo
git push origin --tags | Push all tags to remote repo
git tag -d [tag] | delete tag
git push origin :refs/tags/[tag] | delete remote tag
