
Vagrant.configure("2") do |config|
  config.vm.define "asteriskmaster" do |asteriskmaster|
    asteriskmaster.vm.box = "debian/stretch64"
    asteriskmaster.vm.hostname = 'asteriskmaster'
    asteriskmaster.vm.network "public_network", bridge: "en0: Wi-Fi (Wireless)"

    asteriskmaster.vm.provision :shell, path: "install_asterisk_master.sh"

    asteriskmaster.vm.provision "file", source: "./extensions.conf", destination: "/tmp/extensions.conf"
    asteriskmaster.vm.provision "shell",inline: "mv /tmp/extensions.conf /etc/asterisk/extensions.conf"


    
    
    asteriskmaster.vm.provision "file", source: "./ha.cf", destination: "/tmp/ha.cf"
    asteriskmaster.vm.provision "shell",inline: "mv /tmp/ha.cf /etc/ha.d/ha.cf"

    asteriskmaster.vm.provision "file", source: "./authkeys", destination: "/tmp/authkeys"
    asteriskmaster.vm.provision "shell",inline: "mv /tmp/authkeys /etc/ha.d/authkeys"
    
    
    asteriskmaster.vm.provision "file", source: "./sip.conf", destination: "/tmp/sip.conf"
    asteriskmaster.vm.provision "shell",inline: "mv /tmp/sip.conf /etc/asterisk/sip.conf"

    asteriskmaster.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "asteriskmaster"]
      v.customize ["modifyvm", :id, "--cpus", "1"]
    end
  end

  config.vm.define "asteriskslave" do |asteriskslave|
    asteriskslave.vm.box = "debian/stretch64"
    asteriskslave.vm.hostname = 'asteriskslave'
    asteriskslave.vm.network "public_network", bridge: "en0: Wi-Fi (Wireless)"
    

    asteriskslave.vm.provision :shell, path: "install_asterisk_slave.sh"

    asteriskslave.vm.provision "file", source: "./extensions.conf", destination: "/tmp/extensions.conf"
    asteriskslave.vm.provision "shell",inline: "mv /tmp/extensions.conf /etc/asterisk/extensions.conf"


    asteriskslave.vm.provision "file", source: "./sip.conf", destination: "/tmp/sip.conf"
    asteriskslave.vm.provision "shell",inline: "mv /tmp/sip.conf /etc/asterisk/sip.conf"
    
    asteriskslave.vm.provision "file", source: "./authkeys", destination: "/tmp/authkeys"
    asteriskslave.vm.provision "shell",inline: "mv /tmp/authkeys /etc/ha.d/authkeys"

    asteriskslave.vm.provision "file", source: "./ha.cf", destination: "/tmp/ha.cf"
    asteriskslave.vm.provision "shell",inline: "mv /tmp/ha.cf /etc/ha.d/ha.cf"

   

    asteriskslave.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 1024]
      v.customize ["modifyvm", :id, "--name", "asteriskslave"]
      v.customize ["modifyvm", :id, "--cpus", "1"]
    end
  end
end