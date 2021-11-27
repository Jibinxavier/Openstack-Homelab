resource "openstack_compute_flavor_v2" "tiny-flavor" {
  name  = "tiny"
  ram   = "1024"
  vcpus = "1"
  disk  = "10"
 
}
resource "openstack_compute_flavor_v2" "small-flavor" {
  name  = "small"
  ram   = "2024"
  vcpus = "1"
  disk  = "20"
 
}
resource "openstack_compute_flavor_v2" "medium1-flavor" {
  name  = "medium01"
  ram   = "4096"
  vcpus = "2"
  disk  = "40"
 
}
resource "openstack_compute_flavor_v2" "medium2-flavor" {
  name  = "medium02"
  ram   = "4096"
  vcpus = "2"
  disk  = "100"
 
}

resource "openstack_compute_flavor_v2" "large01-flavor" {
  name  = "large01"
  ram   = "4096"
  vcpus = "4"
  disk  = "300"
 
}

resource "openstack_compute_flavor_v2" "large02-flavor" {
  name  = "large02"
  ram   = "8096"
  vcpus = "4"
  disk  = "300"
 
}