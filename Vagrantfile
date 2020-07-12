# -*- mode: ruby -*-
# vi: set ft=ruby :

vmname = "vm-kali2019"

Vagrant.configure("2") do |config|
  config.vm.box = "kalilinux/rolling"
  config.vm.hostname = vmname
  config.vm.synced_folder "./synced_folder", "/vagrant"
  config.ssh.keep_alive = true
  config.vagrant.plugins = ["vagrant-scp", "vagrant-vbguest"]
  
  config.vm.provider "virtualbox" do |vb|
    vb.name = vmname
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
