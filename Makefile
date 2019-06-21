DEPLOYHOST=toke.de
DEPLOYPATH=/var/www/sites/toke.de
IPFSKEY=toke.de
ODIR=public

all: build upload ipfs

build:
	hugo
	hugo  -d ipfs_out -b /ipns/toke.de/

$(ODIR)/*:
	hugo

ipfs: $(ODIR)/*
	ipfs name publish -k $(IPFSKEY) `ipfs add -r --pin=true -Q  ipfs_out/`

upload: $(ODIR)/*
	rsync -rv $(ODIR)/ $(DEPLOYHOST):$(DEPLOYPATH)


.PHONY: clean
clean:
	rm -rf $(ODIR)/*
