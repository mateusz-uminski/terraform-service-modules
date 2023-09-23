# tls-private-ca

Terraform module that creates a private certificate authority.

# Example of usage
```terraform
module "ca" {
  source = "git::https://github.com/mateusz-uminski/terraform-service-modules//tls-private-ca?ref=main"

  # required variables
  organization_name = "microcloud"
  domain_name       = "shared.corp.microcloud.com"

  # optional variables
  key_size = 2048

  allowed_uses = [
    "key_encipherment",
    "cert_signing",
    "server_auth",
    "client_auth",
  ]

  save_to_pem_files = true
}
```
