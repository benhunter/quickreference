### Kali Linux Quick Reference

## Setup VM

# initialize new MAC address on creation

# set bridged networking

# login with default username password:
root:toor

# change password
passwd root

# generate new ssh keys
cd /etc/ssh/
dpkg-reconfigure openssh-server

# setup sshd to run at boot
update-rc.d -f ssh remove
update-rc.d -f ssh defaults
nano /etc/ssh/sshd_config
# verify 'PermitRootLogin yes' is not commented

# update everything
apt-get update && apt-get upgrade && apt-get dist-upgrade


## References
# https://null-byte.wonderhowto.com/how-to/build-beginner-hacking-kit-with-raspberry-pi-3-model-b-0184144/

