provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "k3d-tftest"
  experiments {
    manifest_resource = true
  }
}

module "flux-install" {
  count   = 1
  source  = "OmniTeqSource/install/flux"
  version = "0.1.4"
}

# Set to true after flux-install. GitRepository CRD need to be created before the repo instances may be created.
locals {
  install_complete = true
}

module "git-repository-basic" {
  count = local.install_complete ? 1 : 0

  source = "../../"

  name = "basic"
  url  = "https://github.com/OmniTeqSource/terraform-flux-git-repository.git"

  # This will prevent a condition where the namespace cannot be removed if a CR for a CRD still exists.
  depends_on = [module.flux-install]
}

module "git-repository-ssh" {
  count = local.install_complete ? 1 : 0

  source = "../../"

  name     = "ssh"
  url      = "https://github.com/OmniTeqSource/terraform-flux-git-repository.git"
  interval = "1m"

  create_ssh_key = true
  known_hosts = [
    "github.com ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBEmKSENjQEezOmxkZMy7opKgwFB9nkt5YRrYMjNuG5N87uRgg6CLrbo5wAdT/y6v0mKV0U2w0WZ2YB/++Tpockg="
  ]

  # This will prevent a condition where the namespace cannot be removed if a CR for a CRD still exists.
  depends_on = [module.flux-install]
}
