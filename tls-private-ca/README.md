# tls-private-ca

Terraform module that creates a private certificate authority.

# Usage
```terraform
module "ca" {
  source = "github.com/mateusz-uminski/terraform-service-modules//tls-private-ca?ref=main"

  # required variables
  organization_name = "<organization name>"
  domain_name       = "custom-domain.example.com"

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
