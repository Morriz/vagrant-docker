# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "99designs/ubuntu-saucy-docker"
#  config.vm.box = "saucy64"
#  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.hostname = "vagrant.dev"
  config.vm.network :private_network, ip: "192.168.65.2"

  config.vm.provider :virtualbox do |v|
    v.name = "vagrant-docker"
    v.memory = 4096
    v.cpus = 4
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "50"]
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end

  if Vagrant.has_plugin?("vagrant-hostsupdater")
    config.hostsupdater.remove_on_suspend = false
  end

  config.vm.provision "docker" do |d|
    d.pull_images "busybox"
    d.pull_images "morriz/mysql"
    d.pull_images "morriz/tomcat"
    d.pull_images "lopter/collectd-graphite"
    d.pull_images "arcus/elasticsearch"
    d.pull_images "arcus/logstash"
    d.pull_images "arcus/kibana"
  end

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"
  config.vm.provision "shell", path: "bootstrap.sh"

  RSYNCEXCLUDE = [".git", "node_modules"]

  # frontend development? > mount host backend folder and install tools
  unless (ENV['FRONTEND_DIR'] || "").empty?
    config.vm.synced_folder ENV['FRONTEND_DIR'], "/frontend", type: "rsync",
      rsync__exclude: RSYNCEXCLUDE
    config.vm.provision "shell", path: "frontend-dev.sh"
  end

  # backend development? > mount host backend folder and install tools
  unless (ENV['BACKEND_DIR'] || "").empty?
    config.vm.synced_folder ENV['BACKEND_DIR'], "/backend", type: "rsync",
      rsync__exclude: RSYNCEXCLUDE
    config.vm.provision "shell", path: "backend-dev.sh"
  end

  # docker development? > mount host docker folder if asked for
  unless (ENV['DOCKER_DIR'] || "").empty?
    config.vm.synced_folder ENV['DOCKER_DIR'], "/docker", type: "rsync",
      rsync__exclude: RSYNCEXCLUDE
  end

end

