# source1 == https://git-scm.com/docs
# source2 == https://github.com/treehouse-dave/get-acquainted-with-git
# source3 == http://danielkummer.github.io/git-flow-cheatsheet/
##############################################################################

# Useful Configuration Options
# git config --global alias.st status Lets you just type git st whenever you want to see the status of the repo
# git config --global alias.co checkout Lets you just type git co whenever you want to checkout a branch
# git config --global alias.ci commit Lets you just type git ci whenever you want run a commit
# *This just covers some basic Git commands. Doesn't cover remote repos, push or pull

# set up
# git --version 
# git config --global color.ui true
# git config --global user.name <my_name>
# git config --global user.email <my_email>


# Basic Commands
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

# 10. git commit -m "Add file to repo" :Commit staged files to the repo with message

# 11. git commit --amend -m "New Message" :Changes the commit message for the last commit

# 12. git commit -am "New Message" :Lets you add and commit all tracked, modified files in one step, without the need to do 'git add' first.

# 13. git commit --amend -m "New commit message" :Replace last commit. Use this if you forgot something that you wanted to inlcude in the last commit. Creates a new Git SHA.

# 14. git log :Show a log of all commits.

# 15. git log --oneline :Show a log of all commits, one line per commit. Can make this the default by git config format.pretty oneline

# 16. git diff :Show differences between working tree and staging (or last commit)

# 17. git diff -- staged :Show differences between staged changes and repository

# 18. git diff -- <path to file/path to directory> :Show differences for specific file or directory


# Managing Files and Directories
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


# Getting Out of Changes
# File Fixes
# 1. git reset HEAD <path/to/file> :Unstage a file. (HEAD represents the current commit)

# 2. git reset HEAD :Unstage all staged files.

# 3. git checkout <path/to/file> :To revert to the last committed version of a file but only if a) the file has been committed and b) is not currently in staging

# 4. git checkout HEAD^ <path/to/file> :Revert to version of file from prior commit (HEAD^ represents the prior commit). Careful: this overwrites changes to files in your working branch.

# 5. git checkout <sha-of-commit> <path/to/file> :Revert to version of file from specific commit

# 6. git checkout HEAD~1 :is a special commit identifier in git; it brings the previous commit (not the one we just made, but the one before that)

# Undo Commits
# Be careful with these commands when working on a shared repository -- for example with Github. Resetting commits changes the "history" of the repo -- so only use it to back out of local commits that haven not been pushed to a shared repository.

# 1. git reset --soft HEAD^ :Undo last commit of entire repo, but leave files staged.

# 2. git reset --hard HEAD^ :Completely blow away last commit. Changes files to state of previous commit.

# 3. git reset --hard HEAD^^ :Completely blow away last two commits. Changes files to state of previous commit.

# 4. git reset --hard HEAD^^^ :Completely blow away last three commits. Changes files to state prior to last third commit.

# 5. git reset --hard <sha-of-commit> :Returns files to state they were in after specificed commit

# Finding Differences Between Versions
# 1. git diff :View differences between current working files and staging area (or if files aren't staged compare working with last commit).

# 2. git diff <path/to/file> :View differences between current working file and staging area (or if file isn't staged compare working with last commit).

# 3. git diff --staged :View differences between staged files and last commit.

# To Review an Older Commit File.
# 1. Do a 'git log' and determine the commit ID of what you are looking for.
# 2. Do a 'git checkout <sha-of-commit>'  
# 3. Do an 'ls' to see the list of files in that 'sha-of-commit'
# 4. Do a 'cat <file_name>' to view the content of a particular file in the terminal.
# 5. You could also do a 'git diff <file1_of_sha-of-commitA> <file1_of_sha-of-commitB>' to see the difference between the two versions of the file inside the terminal
# 6. You could also do a 'git diff <sha-of-commitA> <sha-of-commitB>' to see the difference between the two versions of the commit inside the terminal

# A Simple Workflow
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


# To clone a repo from another repo
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

# To ask git to permanently ignore changes in a file
# 1. git update-index --assume-unchanged FILE [FILE ...]



# ABSOLUTE REFERENCE INFO FOUND AT : https://git-scm.com/docs

# Github
# 1. Watch --> This would set github to notify the watcher when any noticeable changes occur within the watched repo or project.

# 2. Star --> This adds the starred repo to the starer's facvorites repos on github to make it easier for that repo to be found in the future.

# 3. Fork --> This creates a clone of the forked repo into the forker's github account. 


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







UNDER CONSTRUCTION

# GIT
# 1. To rename a git repo:
# Go to the repo in gitHub, rename it to the new name under settings.
# Rename the repo locally, and then set the new url in get with:
# git remote set-url origin new_url
# An example of url is https://github.com/suhai/repo-name
# you can then make a commit and push the commit 

# 2. To create a new repository on the command line: 
# echo "# name_of_repo" >> README.md // if you need a readME file
# git init
# git add README.md // or whatever file you want to add
# git commit -m "first commit"
# git remote add origin https://github.com/suhai/name_of_repo.git
# git push -u origin master

# 3. To push an existing repository from the command line:
# git remote add origin https://github.com/suhai/name_of_repo.git
# git push -u origin master
# And then you can do whatever commits you wanna do from here

# 4. To delete a git repository, cd into the local repo and delete the .git file with 'rm -rf .git'
# Then go to github and delete the repo in settings.


# COMMAND LINE
# 1. $ echo "Hello" > hello.txt === ‘ > ’overwrites all original contents in hello.txt, appending the stdout of“ Hello” to it instead
# 2. $ cat hello.txt‘ cat’ outputs the content of hello.txt
# 3. $ cat oceans.txt > continents.txt
# 4. $ cat glaciers.txt >> rivers.txt === ‘ >> ’appends the stdout of glaciers.txt to the file rivers.txt
# 5. $ cat rivers.txt
# 6. $ cat < lakes.txt === take the stdin of lakes.txt and outputs it in the terminal
# 7. $ cat volcanoes.txt | wc === ‘ | ’takes the stdout of cat volcanoes.txt and use it as the stdin
# for wc
# 8. $ cat volcanoes.txt | wc | cat > islands.txt == 7 above is then piped to cat, whose stdout is redirected to islands.txt
# 9. $ sort lakes.txt === sorts lakes.txt in alpha order and outputs the result in the terminal
# 10. $ cat lakes.txt | sort > sorted - lakes.txt ===
#     11. $ uniq deserts.txt ===
#     12. $ sort deserts.txt | uniq ===
#     13. $ sort deserts.txt | uniq > uniq - deserts.txt == > make it a habit to always call‘ sort’, ‘pipe’ before‘ uniq’
# 14. $ grep Mount mountains.txt === searches
# for files that match the pattern and
# return the result
# 15. $ grep - I Mount mountains.txt === does 14 with the
# case -insensitive flag, ‘-i’
# 16. $ grep - R Arctic === recursively searches
# for files that match‘ Arctic’ and outputs them with the lines containing them
# 17. $ grep - Rl Arctic === does 16, except it doesn’ t output the lines containing the matched results.
# 18. $ sed 's/snow/rain/'
# forests.txt === searches
# for‘ snow’ in forests.txt and replace it with‘ rain’
# 19. $ sed 's/snow/rain/g’ forests.txt === does 18 globally
# 20. $ alias === displays a list all aliases available

# $ ls                                                                                                                     
# 2014  2015  hardware.txt

# In the terminal, first you see $. This is called a shell prompt. It appears when
# the terminal is ready to accept a command. When you type ls, the command line 
# looks at the folder you are in, and then "lists" the files and folders inside it.
# The directories 2014, 2015, and the file hardware.txt are the contents of the 
# current directory. "ls" is an example of a command, a directive to the computer 
# to perform a specific task.

# BACKGROUND

# The command line is a text interface for your computer. It's a program that 
# takes in commands, which it passes on to the computer's operating system to run.

# From the command line, you can navigate through files and folders on your 
# computer, just as you would with Windows Explorer on Windows or Finder on Mac OS.
# The difference is that the command line is fully text-based.

# Here's an appendix of commonly used commands.

# COMMANDS
# wd : outputs the name of the current working directory.
# ls : lists all files and directories in the working directory.
# cd : switches you into the directory you specify.
# cd .. : goes up one branche
# cd ../.. : goes up two branches
# mkdir : creates a new directory in the working directory.
# touch : creates a new file inside the working directory.
# Options modify the behavior of commands:
# ls -a lists all contents of a directory, including hidden files and directories
# ls -l lists all contents in long format
# ls -t orders files and directories by the time they were last modified
# Multiple options can be used together, like ls -alt
# From the command line, you can also copy, move, and remove files and directories:
# cp copies files
# mv moves and renames files
# rm removes files
# rm -r removes directories
# Wildcards are useful for selecting groups of files and directories

# Redirection reroutes standard input, standard output, and standard error.
# The common redirection commands are:

# > redirects standard output of a command to a file, overwriting previous content.
# >> redirects standard output of a command to a file, appending new content to 
# old content.
# < redirects standard input to a command.
# | redirects standard output of a command to another command.
# A number of other commands are powerful when combined with redirection commands:

# sort: sorts lines of text alphabetically.
# uniq: filters duplicate, adjacent lines of text.
# grep: searches for a text pattern and outputs it.
# sed : searches for a text pattern, modifies it, and outputs it.


# COMMANDS IN DETAIL

# #>
# $ cat oceans.txt puts the content of the file "oceans.txt" onto the terminal
# $ cat oceans.txt > continents.txt
# > takes the standard output of the command on the left, and redirects it to the 
# file on the right.

# >>
# $ cat glaciers.txt >> rivers.txt
# >> takes the standard output of the command on the left and appends (adds) it 
# to the file on the right.

# <
# $ cat < lakes.txt
# < takes the standard input from the file on the right and inputs it into
# the program on the left.

# |
# $ cat volcanoes.txt | wc
# | is a "pipe". The | takes the standard output of the command on the left,
# and pipes it as standard input to the command on the right. You can think of 
# this as "command to command" redirection.

# ~/.BASH_PROFILE
# $ nano ~/.bash_profile
# ~/.bash_profile is the name of file used to store environment settings. 
# It is commonly called the "bash profile". When a session starts, it will load 
# the contents of the bash profile before executing commands.

# ALIAS
# alias pd="pwd"
# The alias command allows you to create keyboard shortcuts, or aliases, 
# for commonly used commands.

# CD
# cd Desktop/
# cd takes a directory name as an argument, and switches into that directory.

# $ cd jan/memory
# To navigate directly to a directory, use cd with the directorys path as an 
# argument. Here, cd jan/memory/ command navigates directly to the jan/memory 
# directory.

# CD ..
# $ cd ..
# To move up one directory, use cd ... Here, cd .. navigates up from jan/memory/ to jan/.

# CP
# $ cp frida.txt historical/
# cp copies files or directories. Here, we copy the file frida.txt and place it 
# in the historical/ directory

# Wildcards
# $ cp * satire/
# The wildcard * selects in the working directory, so here we use cp to copy all 
# files into the satire/ directory.

# $ cp m*.txt scifi/
# Here, m*.txt selects all files in the working directory starting with "m" and 
# ending with ".txt", and copies them to scifi/.

# ENV
# env
# The env command stands for "environment", and returns a list of the environment 
# variables for the current user.

# ENV | GREP VARIABLE
# env | grep PATH
# env | grep PATH is a command that displays the value of a single environment variable.

# EXPORT
# export USER="Jane Doe"
# export makes the variable to be available to all child sessions initiated from
# the session you are in. This is a way to make the variable persist across programs.

# GREP
# $ grep Mount mountains.txt
# grep stands for "global regular expression print". It searches files for lines 
# that match a pattern and returns the results. It is case sensitive.

# GREP -I
# $ grep -i Mount mountains.txt
# grep -i enables the command to be case insensitive.

# GREP -R
# $ grep -R Arctic /home/ccuser/workspace/geography
# grep -R searches all files in a directory and outputs filenames and lines
# containing matched results. -R stands for "recursive".

# GREP -RL
# $ grep -Rl Arctic /home/ccuser/workspace/geography
# grep -Rl searches all files in a directory and outputs only filenames with
# matched results. -R stands for "recursive" and l stands for "files with matches".

# HOME
# $ echo $HOME
# The HOME variable is an environment variable that displays the path of the home 
# directory.

# LS
#   $ ls
#   2014  2015  hardware.txt
# ls lists all files and directories in the working directory
#   ls -a
#   .  ..  .preferences  action  drama comedy  genres.xt
# ls -a lists all contents in the working directory, including hidden files and 
# directories

# ls -l

#   ls -l
#   drwxr-xr-x 5  cc  eng  4096 Jun 24 16:51  action
#   drwxr-xr-x 4  cc  eng  4096 Jun 24 16:51  comedy
#   drwxr-xr-x 6  cc  eng  4096 Jun 24 16:51  drama
#   -rw-r--r-- 1  cc  eng     0 Jun 24 16:51  genres.txt
# ls -l lists all contents of a directory in long format. Here is what each column
# means.
# ls -t orders files and directories by the time they were last modified.
# ls -alt and does all the l -a, l -l, and l -t functions.

# MKDIR
# $ mkdir media
# mkdir takes in a directory name as an argument, and then creates a new directory
# in the current working directory. Here we used mkdir to create a new directory 
# named media/.

# MV
# $ mv superman.txt superhero/
# To move a file into a directory, use mv with the source file as the first 
# argument and the destination directory as the second argument. Here we move 
# superman.txt into superhero/.

# NANO
# $ nano hello.txt
# nano is a command line text editor. It works just like a desktop text editor 
# like TextEdit or Notepad, except that it is accessible from the the command line
# and only accepts keyboard input.

# PATH
# $ echo $PATH

# /home/ccuser/.gem/ruby/2.0.0/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin
# PATH is an environment variable that stores a list of directories separated by 
# a colon. Each directory contains scripts for the command line to execute. 
# PATH lists which directories contain scripts.

# PWD
# $ pwd
# /home/ccuser/workspace/blog
# pwd prints the name of the working directory

# RM
# $ rm waterboy.txt
# rm deletes files. Here we remove the file waterboy.txt from the file system.

# RM -R
# $ rm -r comedy
# rm -r deletes a directory and all of its child directories.

# SED
# $ sed 's/snow/rain/' forests.txt
# sed stands for "stream editor". It accepts standard input and modifies it based 
# on an expression, before displaying it as output data.
# In the expression 's/snow/rain/':
# s: stands for "substitution".
# snow: the search string, the text to find.
# rain: the replacement string, the text to add in place.
# $ sed 's/snow/rain/g' forests.txt does a global "find and replace"

# SORT
# $ sort lakes.txt
# sort takes the standard input and orders it alphabetically for the standard output.

# STANDARD ERROR
# standard error, abbreviated as stderr, is an error message outputted by a 
# failed process.

# SOURCE
# source ~/.bash_profile
# source activates the changes in ~/.bash_profile for the current session. 
# Instead of closing the terminal and needing to start a new session, source 
# makes the changes available right away in the session we are in.

# STANDARD INPUT
# standard input, abbreviated as stdin, is information inputted into the terminal 
# through the keyboard or input device.

# STANDARD OUTPUT
# standard output, abbreviated as stdout, is the information outputted after a 
# process is run.

# TOUCH
# $ touch data.tx
# touch creates a new file inside the working directory. It takes in a file name 
# as an argument, and then creates a new empty file in the current working directory.
# Here we used touch to create a new file named keyboard.txt inside the 2014/dec/ directory.

# If the file exists, touch is used to update the modification time of the file

# UNIQ

# $ sort lakes.txt
# sort takes the standard input and orders it alphabetically for the standard output.