resource "github_repository" "repos" {
  for_each    = var.repositories
  name        = each.key
  description = each.value.description
  visibility  = each.value.visibility
  auto_init   = true
}

resource "github_branch" "main"{
  for_each    = var.repositories
  repository  = github_repository.repos[each.key].name
  branch      = "main"
}

resource "github_branch_default" "default"{
  for_each    = var.repositories
  repository  = github_repository.repos[each.key].name
  branch      = "main"
}

resource "github_branch_protection_v3" "main" {
  for_each = var.repositories

  repository     = github_repository.repos[each.key].name
  branch         = "main"
  enforce_admins = true

  required_status_checks {
    strict   = true
    contexts = []
  }

  required_pull_request_reviews {
    dismiss_stale_reviews           = true
    require_code_owner_reviews      = true
    required_approving_review_count = 1
  }

  restrictions {
    users = []
    teams = []
  }
}