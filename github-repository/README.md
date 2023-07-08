# github-repository

Terraform module that creates a github repository and enforces branch protection.

# Example of usage
```terraform
module "repository" {
  source = "git::https://github.com/mateusz-uminski/terraform-service-modules//github-repository?ref=main"

  # required variables
  name                 = "my-repo"

  # optional variables
  protected_branch     = "main"
  visibility           = "public"
  required_status_checks = ["check1", "check2"]
}
```
