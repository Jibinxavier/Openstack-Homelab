resource "openstack_images_image_v2" "ubuntu" {
  name             = "Ubuntu20"
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