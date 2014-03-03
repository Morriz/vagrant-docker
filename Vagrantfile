# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "saucy64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/saucy/current/saucy-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.hostname = "vagrant.dev"
  config.vm.network :private_network, ip: "192.168.65.2"

  if Vagrant.has_plugin?("vagrant-hostsupdater")
    config.hostsupdater.remove_on_suspend = false
  end

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
    config.cache.synced_folder_opts = {
      type: :nfs,
      mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
    }
  end

  config.vm.provision "shell", path: "bootstrap.sh"

  # install docker daemon
  config.vm.provision "docker"

  # dns fix
#  config.vm.provision "shell", inline: "echo 'nameserver 8.8.8.8' >> /etc/resolv.conf"

  # frontend development? > mount host backend folder and install tools
  unless (ENV['FRONTEND_DIR'] || "").empty?
    config.vm.synced_folder ENV['FRONTEND_DIR'], "/frontend"
    config.vm.provision "shell", path: "frontend-dev.sh"
  end

  # backend development? > mount host backend folder and install tools
  unless (ENV['BACKEND_DIR'] || "").empty?
    config.vm.synced_folder ENV['BACKEND_DIR'], "/backend"
    config.vm.provision "shell", path: "backend-dev.sh"
  end

  # mount host docker folder if asked for
  unless (ENV['DOCKER_DIR'] || "").empty?
    config.vm.synced_folder ENV['DOCKER_DIR'], "/docker"
  end

end
