## Linux Quick Reference

# Ubuntu version
lsb_release -a

# Kernel info
uname -a

# GDB config
~/.gdbinit
    set disassembly-flavor intel

# download a complete webpage and fix links for offline viewing
wget -p -k <url>

## Git
# reset a git repository to the master, preserving commits in new branch
git checkout master
git branch new-branch-for-commits
# preserve uncommited changes
git stash
# removing any local changes that aren't commited in new branch or stashed
git fetch --all
git reset --hard origin/master
# reapply uncommitted changes
git stash pop

# store credentials
git config --global credential.helper store

# Pull updates for all git repos in a directory
find . -type d -maxdepth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;
# test command
find . -type d -depth 1 -exec echo git --git-dir={}/.git --work-tree=$PWD/{} status \;



# find and replace all in a file:
sed -i 's/original/new/g' file.txt
# Explanation: sed = Stream EDitor
# -i = in-place (i.e. save back to the original file)
# The command string:
# s = the substitute command
# original = a regular expression describing the word to replace (or just the word itself)
# new = the text to replace it with
# g = global (i.e. replace all and not just the first occurrence)
# file.txt = the file name

# Check a webserver's info in HTTP Header Response (Apache)
curl --head http://your.webserver.com/

# wget entire page and fix links for offline viewing
wget -p -k http://www.example.com/

## grep
# exclude phrase
grep -v "phrase"

## References
# https://stackoverflow.com/questions/3497123/run-git-pull-over-all-subdirectories
