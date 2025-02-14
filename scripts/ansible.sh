#!/bin/bash -eux

if [ -f /etc/apt/trusted.gpg ]
then
    cp /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d/
fi

# Install Ansible repository.
apt-get update --yes && apt-get --yes upgrade
apt-get --yes install software-properties-common
apt-add-repository --yes ppa:ansible/ansible

# Install Ansible.
apt-get update
apt-get install --yes ansible
