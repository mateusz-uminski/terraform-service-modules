resource "tls_self_signed_cert" "main" {
  count = local.create_self_signed ? 1 : 0

  private_key_pem = tls_private_key.main.private_key_pem

  subject {
    common_name  = var.domain_name
    organization = var.organization_name
  }

  dns_names = concat([var.domain_name], var.additional_dns_names)

  allowed_uses = var.allowed_uses

  validity_period_hours = 24000
  early_renewal_hours   = 720
  is_ca_certificate     = false
}

locals {
  self_signed_cert_pem = local.create_self_signed ? tls_self_signed_cert.main[0].cert_pem : ""
}

resource "local_file" "self_signed_cert_pem" {
  count = var.save_to_pem_files && local.create_self_signed ? 1 : 0

  content  = local.self_signed_cert_pem
  filename = "${path.cwd}/certs/${var.domain_name}.cert"
}
