variable "name" {
  description = "Name of the GitRepository resource"
  type        = string
}

variable "namespace" {
  description = "Namespace location to create the GitRepository"
  default     = "flux-system"
  type        = string
}

variable "url" {
  description = "URL of the git repository"
  type        = string
}

variable "interval" {
  description = "How frequently to pull changes from the source repository"
  default     = "1m0s"
  type        = string
}

variable "ref" {
  description = "Repo refs object"
  default     = {}

  type = object({
    branch = optional(string)
    commit = optional(string)
    tag    = optional(string)
    semver = optional(string)
  })
}

variable "existing_secret" {
  description = "Existing ssh/https secret in the namespace for auth"
  default     = null
  type        = string
}

variable "create_ssh_key" {
  description = "Whether or not to create an ssh key(overrides `existing_secret`)"
  default     = false
  type        = bool
}

variable "git_implementation" {
  description = "Git implementation to use, use libgit2 for Azure"
  default     = "go-git"
  type        = string
}

variable "known_hosts" {
  description = "List of known SSH hosts for key"
  default     = []
  type        = list(string)
}

variable "random_suffix" {
  description = "Add a random alpha-numeric suffix to resource names(prevents helm release collision)"
  default     = true
  type        = bool
}
