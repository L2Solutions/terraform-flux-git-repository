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
  version = "0.0.24"
}

# Set to true after flux-install. GitRepository CRD need to be created before the repo instances may be created.
locals {
  install_complete = false
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
    "github.com ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ=="
  ]

  # This will prevent a condition where the namespace cannot be removed if a CR for a CRD still exists.
  depends_on = [module.flux-install]
}
