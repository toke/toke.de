#!/bin/bash


hugo
rsync -rv public/ toke.de:/var/www/sites/new.toke.de/
