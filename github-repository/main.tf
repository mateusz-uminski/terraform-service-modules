resource "github_repository" "main" {
  name = var.name

  visibility       = var.visibility
  license_template = var.license

  allow_merge_commit = false
  allow_rebase_merge = false
  allow_squash_merge = true

  allow_update_branch    = true
  delete_branch_on_merge = true

  has_wiki      = true
  has_projects  = true
  has_downloads = true
  has_issues    = true
}

resource "github_branch_protection" "main" {
  repository_id = github_repository.main.name

  pattern        = var.protected_branch
  enforce_admins = true

  require_signed_commits = true

  required_status_checks {
    strict   = true
    contexts = var.required_status_checks
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    required_approving_review_count = 0
  }

  require_conversation_resolution = true
}
