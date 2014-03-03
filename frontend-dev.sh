#!/bin/sh

# Add repos
apt-add-repository ppa:brightbox/ruby-ng
add-apt-repository ppa:chris-lea/node.js
apt-get update

# install binaries
apt-get install -y git-core ruby rubygems nodejs

# Install npm globals
npm install bower -g
npm install grunt-cli -g

# install compass and plugins
gem install compass normalize-scss
gem install --pre sass-css-importer