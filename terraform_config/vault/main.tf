# Use Vault provider
provider "vault" {
  # It is strongly recommended to configure this provider through the
  # environment variables:
  #    export VAULT_ADDR=https://192.168.9.1:8200
  #    export VAULT_TOKEN=s.asd
  #
  #    - VAULT_ADDR
  #    - VAULT_TOKEN
  #    - VAULT_CACERT
  #    - VAULT_CAPATH
  #    - etc.  
}



module "auth" {
  source = "./auth_backends"
}
 
module "policies" {
  source = "./policies"
}
 
module "secret_backends" {
  source = "./secret_backends"
}

 
module "approles" {
  source = "./approles"
  depends_on = [module.auth, module.policies] 
}

output "step5-approle-role" {
  value = module.approles.step5-approle-role 
}
