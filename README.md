# vagrant-docker

Ubuntu Saucy Vagrant Virtual Box for running Docker containers.
Optionally installs node.js, grunt and bower for developing modern web frontends.
Optionally installs java tools for developing Tomcat7 web applications.

## Installing Vagrant on OSX:

    brew cask install vagrant

## If you don't have brew (and cask) yet:

    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
    brew tap phinze/cask & brew install brew-cask   

## Install these vagrant plugins first:
    vagrant plugin install vagrant-hostsupdater vagrant-vbguest
    
## Set environment:

    FRONTEND_DIR=/path/to/your/frontend/app
    BACKEND_DIR=/path/to/your/java/app
    DOCKER_DIR=/path/to/your/docker/files
    
The first two determine wether to install the front- and backend tools.
When you want to do this later, run `vagrant up --provision`. Of course `vagrant halt` your box first.

The DOCKER_DIR could be pointing to a git clone of these used docker files:
[docker-services](https://github.com/Morriz/docker-services)

## Then boot your vagrant image:

    # cd to this folder, containing the Vagrantfile
    vagrant up
    
## And see if your containers are running

    dp
(see `~/.bashrc` for the docker aliases I provided)

## When not running

    bin/boot.sh
    
## Init mysql data for the first and only time

    bin/init-mysql-data.sh
    
## Go see the apps that run out of the box

* [morriz/tomcat](http://vagrant.dev:8080) (will not have an app to run yet, since we mounted the empty /data/tomcat)
* [arcus/kibana](http://vagrant.dev)
* [lopter/collectd-graphite](http://vagrant.dev:8081)
        