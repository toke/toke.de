#!/bin/bash


hugo

(ipfs name publish -k toke.de $(ipfs add -r --pin=true -Q  public/)>> /tmp/publish_ipfs.log)&

rsync -rv public/ toke.de:/var/www/sites/newtoke.de/
