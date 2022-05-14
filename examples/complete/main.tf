provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "k3d-tftest"
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "k3d-tftest"
  }
}

module "flux-install" {
  source  = "OmniTeqSource/install/flux"
  version = "0.1.6"
}

module "git-repository-basic" {
  source = "../../"

  name = "basic"
  url  = "https://github.com/OmniTeqSource/terraform-flux-git-repository.git"

  # This will prevent a condition where the namespace cannot be removed if a CR for a CRD still exists.
  depends_on = [module.flux-install]
}

module "git-repository-ssh" {
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
