# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'socket'
VAGRANTFILE_API_VERSION = "2"
 
nodename = Socket.gethostname

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos/7"

  config.vm.provider :virtualbox do |v|
    v.memory = 2048
    v.cpus = 2
    v.linked_clone = true
  end

  boxes = []
  # Define three VMs with static private IP addresses.
  nuc_node1_boxes = [
    { :name => "nuc-node1-vm1", :ip => "192.168.114.71" } ,
    { :name => "nuc-node1-vm2", :ip => "192.168.114.72" } ,
    { :name => "nuc-node1-vm3", :ip => "192.168.114.73" }  
  ]
  nuc_node2_boxes = [
    { :name => "nuc-node2-vm1", :ip => "192.168.113.71" } ,
    { :name => "nuc-node2-vm2", :ip => "192.168.113.72" } ,
    { :name => "nuc-node2-vm3", :ip => "192.168.113.73" }  
  ]

  if nodename == "nuc-node1"
    boxes = nuc_node1_boxes
  else
    boxes = nuc_node2_boxes
  end 
  
  # Provision each of the VMs.
  boxes.each do |opts|
    config.vm.define opts[:name] do |config|
      config.vm.hostname = opts[:name]
      config.vm.network :private_network, ip: opts[:ip]
 
    #   config.vm.synced_folder "",  "/dgd"
     
    end
  end

end