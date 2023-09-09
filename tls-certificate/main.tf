locals {
  create_self_signed    = var.ca_private_key_pem == "" || var.ca_cert_pem == "" ? true : false
  create_locally_signed = var.ca_private_key_pem != "" && var.ca_cert_pem != "" ? true : false
}

resource "tls_private_key" "main" {
  algorithm = "RSA"

  rsa_bits = var.key_size
}

resource "local_file" "private_key_pem" {
  count = var.save_to_pem_files ? 1 : 0

  content  = tls_private_key.main.private_key_pem
  filename = "${path.cwd}/${local.o_dst}/${var.domain_name}.key"
}
