# tls-certificate

Terraform module that creates locally signed certificates, self-signed certificates, or intermediate Certificate Authorities based on the provided configuration. It offers flexibility in generating certificates, private keys, certificate chains, and allows customization of organization details, key sizes, allowed uses, and options for saving to PEM files.

# Example of usage
```terraform
module "locally_signed_cert" {
  source = "git::https://github.com/mateusz-uminski/terraform-service-modules//tls-certificate?ref=main"

  # required variables
  organization_name = "microcloud"
  domain_name       = "test.sandbox.corp.microcloud.com"

  # optional variables
  key_size = 2048

  additional_dns_names = ["test2.sandbox.corp.microcloud.com"]

  is_intermediate_ca = false

  ca_private_key_pem = <<-EOF
    -----BEGIN RSA PRIVATE KEY-----
    ...
    -----END RSA PRIVATE KEY-----
  EOF

  ca_cert_pem = <<-EOF
    -----BEGIN CERTIFICATE----
    ...
    -----END CERTIFICATE-----
  EOF

  ca_cert_chain_pem  = ""

  allowed_uses = [
    "server_auth",
    "client_auth",
  ]

  save_to_pem_files = true
}
```
