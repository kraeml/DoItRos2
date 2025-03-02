.PHONY: all clean add up build

all: build add up

clean:
	rm -rf output || true
	
add:
	vagrant destroy --force || true
	vagrant box remove --force doitpib || true
	vagrant box add doitpib ./builds/ubuntu-desktop-jammy-de.box

up:
	VAGRANT_VAGRANTFILE=Vagrantfile-doitpib vagrant up

build: clean
	PACKER_LOG=1 packer build box-config-local.json
	