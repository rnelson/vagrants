# Note that all paths are relative to Vagrantfile
class VagrantConfig
  def configure(config)
    config.vm.provider :virtualbox do |vb|
      vb.customize ['modifyvm', :id, '--memory', '1024']
      vb.customize ['modifyvm', :id, '--cpus', '1']
    end
    
    config.vm.synced_folder './', '/vagrant', :nfs => true, id: 'vagrant-root'
  end
end