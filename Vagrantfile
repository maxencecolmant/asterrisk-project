
Vagrant.configure("2") do |config|
  config.vm.define "asteriskmaster" do |asteriskmaster|
    asteriskmaster.vm.box = "debian/stretch64"
    asteriskmaster.vm.hostname = 'asteriskmaster'
    asteriskmaster.vm.provision :shell, path: "install_asterisk.sh"

    asteriskmaster.vm.network :private_network, ip: "192.168.56.101"

    asteriskmaster.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--name", "asteriskmaster"]
    end
  end

  config.vm.define "asteriskslave" do |asteriskslave|
    asteriskslave.vm.box = "debian/stretch64"
    asteriskslave.vm.hostname = 'asteriskslave'
    asteriskslave.vm.provision :shell, path: "install_asterisk.sh"

    asteriskslave.vm.network :private_network, ip: "192.168.56.102"

    asteriskslave.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--name", "asteriskslave"]
    end
  end
end