# git_bash_scripts
Helper bash scripts for dealing with git repositories

**git_batch_set_remotes.sh**
* Loops through subdirectories, checks if they are own .git repositories, and changes their authentication from http to ssh
* Usage: copy script to the parent directory and run with ./git_batch_set_remotes.sh

**git_batch_pull.sh**
* Loops through subdirectories, checks if they are .git repositories, and does a 'git pull' in each
* Usage: copy script to the parent directory and run with ./git_batch_pull.sh
