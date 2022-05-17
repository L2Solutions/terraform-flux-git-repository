locals {
  name      = var.random_suffix ? join("-", [var.name, random_string.this.id]) : var.name
  namespace = var.namespace
  url       = var.url
  interval  = var.interval
  ref = defaults(
    var.ref,
    {
      branch = "main"
    }
  )

  git_implementation = var.git_implementation
  create_ssh_key     = var.create_ssh_key
  existing_secret    = var.existing_secret
  known_hosts        = var.known_hosts
}

locals {
  secret_name        = local.create_ssh_key ? "git-repository-${local.name}" : local.existing_secret
  known_hosts_string = join("\n", local.known_hosts)
}

locals {
  manifest = {
    apiVersion = "source.toolkit.fluxcd.io/v1beta2"
    kind       = "GitRepository"
    metadata = {
      name       = local.name
      namespace  = local.namespace
      finalizers = ["finalizers.fluxcd.io"]
    }
    spec = merge(
      {
        interval          = local.interval
        url               = local.url
        gitImplementation = local.git_implementation
        ref = {
          for k, v in local.ref :
          k => v if v != null
        }
      },
      local.secret_name != null
      ? {
        secretRef = {
          name = local.secret_name
        }
      }
      : {}
    )
  }
}
