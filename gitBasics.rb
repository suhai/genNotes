# GIT BASICS
# source1 == https://git-scm.com/docs
# source2 == https://www.git-tower.com/learn/
# source3 == https://github.com/treehouse-dave/get-acquainted-with-git
# source4 == http://danielkummer.github.io/git-flow-cheatsheet/
#------------------------------------------------------------------------------#

# USEFUL CONFIGURATION OPTIONS 
# git config --global alias.st status: Lets you just type git st whenever you want to see the status of the repo
# git config --global alias.co checkout: Lets you just type git co whenever you want to checkout a branch
# git config --global alias.ci commit: Lets you just type git ci whenever you want run a commit


# SET UP
# git --version 
# git config --global color.ui true
# git config --global user.name <my_name>
# git config --global user.email <my_email>


# ON GITHUB:
# 1. Watch --> This would set github to notify the watcher when any noticeable changes occur within the watched repo or project.

# 2. Star --> This adds the starred repo to the starer's facvorites repos on github to make it easier for that repo to be found in the future.

# 3. Fork --> This creates a clone of the forked repo into the forker's github account.

# CREATE
# Clone an existing repo:
# $ git clone <address_of_repo>

# Create a new local repo:
# $ git init 


# LOCAL REPOS AND GITHUB
# 1. To create a new repository on the command line: 
# echo "# name_of_repo" >> README.md // if you need a readME file
# git init
# git add README.md // or whatever file you want to add
# git commit -m "first commit"
# git remote add origin https://github.com/suhai/name_of_repo.git
# git push -u origin master

# 2. To push an existing repository from the command line:
# git remote add origin https://github.com/suhai/name_of_repo.git
# git push -u origin master
# And then you can do whatever commits you wanna do from here

# 3. To delete a git repository, cd into the local repo and delete the .git file with 'rm -rf .git'
# Then go to github and delete the repo in settings.

# 4. To rename an existing git repo (with both a local and remote address):
# Go to the repo in gitHub, rename it to the new name under settings.
# Rename the repo locally, and then set the new url in get with:
# git remote set-url origin new_url
# An example of url is https://github.com/suhai/repo-name
# you can then make a commit and push the commit 


# LOCAL CHANGES
# Changed files in your working directory:
# $git status 

# Changes to tracked files:
# $git diff

# Add all current changes to the next commit:
# $ git add .

# Add some changes in <fileA>to the next commit:
# $ git add -p <fileA>

# commit all local changes in tracked files:
# $ git commit -a

# Commit previously staged changes:
# $ git commit 

# Change the last commit:
# Note: Do not ammend published commits.
# $ git commit --amend 


# COMMIT HISTORY 
# Show all commits, starting with the newest:
# $ git log 

# Show changes over time for a specific file:
# $ git log -p <fileA>

# Who chnaged what and when in <fileA>:
# $ git blame <fileA>


# BRANCHES AND TAGS
# List all existing branches:
# $ git branch -av 

# Switch HEAD branch: 
# $ git checkout <branch>

# Cretae a new branch based on your current HEAD:
# $ git branch <new_branch>

# Create a new tracking branch based on a remote branch :
# $ git checkout --track <remote/branch>

# Delete a local branch:
# $ git branch -d <branch>

# Mark the current commit with a tag:
# $ git tag <tag_name>


# UPDATE AND PUBLISH 
# List all currently configured remotes:
# $ git remote -v 

# Show information about a remote:
# $ git remote show <remote>

# Add new remote repo, named <remote>:
# $ git remote add <short_name> <url>

# Downoading all changes from <remote>, but dont integrate into HEAD:
# $ git fetch <remote>

# Download changes and directly merge/integrate into HEAD:
# $ git pull <remote> <branch>

# Publish local changes on a remote:
# $ git push <remote> <branch>

# Delete a branch on the remote:
# $ git branch -dr <remote/branch>

# Publish your tags:
# $ git push --tags 


# MERGE AND RELEASE 
# Merge <branch> into your current HEAD:
# $ git merge <branch>

# Rebase your current HEAD onto <branch>:
# Note: Do not rebase published commits!
# $ git rebase <branch>

# Abort a rebase:
# $ git rebase --abort

# Continue a rebase after resolving conflicts:
# $ git rebase --continue 

# Use your configured merge tool to solve conflicts:
# $ git mergetool

# Use your editor to manually solve conflicts ad (after resolving) mark file as resolved:
# $ git add <resolved_file>
# $ git rm <resolved_file>


# UNDO 
# Discard all local changes in your local directory:
# $ git reset --hard HEAD 

# Discard local changes in a specific file:
# $ git checkout HEAD <file>

# Revert a commit (by producing a new commit with contrary changes):
# $ git revert <commit>

# Reset your HEAD pointer to a previous commit and discard all changes since then:
# $ git reset --hard <commit>

# ...and preserve all changes as unstaged changes:
# $ git reset <commit>

# .. and preserve uncommitted local changes:
# $ git reset --keep <commit>
 

# BASIC COMMANDS
# 1. git init :Creates a new Git repository in the current directory. This is normally used for a directory that has already been created. In addition, a directory named .git is added to the folder. This folder holds all the Git history and information for the repo. To get rid of the repo, just delete the .git folder

# 2. git init <whatever_name_you desire> :Creates a new Git repository named <whatever_name_you desire> with the features of #1 above. This is normally used to start a project from scratch.

# 3. git status :Show me the current status of the repository. Shows
# Untracked files -- new files that have not be added to the staging or committed

# 4. code README :This creates a 'README' file inside the repo when using VSCode. Use <name_of_text_editor> instead of 'code' when operating on an editor other than VSCode. Note that:
# Files that are tracked, have been changed but have not been staged
# Staged files -- files that have been added but not commited

# 5. git add . Adds all the files in the current directory to staging.

# 6. git add -A :Adds all files in the current repo (even new files that are not yet tracked)

# 7. git add -u Add all files that are already being tracked (ignore new files)

# 8. git add -p :Add just parts of changes to a file. "p" stands for patch and lets you go through each section of a file that has changed and add (stage) just parts of the file

# 9. git add <path/to/file> :Adds specified file to staging

# 10. git commit -m "Add file to repo" :Commit staged files to the repo with the message "Add file to repo". To make a multi-line comment, use SHIFT + RETURN after each line of message to move to a new line without triggering a premature commit. For ex. 
# $ git commit -m "added a comment to the css file.
# SHIFT + RETURN
# 1. this is an experiment.
# SHIFT + RETURN
# 2. This is also a test.
# SHIFT + RETURN
# 3. and many more to follow" 
# And then you can now strike the Return key to commit.

# 11. git commit --amend -m "New Message" :Changes the commit message for the last commit

# 12. git commit -am "New Message" :Lets you add and commit all tracked, modified files in one step, without the need to do 'git add' first.

# 13. git commit --amend -m "New commit message" :Replace last commit. Use this if you forgot something that you wanted to inlcude in the last commit. Creates a new Git SHA.

# 14. git log :Show a log of all commits.

# 15. git log --oneline :Show a log of all commits, one line per commit. Can make this the default by git config format.pretty oneline

# 16. git diff :Show differences between working tree and staging (or last commit)

# 17. git diff -- staged :Show differences between staged changes and repository

# 18. git diff -- <path to file/path to directory> :Show differences for specific file or directory


# MANAGING FILES AND DIRECTORIES
# 1. git rm <path/to/file> :Remove a file that's being tracked in the repo. If you haven't yet added the file to staging, this will produce an error. You may need to force the removal if the file is staged but not committed: git rm -f <path/to/file>

# 2. git rm -r <path/to/directory> :Remove a directory's worth of files. Also removes the directory. Directories themselves aren't tracked in Git. You may need to force the remove if a file in the directory is staged but not committed: git rm -rf <path/to/directory>

# 3. git mv <path/to/file> <path/to/new-file-name> :Move a file that's been committed to the repo.

# 4. git mv <path/to/directory> <path/to/new-directory-name> :Move a directory (and its files).

# Creating and Using Branches
# 1. git branch <name_of_branch> :Create a branch, but stay in current branch.

# 2. git checkout <name_of_branch> :Check out an the created branch

# 3. git branch :See a list of all branchs, highlights the currently checked out branch

# 4. git checkout -b <name_of_branch> :Create a branch and check it out in one step

# 5. git checkout master :Checkout master branch

# 6. git branch -d <name_of_branch> :Remove branch locally, but only if you've merged branch.

# 7. git branch -D <name_of_branch> :Remove branch even if you haven't merged changes.

# 8. git checkout master
# 9. git merge <name_of_branch> :Return to master branch and merge changes from branch


# GETTING OUT OF CHANGES
# File Fixes
# 1. git reset HEAD <path/to/file> :Unstage a file. (HEAD represents the current commit)

# 2. git reset HEAD :Unstage all staged files.

# 3. git checkout <path/to/file> :To revert to the last committed version of a file but only if a) the file has been committed and b) is not currently in staging

# 4. git checkout HEAD^ <path/to/file> :Revert to version of file from prior commit (HEAD^ represents the prior commit). Careful: this overwrites changes to files in your working branch.

# 5. git checkout <sha-of-commit> <path/to/file> :Revert to version of file from specific commit

# 6. git checkout HEAD~1 :is a special commit identifier in git; it brings the previous commit (not the one we just made, but the one before that)

# UNDO COMMITS
# Be careful with these commands when working on a shared repository -- for example with Github. Resetting commits changes the "history" of the repo -- so only use it to back out of local commits that haven not been pushed to a shared repository.

# 1. git reset --soft HEAD^ :Undo last commit of entire repo, but leave files staged.

# 2. git reset --hard HEAD^ :Completely blow away last commit. Changes files to state of previous commit.

# 3. git reset --hard HEAD^^ :Completely blow away last two commits. Changes files to state of previous commit.

# 4. git reset --hard HEAD^^^ :Completely blow away last three commits. Changes files to state prior to last third commit.

# 5. git reset --hard <sha-of-commit> :Returns files to state they were in after specificed commit

# FINDING DIFFERENCES BETWEEN VERSIONS
# 1. git diff :View differences between current working files and staging area (or if files aren't staged compare working with last commit).

# 2. git diff <path/to/file> :View differences between current working file and staging area (or if file isn't staged compare working with last commit).

# 3. git diff --staged :View differences between staged files and last commit.

# TO REVIEW AN OLDER COMMIT FILE
# 1. Do a 'git log' and determine the commit ID of what you are looking for.
# 2. Do a 'git checkout <sha-of-commit>'  
# 3. Do an 'ls' to see the list of files in that 'sha-of-commit'
# 4. Do a 'cat <file_name>' to view the content of a particular file in the terminal.
# 5. You could also do a 'git diff <file1_of_sha-of-commitA> <file1_of_sha-of-commitB>' to see the difference between the two versions of the file inside the terminal
# 6. You could also do a 'git diff <sha-of-commitA> <sha-of-commitB>' to see the difference between the two versions of the commit inside the terminal

# A SIMPLE WORKFLOW
# 1. Don't work on the master branch.
# 2. Master branch should hold your working, production files. Don't mess with them. When you need to fix something, or add a new feature to your project, create a new working branch. Make changes to that branch, then merge them into the master branch when done. You can then deploy your master branch (push it up to a web server, for example)
# 3. Make sure master is up-to-date. Add and commit files, if there are any.
# 4. Create and checkout a new working branch:
# 5. git checkout -b <working_branch_name>
# 6. Make changes to this branch. Make sure to add files and make commits along the way.
# 7. When done with branch:
# 8. git status Just to check and make sure that there are no outstanding changes that have yet to be committed. If there are, add and commit files.
# 9. Switch back to master
# 10. git checkout master
# 11. Merge changes from working branch
# 12. git merge <working_branch_name>
# 13. Remove branch
# 14. git branch -d <working_branch_name>
# 15. Deploy master (push to web server for example).
# 16. Repeat steps 1-8 for your next feature/set of changes.
# 17. If things gets TOTALLY messed up in your working branch, you can just switch back to the master branch and delete the working branch:

# 18. git checkout master
# 19. git branch -D <working_branch_name>
# 20. Then just follow steps 1-7 again.


# TO CLONE A REPO FROM ANOTHER REPO
# 1a. git clone <url_a or file_path_a> :This clones the repo located at <url_a or file_path_a> into the working directory, saving it as the same name as that at <url_a or file_path_a>.

# 1b. git remote add <url_a or file_path_a> : This enables the working directory to communicate with the added remote repo.
#Note that in most instances git, by default sets the working directory as 'master' and the remote repo as 'origin'. So doing 'git remote add origin master' or simply 'git remote add' would work in some instances.

# 2a. git clone <name_a> <url_a or file_path_a> :This clones the repo located at <url_a or file_path_a> into the working directory, saving it as <name_a>.

# 2b. git remote add <name_a> <url_a or file_path_a> :This enables the working directory to communicate with the added remote repo.

# To configure multiple remote repos
# 1. git remote add <name_a> <url_a or file_path_a> :This enables the working directory to communicate with the added remote repo.

# 2. git remote add <name_b> <url_b or file_path_b> :This enables the working directory to communicate with the added remote repo.

# 3. git remote :This list all the names of remote repos available to the working directory.

# 4. git remote update :This updates all remote repos available to the working directory.

# git push <name_of_remote_repo or 'origin'> <name_of_local_repo or 'master> :This pushes commits to a remote repo

# git pull <name_of_remote_repo or 'origin'> <name_of_local_repo or 'master> :This pulls commits from a remote repo 

# When you attempt to push commits up a remote repo and get something like:
# error: failed to push some refs to <remote repo or url>

# 1. Then there is probably some work in the remote repo that you do not have locally. This is usually caused by another repository pushing to the same ref. You would need to first integrate the remote changes (e.g., 'git pull ...') before pushing again. See the 'Note about fast-forwards' in 'git push --help' for more details on this of needed. But this can usually be fixed by doing :

# $ git pull origin master --allow-unrelated-histories

# in most instances. Otherwise do:
  
# $ git pull <REMOTE_NAME> <BRANCH_NAME> --allow-unrelated-histories

# You would most likely get message like :
# CONFLICT (add/add): Merge conflict in <FILE_NAME>
# Automatic merge failed; fix conflicts and then commit the result.
# 2. You can then just go into <FILE_NAME> to decide/edit the version of the file that you want, save it, and then proceed with git add, git commit, and git push. Bingo!
# Ocassionally you will get a response like this:
  # Please enter a commit message to explain why this merge is necessary,
  # especially if it merges an updated upstream into a topic branch.
  #
  # Lines starting with '#' will be ignored, and an empty message aborts
  # the commit.
# To resolve such an issue do this: 
  # Press 'i' to enter insert mode.
  # Now you can type your message, as if you were in a normal (non-modal) text editor. This would be your commit message.
  # Press esc to go back to command mode.
  # Then type :wq followed by enter to save and quit. You'll now be back into the normal terminal mode.

# To simultaneously push to multiple remote repos, do:
#   git remote set-url --add --push origin git://original/repo.git
#   git remote set-url --add --push origin git://another/repo.git
#   git push --set-upstream origin master
# Then when you're ready to push to the remotes you just do :
#   git push origin. This would push to all the added remote repos
# #

# To ask git to permanently ignore changes in a file
# 1. git update-index --assume-unchanged FILE [FILE ...]

# To remove an old remote
# $ git remote remove <myOrigin>


# GIT EXTENSIONS
# git flow
# git release 
# git flow hotfix

# GIT-FLOW

# Basic tips
# The OSX/Windows Client Sourcetree is an excellent git gui and provides git-flow support
# Git-flow is a merge based solution. It doesn't rebase feature branches.

# Setup
# You need a working git installation as prerequisite.
# Git flow works on OSX, Linux and Windows

# OSX
# 1. Homebrew
# $ brew install git-flow-avh
#       or
# 2. Macports
# $ port install git-flow-avh

# 3. Linux
# $ apt-get install git-flow



# Getting started
# Git flow needs to be initialized in order to customize your project setup.

# Initialize
# Start using git-flow by initializing it inside an existing git repository:
# $ git flow init

# You'll have to answer a few questions regarding the naming conventions for your branches. It's recommended to use the default values.

# You may visualize a representation of 5 parallel lines emerging from a common origin representing, from left to right:
# 1. feature branch, which is usually branched from the develop branch and would contain features under development
# 2. develop branch, which is branched from MASTER
# 3. release branch, which is usually branched from the develop branch. The release branch is usually merged into both the develop and MASTER branches once a release has undergone testing, deployment, retesting, and redeployment.
# 4. MASTER branch
# 5. hotfix branch, which is usually merges quickly back into the MASTER branch after a fix has been made.

# FEATURES
# Features are usually used to develop new features for upcoming releases, and typically exist in the developer's repos only. To start a new feature:
# Start from the 'develop' branch with.

# 1. $ git flow feature start <MYFEATURE>

# This action creates a new feature branch based on 'develop' and switches to it.
# You can then go ahead and do build and commit as much as you want. When done developing a feature, do

# 2. $ git flow feature finish <MYFEATURE>

# This action merges <MYFEATURE> into 'develop', removes the feature branch, and switches back to 'develop' branch. If working in collaboration with others you might want to publish the feature. To publish a feature to a remote server for others to acces, do

# 3. $ git flow feature publish <MYFEATURE>

# If you want to pull a published feature developed by a colleague, do

# 4. $ git flow feature pull origin <MYFEATURE>

# If you want to track a feature on origin, do 

# 5. $ git flow feature track <MYFEATURE>



# RELEASE
# Releases support preparation of a new production release, and also allow for minor bug fixes and preparing meta-data for a release.
# To start a release, use the git flow release command. It creates a release branch created from the 'develop' branch.

# 1a. $ git flow release start <RELEASE>
#               or 
# You can optionally supply a [BASE] commit sha-1 hash to start the release from, using:

# 1b. $ git flow release start <RELEASE> [BASE]

# Note that the commit must be on the 'develop' branch.
# you can then develop and commit as much as you want.
# It's wise to publish the release branch after creating it to allow release commits by other developers. Do it similar to feature publishing with the command:

# $ git flow release publish <RELEASE>

# You can also track a remote release with: 

# $ git flow release track <RELEASE>

# Once you are certain all is done and well, you can finish up the release.
# Finishing a release is one of the big steps in git branching. It :
# 1. Merges the release branch back into 'master'
# 2. Tags the release with its name
# 3. Back-merges the release into 'develop'
# 4. Removes the release branch

# $ git flow release finish <RELEASE>

# Don't forget to push your tags with: 

# $ git push --tags


# HOTFIXES
# 1. These arise from the necessity to act immediately upon an undesired state of a live production version
# 2. They may be branched off from the corresponding tag on the master branch that marks the production version.
# Like the other git flow commands, a hotfix is started with

# 1a. $ git flow hotfix start <VERSION> [BASENAME]
# The version argument hereby marks the new hotfix release name.

# 1b. $ git flow hotfix start <VERSION> [BASENAME] 
# where the [BASENAME] is optional. It specifies a basename to start from.
# You can then develop and commit as much as you want until you are ready to finish. 

# By finishing a hotfix it gets merged back into develop and master. Additionally the master merge is tagged with the hotfix version.

# $ git flow hotfix finish <VERSION>


# Note that not all available commands are covered here, only the most important ones. You can still use git and all its commands normally as you know them, git flow is only a tooling collection. The 'support' feature is still beta, using it is not advised. If you'd like to supply translations I'd be happy to integrate them.


# Helpful info
# 1. Commit early and often. Small comits make it easier for other developers to understand the changes and also be able to roll back the changes if something went wrong.

# 2. Try to commit often. This helps you commit only related changes and allow you to share your code more frequently with others. This makes it easier for everyone to integrate changes regularly and avoid merge conflicts.

# 3. Do not commit half-done works. Try to split a feature's implementation into small logical chunks and remember to commit early and often. 

# 4. Always test tour code thoroughly before you commit. 

# 5. Write good commit messages. Use the imperative present tense. Ex. <change> instead of <changed> or <changes> to be consistent with generated messages from commands like git merge.. Begin your commit with a short descriptive message summary of your change. (up to 50 characters as a guideline). Separate that from the following body with a blank line. The body of your message should answer the following: 
# i. what was the motivation for this change
# ii. how does it differ from the previous implementation.

# 6. Do not use VCS a backup system to store non-code files. Also pay attention to commiting semantically; don't just cram in files.

# 7. Don't shy away from using branches where necessary. Branches help avoid mixing up different lines of development.

# 8. Make sure you are using a work-flow that is in line with your team's preferences, your project, and your overall development.

# 9. Get help from $ git help <command> if necessary.


