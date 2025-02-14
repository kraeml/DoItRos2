#!/bin/bash -eux
# [%ansible_managed%]

# Uninstall Ansible and remove PPA.
#apt -y remove --purge ansible
#apt-add-repository --remove ppa:ansible/ansible

# Apt cleanup.
apt-get update
apt-get dist-upgrade --yes
apt-get autoremove --yes
apt-get --yes clean
apt-get --yes autoclean

# Clean up log files
find /var/log -type f | while read -r f; do echo -ne '' > "${f}"; done;

echo "==> Clearing last login information"
echo -ne '' > /var/log/lastlog
echo -ne '' > /var/log/wtmp
echo -ne '' > /var/log/btmp

echo Clean up proxies if exists
if [[ -f /etc/apt/apt.conf.d/01proxy ]]; then
  rm /etc/apt/apt.conf.d/01proxy
fi

echo Delete unneeded files.
rm -f /home/vagrant/*.sh

echo Zero out the rest of the free space using dd, then delete the written file.
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

echo Add sync # so Packer doesn't quit too early, before the large file is deleted.
sync
