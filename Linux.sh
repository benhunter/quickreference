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

# tree - file and folder viewer
tree -ah --du -L 2  # show all files, human readable sizes, directory sizes, go down 2 levels

## References
# https://www.gnu.org/software/wget/manual/html_node/Recursive-Retrieval-Options.html
