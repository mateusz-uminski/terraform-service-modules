output "private_key_pem" {
  value       = tls_private_key.main.private_key_pem
  description = "The Private CA's private key in PEM format."
}

output "locally_signed_cert_pem" {
  value       = local.locally_signed_cert_pem
  description = "The locally signed certificate in PEM format."
}

output "chain_pem" {
  value       = local.cert_chain_pem
  description = "The certificate chain in PEM format for the intermediate CA."
}

output "self_signed_cert_pem" {
  value       = local.self_signed_cert_pem
  description = "The self-signed certificate in PEM format."
}
