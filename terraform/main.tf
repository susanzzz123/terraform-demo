// Add the GitHub provider
provider "github" {
  token = var.github_token // Personal Access Token (PAT), in order to authenticate with GitHub
}

locals {
  repository_name = "cis1880-team-project"
  collaborators = [
    "YOUR-GITHUB-USERNAME-HERE",
    "YOUR-PARTNER-GITHUB-USERNAME-HERE",
  ]
}

resource "github_repository" "cis1880-team-project" {
  name               = local.repository_name
  description        = "Repository for CIS1880 team project"
  private            = true
  allow_rebase_merge = true
  topics = [
    "cis1880",
    "team-project",
  ]
}

resource "github_repository_collaborator" "cis1880-team-project_collaborator" {
  for_each = toset(local.collaborators)

  repository = local.repository_name
  username   = each.key
  permission = "push"
}
