#!/bin/sh

# Update packages
echo "deb http://archive.ubuntu.com/ubuntu saucy main universe" > /etc/apt/sources.list
apt-get update && apt-get -y upgrade

# install defaults
apt-get install -y software-properties-common python-software-properties mysql-client curl telnet rsync wget vim git-core

# dotfiles!
su -c "rsync -av /vagrant/dotfiles/ /home/vagrant/" -s /bin/sh vagrant
BASHRC=/home/vagrant/.bashrc
if ! grep -q ". ~/.bash_ps1" $BASHRC; then
  echo "\n\n. ~/.bash_ps1\n. ~/.git-prompt\n. ~/.bash_functions" >> $BASHRC
fi

# binaries
su -c "cp -r /vagrant/bin /home/vagrant/" -s /bin/sh vagrant
chmod u+x /home/vagrant/bin/*


