locals {
  git_repository = {
    apiVersion = "source.toolkit.fluxcd.io/v1beta1"
    kind       = "GitRepository"
    metadata = {
      name       = var.name
      namespace  = var.namespace
      finalizers = ["finalizers.fluxcd.io"]
    }
    spec = merge(
      {
        interval          = var.interval
        url               = var.url
        gitImplementation = var.git_implementation
        ref = {
          for k, v in var.ref :
          k => v if v != null
        }
      },
      var.create_ssh_key || var.existing_secret != null
      ? {
        secretRef = {
          name = var.create_ssh_key ? "git-repository-${var.name}" : var.existing_secret
        }
      }
      : {}
    )
  }
}
