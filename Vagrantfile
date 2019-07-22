# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "offensive-security/kali-linux"
  config.vm.hostname = "vmkali2019"
  config.vm.synced_folder "./etc", "/vagrant/etc"
  config.ssh.keep_alive = true
  config.vagrant.plugins = ["vagrant-scp", "vagrant-vbguest"]
  
  config.vm.provider "virtualbox" do |vb|
    vb.name = "vmkali"
    vb.cpus = 2
    vb.memory = "2048"
    vb.gui = true
    vb.customize ["modifyvm", :id, "--vram", "128"]
  end
  
   config.vm.provision "install_pkg",
   type: "shell",
   path: "./provision.sh",
   run: "aways",
   preserve_order: true
   
end
