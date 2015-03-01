# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.guest = :freebsd
  config.vm.box = "arkadi/freebsd-10.1-amd64"
  config.vm.network "private_network", ip: "10.0.1.10"

  config.vm.synced_folder "../", "/vagrant", :nfs => true, id: "vagrant-root"
  
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--hwvirtex", "on"]
    vb.customize ["modifyvm", :id, "--audio", "none"]
  end
  
  config.vm.provision :shell, :path => "install_rsetup.sh"
  config.vm.provision :shell, :path => "../vm.sh"
end