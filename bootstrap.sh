#!/bin/sh

# Update packages
echo "deb http://archive.ubuntu.com/ubuntu saucy main universe" > /etc/apt/sources.list
apt-get update & apt-get -y upgrade
apt-get -y install software-properties-common

# install defaults
apt-get install -y python-software-properties curl telnet rsync wget vim

# dotfiles!
su -c "rsync -av /vagrant/dotfiles/ /home/vagrant/" -s /bin/sh vagrant
INCLUDE="\n\n. ~/.bash_ps1\n. ~/.git-prompt"
BASHRC=/home/vagrant/.bashrc
if ! grep -q $INCLUDE $BASHRC; then
  echo $INCLUDE >> $BASHRC
fi

# binaries
su -c "cp -r /vagrant/bin /home/vagrant/" -s /bin/sh vagrant
chmod u+x /home/vagrant/bin/*

# create persistent data folder for tomcat
mkdir -p /data/tomcat


