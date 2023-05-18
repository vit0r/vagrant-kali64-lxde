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
    apt-get install -y curl crowbar python3-dev gparted alsa-utils transmission unrar build-essential vim tor lame libavcodec-extra ffmpeg transmission-cli
    curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    apt-get update
    apt-get install -y brave-browser
    usermod -a -G audio vagrant
    cp -arv /vagrant/etc/proxychains.conf /etc/proxychains.conf
    cp -arv /vagrant/etc/interfaces /etc/network/interfaces
    systemctl enable --now tor
    reboot
  SHELL
end
