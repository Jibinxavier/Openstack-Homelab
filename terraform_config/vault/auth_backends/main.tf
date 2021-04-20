# Create the approle backend
resource "vault_auth_backend" "approle" {
  type = "approle"
}
