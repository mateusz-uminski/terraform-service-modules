resource "tls_private_key" "ca" {
  algorithm = "RSA"
  rsa_bits  = var.key_size
}

resource "tls_self_signed_cert" "ca" {
  private_key_pem = tls_private_key.ca.private_key_pem

  subject {
    common_name  = var.domain_name
    organization = var.organization_name
  }

  allowed_uses = var.allowed_uses

  validity_period_hours = 24000
  early_renewal_hours   = 720
  is_ca_certificate     = true
  set_authority_key_id  = true
}

resource "local_file" "private_key_pem" {
  count = var.save_to_pem_files ? 1 : 0

  content  = tls_self_signed_cert.ca.private_key_pem
  filename = "${path.cwd}/ca/${var.domain_name}.key"

  directory_permission = 755
  file_permission      = 644
}

resource "local_file" "cert_pem" {
  count = var.save_to_pem_files ? 1 : 0

  content  = tls_self_signed_cert.ca.cert_pem
  filename = "${path.cwd}/ca/${var.domain_name}.cert"

  directory_permission = 755
  file_permission      = 644
}
