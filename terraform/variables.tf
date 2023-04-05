// Terraform Variables. These are used to pass in values to the Terraform, and can be 
// confidential information (such as your GitHub PAT). 

variable "github_token" {
  type        = string
  description = "GitHub personal access token"
}

variable "collaborators" {
  type        = list
  description = "List of collaborators"
}

variable "instructors" {
  type        = list
  description = "List of instructors"
}
