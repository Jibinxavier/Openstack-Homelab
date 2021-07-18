# Define required providers
terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.35.0"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  user_name   = "admin"
  tenant_name = "admin"
  password    = var.api_pass
  auth_url    = "http://controller:5000/v3"
  region      = "RegionOne"
}
data "openstack_compute_flavor_v2" "tiny" {
  name = "tiny"
}

data "openstack_compute_flavor_v2" "small" {
  name = "small"
}


data "openstack_compute_flavor_v2" "medium" {
  name = "medium"
} 


data "openstack_compute_flavor_v2" "large" {
  name = "large"
} 
resource "openstack_compute_keypair_v2" "test-keypair" {
  name = "my-keypair"
}
data "openstack_networking_network_v2" "network" {
  name = "network1"
} 

resource "openstack_images_image_v2" "ubuntu" {
  name             = "Ubuntu"
  image_source_url = "https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
  container_format = "bare"
  disk_format      = "qcow2"

  properties = {
    key = "value"
  }
}

resource "openstack_images_image_v2" "centos7" {
  name             = "Centos7"
  image_source_url = "https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-2009.qcow2"
  container_format = "bare"
  disk_format      = "qcow2"

  properties = {
    key = "value"
  }
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
  cidr       = "192.168.9.0/24"
  ip_version = 4
  dns_nameservers  = ["8.8.4.4"]
  gateway_ip = "192.168.9.1"
  allocation_pool {
    # dnsmasq (DHCP) has an allocation pool between 192.168.9.100 and 192.168.9.120
    start = "192.168.9.121"
    end  = "192.168.9.200"
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


