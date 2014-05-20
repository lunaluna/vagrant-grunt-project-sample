# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "aceunion-phpbox"
  config.vm.provision :shell, :path => "acescript.sh"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine.
  # Eg. accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, guest: 80,   host: 8080
  config.vm.network :forwarded_port, guest: 35729, host: 35729

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777","fmode=777"]

  # Set Host name
  config.vm.host_name = "vagrant"
end
