resource "github_repository" "repos" {
  for_each    = var.repositories
  name        = each.key
  description = each.value.description
  visibility  = each.value.visibility
  auto_init   = true
}

resource "github_branch_default" "default"{
  for_each    = var.repositories
  repository  = github_repository.repos[each.key].name
  branch      = "main"
}
