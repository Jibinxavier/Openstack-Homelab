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

resource "openstack_compute_keypair_v2" "insecure-key" {
  name = "insecure-key"
}


