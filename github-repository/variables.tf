variable "name" {
  type        = string
  description = "The name of the github repository."
}

variable "protected_branch" {
  type        = string
  description = "The name of the branch to be protected."
  default     = "main"
}

variable "visibility" {
  type        = string
  description = "The visibility of the github repository."
  default     = "public"
}

variable "license" {
  type        = string
  description = "The license type for the github repository."
  default     = "mit"
}

variable "required_status_checks" {
  type        = list(string)
  description = "A list of required status checks for branch protection."
  default     = []
}
