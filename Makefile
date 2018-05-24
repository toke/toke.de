DEPLOYHOST=toke.de
DEPLOYPATH=/var/www/sites/newtoke.de
IPFSKEY=toke.de
ODIR=public

all: build upload ipfs

build:
	hugo
	hugo  -d ipfs_out -b /ipns/QmSpkgEU65f7Ce51gpmV2jzQSuJfuGUCge8BEY3jj3SQtF/

$(ODIR)/*:
	hugo

ipfs: $(ODIR)/*
	ipfs name publish -k $(IPFSKEY) `ipfs add -r --pin=true -Q  ipfs_out/`

upload: $(ODIR)/*
	rsync -rv $(ODIR)/ $(DEPLOYHOST):$(DEPLOYPATH)


.PHONY: clean
clean:
	rm -rf $(ODIR)/*
