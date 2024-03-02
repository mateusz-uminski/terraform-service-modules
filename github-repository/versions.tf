terraform {
  required_version = ">= 1.3.3"

  required_providers {
    aws = {
      source  = "integrations/github"
      version = ">= 5.0"
    }
  }
}
