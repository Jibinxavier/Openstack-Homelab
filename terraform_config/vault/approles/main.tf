
resource "vault_approle_auth_backend_role" "step5" { 
  
  role_name      = "step5-placement"
  token_policies = ["default",  "approle_step5_placement"]
}


output "step5-approle-role" {
  value = vault_approle_auth_backend_role.step5
}
