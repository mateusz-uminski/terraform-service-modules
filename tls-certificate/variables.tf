variable "organization_name" {
  type        = string
  description = "The name of the organization."
}

variable "domain_name" {
  type        = string
  description = "The common name associated with the Private CA."
}

variable "key_size" {
  type        = number
  description = "The size of the cryptographic key used by the Private CA."
  default     = 4096
}

variable "additional_dns_names" {
  type        = list(string)
  description = "A list of additional DNS names allowed for the certificate (multi-domain / SAN certificate)."
  default     = []
}

variable "is_intermediate_ca" {
  type        = bool
  description = "Indicates whether to create an intermediate CA (true) or a locally signed certificate (false)."
  default     = false
}

variable "ca_private_key_pem" {
  type    = string
  default = "The private key in PEM format of the CA used to sign the certificate."
}

variable "ca_cert_pem" {
  type    = string
  default = "The certificate in PEM format of the CA used to sign the certificate."
}

variable "ca_cert_chain_pem" {
  type    = string
  default = "The certificate chain in PEM format of the CA used to sign the certificate."
}

variable "allowed_uses" {
  type        = list(string)
  description = "A list of allowed uses for the Private CA's certificates."
  default = [
    "server_auth",
    "client_auth"
  ]
}

variable "save_to_pem_files" {
  type        = bool
  description = "A boolean flag indicating whether to save the Private CA's private key and certificate to PEM files."
  default     = false
}
