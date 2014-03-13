#!/bin/sh

# Update packages
echo "deb http://archive.ubuntu.com/ubuntu saucy main universe" > /etc/apt/sources.list
apt-get update & apt-get -y upgrade
apt-get -y install software-properties-common

# install defaults
apt-get install -y python-software-properties mysql-client-core-5.5 curl telnet rsync wget vim

# dotfiles!
su -c "rsync -av /vagrant/dotfiles/ /home/vagrant/" -s /bin/sh vagrant
INCLUDE_PS1=". ~/.bash_ps1"
INCLUDE_GITPROMPT=". ~/.git-prompt"
BASHRC=/home/vagrant/.bashrc
if ! grep -q "$INCLUDE_PS1" $BASHRC; then
  echo "\n\n$INCLUDE_PS1" >> $BASHRC
fi
if ! grep -q "$INCLUDE_GITPROMPT" $BASHRC; then
  echo "\n\n$INCLUDE_GITPROMPT" >> $BASHRC
fi

# binaries
su -c "cp -r /vagrant/bin /home/vagrant/" -s /bin/sh vagrant
chmod u+x /home/vagrant/bin/*

# create persistent data folder for tomcat
su -c "mkdir -p /data/tomcat" -s /bin/sh vagrant


