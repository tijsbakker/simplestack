# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "base-trusty"

  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.network :private_network, ip: "192.168.33.101"

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.ssh.forward_agent = true

  config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

  config.vm.synced_folder "~/Sites", "/home/ubuntu/sites",

    :nfs => true,
    :mount_options => ['actimeo=2']

    config.vm.provider :virtualbox do |vb|

    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]

  end

  config.vm.provision :shell, :path => "bootstrap.sh"

  config.vm.provision :salt do |salt|

    salt.bootstrap_options = "-F -c /tmp/ -P"
    salt.minion_config = "salt/minion"
    salt.run_highstate = true
    salt.colorize = true
    salt.log_level = "error"

  end

end
