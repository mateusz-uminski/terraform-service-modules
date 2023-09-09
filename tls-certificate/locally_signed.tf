locals {
  o_dst = var.is_intermediate_ca ? "ca" : "certs"
}

resource "tls_cert_request" "main" {
  count = local.create_locally_signed ? 1 : 0

  private_key_pem = tls_private_key.main.private_key_pem

  subject {
    common_name  = var.domain_name
    organization = var.organization_name
  }

  dns_names = concat([var.domain_name], var.additional_dns_names)

  lifecycle {
    create_before_destroy = true
  }
}

resource "tls_locally_signed_cert" "main" {
  count = local.create_locally_signed ? 1 : 0

  cert_request_pem   = tls_cert_request.main[0].cert_request_pem
  ca_private_key_pem = var.ca_private_key_pem
  ca_cert_pem        = var.ca_cert_pem

  allowed_uses = var.allowed_uses

  validity_period_hours = 24000
  early_renewal_hours   = 720
  is_ca_certificate     = var.is_intermediate_ca

  lifecycle {
    create_before_destroy = true
  }
}

locals {
  locally_signed_cert_pem = local.create_locally_signed ? tls_locally_signed_cert.main[0].cert_pem : ""
}

resource "local_file" "locally_signed_cert_pem" {
  count = var.save_to_pem_files && local.create_locally_signed ? 1 : 0

  content  = local.locally_signed_cert_pem
  filename = "${path.cwd}/${local.o_dst}/${var.domain_name}.cert"
}

locals {
  cert_chain_pem = join("", [var.ca_cert_chain_pem, local.locally_signed_cert_pem])
}

resource "local_file" "cert_chain_pem" {
  count = var.save_to_pem_files && local.create_locally_signed && var.is_intermediate_ca ? 1 : 0

  content  = local.cert_chain_pem
  filename = "${path.cwd}/${local.o_dst}/${var.domain_name}.chain"
}
