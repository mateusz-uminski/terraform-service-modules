output "private_key_pem" {
  value       = tls_private_key.ca.private_key_pem
  description = "The Private CA's private key in PEM format."
}

output "cert_pem" {
  value       = tls_self_signed_cert.ca.cert_pem
  description = "The Private CA's self-signed certificate in PEM format."
}
