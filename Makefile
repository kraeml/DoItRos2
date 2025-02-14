.PHONY: all clean

all: build

clean:
	rm -rf output
	PACKER_LOG=1 packer build box-config-local.json

build: clean
