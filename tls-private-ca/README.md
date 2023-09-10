# tls-private-ca

Terraform module that creates a private certificate authority.

# Example of usage
```terraform
module "ca" {
  source = "git::https://github.com/mateusz-uminski/terraform-service-modules//tls-private-ca?ref=main"

  # required variables
  organization_name = "microcloud"
  domain_name       = "ew1.sbx.vpn.microcloud.com"

  # optional variables
  key_size = 2048

  allowed_uses = [
    "key_encipherment",
    "cert_signing",
    "server_auth",
    "client_auth",
  ]

  save_to_file = true
}
```
