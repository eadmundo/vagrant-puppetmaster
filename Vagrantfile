# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.box = "precise64"

  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Update apt
  config.vm.provision :shell, :inline => "aptitude -q2 update"

  # Puppet bootstrap - update apt cache
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file  = "bootstrap/apt-update.pp"
  end

  # Puppet bootstrap - install augeas
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file  = "bootstrap/vagrant-puppet.pp"
  end

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.module_path = "puppet/modules"
    puppet.manifest_file  = "site.pp"
  end

  config.vm.define :puppetmaster do |puppetmaster_config|
    puppetmaster_config.vm.network :hostonly, "173.16.1.101"
    puppetmaster_config.vm.host_name = 'puppet'
    puppetmaster_config.vm.share_folder("vagrant-root", "/vagrant", ".", :nfs => ["acregmin=1", "acregmax=1"], :nfs_version => 3)
  end

  config.vm.define :puppetslave do |puppetslave_config|
    puppetslave_config.vm.network :hostonly, "173.16.1.102"
    puppetslave_config.vm.host_name = 'puppetslave.vagrant'
    puppetslave_config.vm.provision :puppet_server do |puppet|
      puppet.puppet_server = "puppet"
      puppet.options = ["--no-daemonize", "--onetime", "--verbose" ]
    end
  end

end
