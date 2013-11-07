# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest

  config.vm.provider :virtualbox do |provider|
    provider.customize ["modifyvm", :id, "--memory", "512"]
    config.vm.box = "ubuntu-precise-12.04.1-lts"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  end

  def config.machine(name, ip, roles = [])
    self.vm.define name do |node|
      node.vm.network :private_network, ip: ip
      chef_solo(name, node, roles)
    end
  end

  # Machines
  config.machine("databag.test", "10.33.33.33", %w(data_bag))
 
  def chef_solo(name, node, additional_roles = [])
    node.vm.provision :chef_solo do |chef|
      chef.roles_path = "roles"
      chef.data_bags_path = "data_bags"
      chef.node_name = "databag_node"     
      chef.add_role "bag"
      chef.encrypted_data_bag_secret_key_path = "/tmp/my_data_bag_key"
    end
  end

end
