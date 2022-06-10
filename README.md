# Terraform Flux Git Repository Module

## This Module Has Moved To:

<https://registry.terraform.io/modules/etesiai/git-repository/flux/latest>

This Terraform Module uses the `kubernetes` provider to create a GitRepository custom resource. The module depends on flux and its CRDs being installed. See the [`terraform-flux-install`](https://registry.terraform.io/modules/OmniTeqSource/install/flux/latest) module to install flux.

All issues should be reported in the [GitHub repository](https://github.com/OmniTeqSource/terraform-flux-install/issues)

## Usage

For full usage, see the examples:

- On the Terraform Registry, use the Examples dropdown near the top of the page
- In GitHub, navigate to the [Examples](examples/) directory

## Why?

While we use the `kubernetes` provider and its `kubernetes_manifest` resource for [`terraform-flux-install`](https://registry.terraform.io/modules/OmniTeqSource/install/flux/latest), the `kubernetes_manifest` resource uses server-side apply, preventing a one stage apply of flux and initial configuration. Here we use the `helm` providers' `helm_release` resource. This allows for one apply to install flux and configure the initial `git`/`helm` repositories

## Why not use the `kubectl` provider?

We love the kubectl provider, but opted to stick with official providers.

## Additional Flux Module Resources

The below modules provide support for individual configuration of `fluxcd` Custom Resources:

[Flux Install Module](https://registry.terraform.io/modules/OmniTeqSource/install/flux/latest)

[Flux Kustomization Module](https://registry.terraform.io/modules/OmniTeqSource/kustomization/flux/latest)

[Flux HelmRepository Module](https://registry.terraform.io/modules/OmniTeqSource/helm-repository/flux/latest)

[Flux HelmRelease Module](https://registry.terraform.io/modules/OmniTeqSource/helm-release/flux/latest)

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                        | Version           |
| --------------------------------------------------------------------------- | ----------------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform)    | >= 1.0.0, < 2.0.0 |
| <a name="requirement_helm"></a> [helm](#requirement_helm)                   | >= 2.5.1, < 3.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement_kubernetes) | >= 2.4.1, < 3.0.0 |
| <a name="requirement_random"></a> [random](#requirement_random)             | >= 3.1.3, < 4.0.0 |
| <a name="requirement_tls"></a> [tls](#requirement_tls)                      | >= 3.1.0, < 4.0.0 |

## Providers

| Name                                                                  | Version |
| --------------------------------------------------------------------- | ------- |
| <a name="provider_helm"></a> [helm](#provider_helm)                   | 2.5.1   |
| <a name="provider_kubernetes"></a> [kubernetes](#provider_kubernetes) | 2.11.0  |
| <a name="provider_random"></a> [random](#provider_random)             | 3.1.3   |
| <a name="provider_tls"></a> [tls](#provider_tls)                      | 3.4.0   |

## Modules

No modules.

## Resources

| Name                                                                                                                | Type     |
| ------------------------------------------------------------------------------------------------------------------- | -------- |
| [helm_release.this](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release)           | resource |
| [kubernetes_secret.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string)         | resource |
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key)     | resource |

## Inputs

| Name                                                                                    | Description                                                                          | Type                                                                                                                                            | Default         | Required |
| --------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------- | --------------- | :------: |
| <a name="input_create_ssh_key"></a> [create_ssh_key](#input_create_ssh_key)             | Whether or not to create an ssh key(overrides `existing_secret`)                     | `bool`                                                                                                                                          | `false`         |    no    |
| <a name="input_existing_secret"></a> [existing_secret](#input_existing_secret)          | Existing ssh/https secret in the namespace for auth                                  | `string`                                                                                                                                        | `null`          |    no    |
| <a name="input_git_implementation"></a> [git_implementation](#input_git_implementation) | Git implementation to use, use libgit2 for Azure                                     | `string`                                                                                                                                        | `"go-git"`      |    no    |
| <a name="input_interval"></a> [interval](#input_interval)                               | How frequently to pull changes from the source repository                            | `string`                                                                                                                                        | `"1m0s"`        |    no    |
| <a name="input_known_hosts"></a> [known_hosts](#input_known_hosts)                      | List of known SSH hosts for key                                                      | `list(string)`                                                                                                                                  | `[]`            |    no    |
| <a name="input_name"></a> [name](#input_name)                                           | Name of the GitRepository resource                                                   | `string`                                                                                                                                        | n/a             |   yes    |
| <a name="input_namespace"></a> [namespace](#input_namespace)                            | Namespace location to create the GitRepository                                       | `string`                                                                                                                                        | `"flux-system"` |    no    |
| <a name="input_random_suffix"></a> [random_suffix](#input_random_suffix)                | Add a random alpha-numeric suffix to resource names(prevents helm release collision) | `bool`                                                                                                                                          | `true`          |    no    |
| <a name="input_ref"></a> [ref](#input_ref)                                              | Repo refs object                                                                     | <pre>object({<br> branch = optional(string)<br> commit = optional(string)<br> tag = optional(string)<br> semver = optional(string)<br> })</pre> | `{}`            |    no    |
| <a name="input_url"></a> [url](#input_url)                                              | URL of the git repository                                                            | `string`                                                                                                                                        | n/a             |   yes    |

## Outputs

| Name                                                           | Description                                |
| -------------------------------------------------------------- | ------------------------------------------ |
| <a name="output_kind"></a> [kind](#output_kind)                | Kubernetes API Kind                        |
| <a name="output_manifest"></a> [manifest](#output_manifest)    | n/a                                        |
| <a name="output_name"></a> [name](#output_name)                | Name of the object with suffix(if enabled) |
| <a name="output_namespace"></a> [namespace](#output_namespace) | n/a                                        |
| <a name="output_ssh_key"></a> [ssh_key](#output_ssh_key)       | SSH public key for git integration         |

<!-- END_TF_DOCS -->
