# Create admin policy in the root namespace
resource "vault_policy" "admin_policy" {
  name   = "admins"
  policy = file("${path.module}/policies-files/admin-policy.hcl")
}



resource "vault_policy" "app_step5_placement_policy" {
  name   = "approle_step5_placement"
  policy = file("${path.module}/policies-files/approle-step5-placement.hcl")
}


resource "vault_policy" "openstack_dev_policy" {
  name   = "approle_openstack_dev"
  policy = file("${path.module}/policies-files/approle-openstack-dev.hcl")
}

resource "vault_policy" "openstack_dev_write_policy" {
  name   = "approle_openstack_dev_write_policy"
  policy = file("${path.module}/policies-files/approle-openstack-dev-write.hcl")
}