
resource "vault_approle_auth_backend_role" "step5" { 
  
  role_name      = "step5-placement"
  token_policies = ["default",  "approle_step5_placement"]
}


resource "vault_approle_auth_backend_role" "step6" { 
  
  role_name      = "step6-placement"
  token_policies = ["default",  "approle_step5_placement"]
}


resource "vault_approle_auth_backend_role" "openstack_dev" { 
  
  role_name      = "openstack-dev"
  token_policies = ["default",  "approle_openstack_dev"]
}

resource "vault_approle_auth_backend_role" "openstack-dev-write" { 
  
  role_name      = "openstack-dev-write"
  token_policies = ["default",  "approle_openstack_dev_write_policy"]
}

output "step6-approle-role" {
  value = vault_approle_auth_backend_role.step6
}


output "step5-approle-role" {
  value = vault_approle_auth_backend_role.step5
}


output "openstack_dev-approle-role" {
  value = vault_approle_auth_backend_role.openstack_dev
}



output "openstack_dev-write-approle-role" {
  value = vault_approle_auth_backend_role.openstack-dev-write
}
