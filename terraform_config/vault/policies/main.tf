# Create admin policy in the root namespace
resource "vault_policy" "admin_policy" {
  name   = "admins"
  policy = file("${path.module}/policies-files/admin-policy.hcl")
}



resource "vault_policy" "app_step5_placement_policy" {
  name   = "approle_step5_placement"
  policy = file("${path.module}/policies-files/approle-step5-placement.hcl")
}