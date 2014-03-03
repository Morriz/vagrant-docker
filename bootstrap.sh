#!/bin/sh

# Update packages
echo "deb http://archive.ubuntu.com/ubuntu saucy main universe" > /etc/apt/sources.list
apt-get update

# install defaults
apt-get install -y python-software-properties curl telnet rsync wget vim

# dotfiles!
cp /vagrant/dotfiles/.* /home/vagrant/