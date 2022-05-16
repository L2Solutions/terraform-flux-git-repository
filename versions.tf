terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.4.1, < 3.0.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 3.1.0, < 4.0.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.5.1, < 3.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1.3, < 4.0.0"
    }
  }

  required_version = ">= 1.0.0, < 2.0.0"

  experiments = [module_variable_optional_attrs]

}
