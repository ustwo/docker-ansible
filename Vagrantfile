# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "ubuntu/trusty64"
  # config.vm.network "forwarded_port", guest: 22, host: 2299
  config.vm.network "private_network", ip: "192.168.33.99"
end
