## Linux Quick Reference

lsb_release -a  # Ubuntu version
uname -a  # Kernel info

~/.gdbinit  # GNU Debugger (GDB) config
    set disassembly-flavor intel

wget -E -H -k -K -p <url>  # download a complete webpage and fix links for offline viewing
# -p, --page-requisites get all resources needed to display page
# -k --convert-links point links to local files
wget -p -k http://www.example.com/  # wget entire page and fix links for offline viewing
curl --head http://your.webserver.com/  # Check a webserver's info in HTTP Header Response (Apache)

# what is my public IP?
curl https://ipinfo.io/ip
wget -qO - https://ipinfo.io/ip

## Git
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

# Refresh a fork
# https://forum.gitlab.com/t/refreshing-a-fork/32469/2
git remote add upstream https://... # if not already added
git checkout master
git fetch upstream
git pull upstream master
git push origin master


# Pull updates for all git repos in a directory
find . -type d -maxdepth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;
# test command - git status
find . -type d -depth 1 -exec echo git --git-dir={}/.git --work-tree=$PWD/{} status \;

sed -i 's/original/new/g' file.txt  # find and replace all strings in a file
# Explanation: sed = Stream EDitor
# -i = in-place (i.e. save back to the original file)
# The command string:
# s = the substitute command
# original = a regular expression describing the word to replace (or just the word itself)
# new = the text to replace it with
# g = global (i.e. replace all and not just the first occurrence)

grep -v "phrase"  # exclude phrase

tty  # see what TTY you are on

## VIM
# Disable vim automatic visual mode on mouse select
# add to ~/.vimrc: set mouse-=a

# write a file that was opened read-only
:w !sudo tee %

zip -r archive.zip directory  # zip a directory and contents recursively

tar xvzf file.tar.gz  # Extract tar.gz

7z a new-`date -u +%Y-%m-%d-%H%M%SZ`.7z ./folder/  # compress with datetime name
7z e compressed.7z  # extract

du -h --max-depth=1 | sort -hr  # View directory sizes sorted, in human readable format

# kill other login sessions:
w # view sessions, or who
tty # see what our session is
ps -fu username # show a user's processes, -f full format listing
kill -HUP pid # process ID for other session

# infinite while loop one liner
$ while :; do ping google.com; done

# open file manager here
xdg-open .

# check Raspberry Pi hardware version
cat /proc/cpuinfo
cat /sys/firmware/devicetree/base/model


## References
# https://www.gnu.org/software/wget/manual/html_node/Recursive-Retrieval-Options.html
# https://stackoverflow.com/questions/3497123/run-git-pull-over-all-subdirectories
