# github-repository

Terraform module that creates a github repository and enforces branch protection.

# Usage
```terraform
module "repository" {
  source = "git::https://github.com/mateusz-uminski/terraform-service-modules//github-repository?ref=main"

  # required variables
  name = "my-repo"

  # optional variables
  visibility             = "public"
  license                = "mit"
  protected_branch       = "main"
  required_status_checks = ["check1", "check2"]
}
```
