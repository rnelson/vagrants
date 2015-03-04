# -*- mode: ruby -*-
# vi: set ft=ruby :

def loaduserconfig(config)
  parent_dir = File.expand_path('..', File.dirname(File.expand_path(__FILE__)))
  script = "#{parent_dir}/vm.rb"
  
  if File.exists?(script)
    require script
    if Object.const_defined?('VagrantConfig')
      c = VagrantConfig.new
      c.configure config
    end
  end
end

Vagrant.configure(2) do |config|
  config.vm.guest = :freebsd
  config.vm.box = 'arkadi/freebsd-10.1-amd64'
  config.vm.network 'private_network', ip: '10.0.1.10'
  config.ssh.keep_alive = true

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--memory', '512']
    vb.customize ['modifyvm', :id, '--cpus', '2']
    vb.customize ['modifyvm', :id, '--hwvirtex', 'on']
    vb.customize ['modifyvm', :id, '--audio', 'none']
  end

  config.vm.provision :shell, :path => 'install_rsetup.sh'
  loaduserconfig config
end
