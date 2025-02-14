#!/bin/bash -eux
export VAGRANT_VAGRANTFILE=${1:-"ubuntu2004/Vagrantfile-de"}
VAGRANT_BOX_NAME=$(grep file $(echo $VAGRANT_VAGRANTFILE) | cut -d '"' -f 2)
VAGRANT_BOX_PATH=$(echo $VAGRANT_BOX_NAME | cut -d '/' -f 3,4)
if [[ "$VAGRANT_VAGRANTFILE" == "ubuntu2004/Vagrantfile-geerling" ]]
then
  #echo $VAGRANT_BOX_NAME
  vagrant destroy --force || true
  vagrant box update || true
else
  vagrant box add --force $(dirname ${VAGRANT_VAGRANTFILE})/${VAGRANT_BOX_PATH} --name ${VAGRANT_BOX_NAME}
fi
vagrant up
vagrant ssh-config > $(dirname ${VAGRANT_VAGRANTFILE})/vagrant_ssh-config
vagrant ssh
vagrant destroy --force
if [[ "$VAGRANT_VAGRANTFILE" != "ubuntu2004/Vagrantfile-geerling" ]]
then
  vagrant box remove ${VAGRANT_BOX_NAME}
fi
