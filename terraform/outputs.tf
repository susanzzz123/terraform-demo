// We can use the outputs to get the URL of the repository
output "repository_url" {
  value = github_repository.cis1880-team-project.html_url
}
