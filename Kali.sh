### Kali Linux Quick Reference
# Tested against Kali Linux 2018.3

## Setup VM

# initialize new MAC address on creation

# set bridged networking

# login with default username password:
root:toor

# change password
passwd root

# set static IP address
# TODO
service networking restart

# generate new ssh keys
cd /etc/ssh/
rm /etc/ssh/ssh_host_*
dpkg-reconfigure openssh-server

# setup sshd to run at boot
update-rc.d -f ssh remove
update-rc.d -f ssh defaults
nano /etc/ssh/sshd_config
# verify 'PermitRootLogin yes' is not commented
systemctl enable ssh.service

# run sshd temporarily
systemctl start ssh.service
systemctl status ssh.service
systemctl stop ssh.service

# check apt sources: /etc/apt/sources.list:
deb http://http.kali.org/kali kali-rolling main non-free contrib
deb-src http://http.kali.org/kali kali-rolling main non-free contrib

# update everything
apt-get update; apt upgrade && apt full-upgrade

# add the VirtualBox guest additions
apt install virtualbox-guest-x11

# add a keyboard shortcut for 'gnome-terminal' to Ctrl+Alt+T

# check Kali version
grep VERSION /etc/os-release

# check kernel version
uname -a


## Tools
# Seclists
apt install seclists
#cd /usr/share/wordlists; git clone https://github.com/danielmiessler/SecLists

# Visual Studio Code / VSCode
# https://snapcraft.io/docs/installing-snap-on-kali
# Install snapcraft.io store
sudo apt update
sudo apt install snapd
# Additionally, enable and start both the snapd and the snapd.apparmor services with the following command:
sudo systemctl enable --now snapd apparmor
# To test your system, install the hello-world snap and make sure it runs correctly:
# $ snap install hello-world
# $ hello-world 6.3 from Canonical✓ installed
# $ hello-world
# Hello World!
# Install Snap Store App
# $ sudo snap install snap-store
snap install --classic code
snap run code
code  # if '/snap/bin' is in $PATH
export PATH="$PATH:/snap/bin"  # add the snap bin path to $PATH (not permanent unless in .bash_profile or .bashrc)
echo $PATH  # verify


# for installing python programs
# example https://github.com/Ganapati/RsaCtfTool
sudo apt install python3-venv

git clone https://github.com/Ganapati/RsaCtfTool
python3 -m venv --system-site-packages venv
source ./venv/bin/activate
sudo apt install libmpfr-dev
pip install -r requirements.txt 
# SageMath package was removed from kali apt...


## References
# https://null-byte.wonderhowto.com/how-to/build-beginner-hacking-kit-with-raspberry-pi-3-model-b-0184144/
    # TODO test bluetooth instructions for raspi
# https://lmgsecurity.com/enable-start-ssh-kali-linux/
# https://docs.kali.org/general-use/kali-linux-virtual-box-guest
# https://docs.kali.org/general-use/kali-linux-sources-list-repositories
