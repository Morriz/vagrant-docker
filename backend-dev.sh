#!/bin/sh

# Update packages and install repos
add-apt-repository ppa:webupd8team/java
apt-get update

# install java tools
apt-get install -y oracle-java7-installer oracle-java7-set-default maven

# copy casengo settings
cp /vagrant/.m2/settings.xml /home/vagrant/.m2/
chown vagrant:vagrant /home/vagrant/.m2/settings.xml