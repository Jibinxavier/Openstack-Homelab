resource "openstack_networking_network_v2" "network_1" {
  name           = "network1"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet_1" {
  network_id = "${openstack_networking_network_v2.network_1.id}"
  cidr       = "10.1.0.0/24"
}



resource "openstack_networking_network_v2" "provider" {
  name           = "provider"
  admin_state_up = "true"
  external ="true"
  shared = "true"
  segments  { 
    physical_network ="provider"  # based on ml2_conf.ini. From https://docs.openstack.org//install-guide/InstallGuide.pdf
    network_type =  "flat"
  }
}


resource "openstack_networking_subnet_v2" "provider_subnet" {
  name       = "provider_subnet"
  network_id = "${openstack_networking_network_v2.provider.id}"
  cidr       = "192.168.10.0/24"
  ip_version = 4
  dns_nameservers  = ["8.8.4.4"]
  gateway_ip = "192.168.10.1"
  allocation_pool {
   
    start = "192.168.10.3"
    end  = "192.168.10.200"
  }
}


#   create a self-service (private) network that connects to the physical network infrastructure via NAT.

resource "openstack_networking_network_v2" "selfservice" {
  name           = "selfservice"
 
}

resource "openstack_networking_subnet_v2" "selfservice_subnet" {
  name       = "selfservice_subnet"
  network_id = "${openstack_networking_network_v2.selfservice.id}"
  cidr       = "172.16.1.0/24"
  ip_version = 4
  dns_nameservers  = ["8.8.4.4"]
  gateway_ip = "172.16.1.1"
  
}

# Self-service networks connect to provider networks using a virtual router that typically performs bidirectional NAT.


resource "openstack_networking_router_v2" "self_service_router" {
  name                = "self_service_router"
  admin_state_up      = true
  external_network_id = "${openstack_networking_network_v2.provider.id}"
}

resource "openstack_networking_router_interface_v2" "self_service_router_interface_1" {
  router_id = "${openstack_networking_router_v2.self_service_router.id}"
  subnet_id = "${openstack_networking_subnet_v2.selfservice_subnet.id}"
}


