# -*- mode: ruby -*-

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu-14.04-xen"
  config.vm.box_url = "https://storage.googleapis.com/unikernel-vmware/ubuntu-14.04-xen.box"

  # config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.network :private_network, ip: "10.0.0.254", auto_config: false

  # config.vm.synced_folder "/tmp/mirage-vagrant-vms", "/host", type: "nfs"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
    vb.customize ["modifyvm", :id, "--cableconnected2", "on"]
  end

  config.vm.provision "shell", path: "scripts/opam.sh", privileged: false
  config.vm.provision "shell", path: "scripts/mirage.sh", privileged: false
  config.vm.provision "file", source: "scripts/interfaces", destination: "/tmp/interfaces"
  config.vm.provision "shell", inline: "mv /tmp/interfaces /etc/network/interfaces && ifdown eth1 && ifup eth1 && ifup br0 && resolvconf -u"
end
