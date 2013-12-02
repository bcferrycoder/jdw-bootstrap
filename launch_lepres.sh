#!/bin/bash

# serve slides

cd /home/jdw/lepres

# get latest
git pull

# start presentation
ruby pres.rb
