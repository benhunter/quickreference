## Git
# Check settings
git config -l
git config -l --local
git config -l --global
# Setup signing
git config --global user.signingkey XXXXXXXX  # user.email needs to match
# Sign commits https://git-scm.com/book/en/v2/Git-Tools-Signing-Your-Work
git commit -S -m "Signed commit"
# reset a git repository to the master, preserving commits in new branch
git checkout master
git branch new-branch-for-commits
git stash  # preserve uncommited changes
# removing any local changes that aren't commited in new branch or stashed
git fetch --all
git reset --hard origin/master
git stash pop# reapply uncommitted changes

# store credentials
git config --global credential.helper store
# on Windows use 

# Refresh a fork
# https://forum.gitlab.com/t/refreshing-a-fork/32469/2
git remote add upstream https://... # if not already added
git checkout master
git fetch upstream
git pull upstream master
git push origin master

# Linux Tricks
# Pull updates for all git repos in a directory
find . -type d -maxdepth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;
# test command - git status
find . -type d -depth 1 -exec echo git --git-dir={}/.git --work-tree=$PWD/{} status \;


## References
# https://stackoverflow.com/questions/3497123/run-git-pull-over-all-subdirectories
