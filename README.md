# Terraform Flux Git Repository Module

This Terraform Module uses the `kubernetes` provider to create a GitRepository custom resource. The module depends on flux and its CRDs being installed. See the [terraform-flux-install](https://registry.terraform.io/modules/OmniTeqSource/install/flux/latest) module to install flux.

## Additional Flux Module Resources

The below modules provide support for individual configuration of `fluxcd` Custom Resources:

[Flux Install Module](https://registry.terraform.io/modules/OmniTeqSource/install/flux/latest)

[Flux Kustomization Module](https://registry.terraform.io/modules/OmniTeqSource/kustomization/flux/latest)

[Flux HelmRepository Module](https://registry.terraform.io/modules/OmniTeqSource/helm-repository/flux/latest)

[Flux HelmRelease Module](https://registry.terraform.io/modules/OmniTeqSource/helm-release/flux/latest)

<!-- BEGIN_TF_DOCS -->

{{ .Content }}

<!-- END_TF_DOCS -->
