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

variable "allowed_uses" {
  type        = list(string)
  description = "A list of allowed uses for the Private CA's certificates."
  default = [
    "key_encipherment",
    "cert_signing",
    "server_auth",
    "client_auth",
  ]
}

variable "save_to_pem_files" {
  type        = bool
  description = "A boolean flag indicating whether to save the Private CA's private key and certificate to PEM files."
  default     = false
}
