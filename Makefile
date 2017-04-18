DEPLOYHOST=toke.de
DEPLOYPATH=/var/www/sites/newtoke.de
IPFSKEY=toke.de
ODIR=public

all: build upload ipfs

build:
	hugo

$(ODIR)/*:
	hugo

ipfs: $(ODIR)/*
	ipfs name publish -k $(IPFSKEY) `ipfs add -r --pin=true -Q  $(ODIR)/`

upload: $(ODIR)/*
	rsync -rv $(ODIR)/ $(DEPLOYHOST):$(DEPLOYPATH)


.PHONY: clean
clean:
	rm -rf $(ODIR)/*
