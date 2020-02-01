Vagrant.configure("2") do |config|
  config.vm.box = "debian/stretch64"
  #config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.hostname = "Asterisk"
  config.vm.network "public_network"
  config.vm.provider :virtualbox do |vb|
	vb.customize ["modifyvm", :id, "--memory", "1024", ]
	vb.customize ["modifyvm", :id, "--cpus", "1"]
  config.vm.provision :shell, path: "install_asterisk.sh"
  end
end
