# -*- mode: ruby -*-
# vi: set ft=ruby :

vmname = "kalilinux-rolling"

Vagrant.configure("2") do |config|
  config.vm.box = "kalilinux/rolling"
  config.vm.hostname = vmname
  config.vm.synced_folder "./synced_folder", "/vagrant"
  config.ssh.keep_alive = true
  config.vagrant.plugins = ["vagrant-scp", "vagrant-vbguest"]
  
  config.vm.provider "virtualbox" do |vb|
    vb.name = vmname
    vb.cpus = 2
    vb.memory = "4048"
    vb.gui = true
    vb.customize ["modifyvm", :id, "--vram", "128"]
  end
  
  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y crowbar python3-dev gparted alsa-utils transmission unrar build-essential vim tor lame libavcodec-extra ffmpeg transmission-cli
    usermod -a -G audio vagrant
    systemctl enable --now tor
    cp -arv /vagrant/etc/proxychains.conf /etc/proxychains.conf
    cp -arv /vagrant/etc/interfaces /etc/network/interfaces
  SHELL
   
end
