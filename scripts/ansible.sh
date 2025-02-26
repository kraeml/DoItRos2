#!/bin/bash -eux

if [ -f /etc/apt/trusted.gpg ]
then
    cat /etc/apt/trusted.gpg >> /etc/apt/trusted.gpg.d/trusted.gpg
    rm /etc/apt/trusted.gpg
fi

# Install Ansible repository.
if [ ! -f /etc/apt/sources.list.d/ansible-ubuntu-ansible-noble.sources ]
then
    apt-get update --yes && apt-get --yes upgrade
    apt-get --yes install software-properties-common
    apt-add-repository --yes ppa:ansible/ansible

    # Install Ansible.
    apt-get update
    apt-get install --yes ansible
fi
