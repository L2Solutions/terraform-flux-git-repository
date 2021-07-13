provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "k3d-tftest"
}

provider "kubernetes-alpha" {
  config_path    = "~/.kube/config"
  config_context = "k3d-tftest"
}

# module "install" {
#   source  = "L2Solutions/install/flux"
#   version = "0.0.23"
# }

# module "git-repository" {
#   source = "../../"

#   name = "self"
#   url  = "https://github.com/L2Solutions/terraform-flux-git-repository.git"
# }
