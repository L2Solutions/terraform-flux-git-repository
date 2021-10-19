# This module is now located at <https://registry.terraform.io/modules/OmniTeqSource/git-repository/flux/latest>

<!--- start terraform-docs --->

## Requirements

| Name                                                                        | Version           |
| --------------------------------------------------------------------------- | ----------------- |
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform)    | >= 1.0.0, < 2.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement_kubernetes) | >= 2.4.1, < 3.0.0 |
| <a name="requirement_tls"></a> [tls](#requirement_tls)                      | >= 3.1.0, < 4.0.0 |

## Providers

| Name                                                                  | Version           |
| --------------------------------------------------------------------- | ----------------- |
| <a name="provider_kubernetes"></a> [kubernetes](#provider_kubernetes) | >= 2.4.1, < 3.0.0 |
| <a name="provider_tls"></a> [tls](#provider_tls)                      | >= 3.1.0, < 4.0.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                    | Type     |
| ----------------------------------------------------------------------------------------------------------------------- | -------- |
| [kubernetes_manifest.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_secret.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret)     | resource |
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key)         | resource |

## Inputs

| Name                                                                                    | Description                                                      | Type                                                                                                                                            | Default                                | Required |
| --------------------------------------------------------------------------------------- | ---------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------- | :------: |
| <a name="input_create_ssh_key"></a> [create_ssh_key](#input_create_ssh_key)             | Whether or not to create an ssh key(overrides `existing_secret`) | `bool`                                                                                                                                          | `false`                                |    no    |
| <a name="input_existing_secret"></a> [existing_secret](#input_existing_secret)          | Existing ssh/https secret in the namespace for auth              | `string`                                                                                                                                        | `null`                                 |    no    |
| <a name="input_git_implementation"></a> [git_implementation](#input_git_implementation) | Git implementation to use, use libgit2 for Azure                 | `string`                                                                                                                                        | `"go-git"`                             |    no    |
| <a name="input_interval"></a> [interval](#input_interval)                               | How frequently to pull changes from the source repository        | `string`                                                                                                                                        | `"1m0s"`                               |    no    |
| <a name="input_known_hosts"></a> [known_hosts](#input_known_hosts)                      | List of known SSH hosts for key                                  | `list(string)`                                                                                                                                  | `[]`                                   |    no    |
| <a name="input_name"></a> [name](#input_name)                                           | Name of the GitRepository resource                               | `string`                                                                                                                                        | n/a                                    |   yes    |
| <a name="input_namespace"></a> [namespace](#input_namespace)                            | Namespace location to create the GitRepository                   | `string`                                                                                                                                        | `"flux-system"`                        |    no    |
| <a name="input_ref"></a> [ref](#input_ref)                                              | Repo refs object                                                 | <pre>object({<br> branch = optional(string)<br> commit = optional(string)<br> tag = optional(string)<br> semver = optional(string)<br> })</pre> | <pre>{<br> "branch": "main"<br>}</pre> |    no    |
| <a name="input_url"></a> [url](#input_url)                                              | URL of the git repository                                        | `string`                                                                                                                                        | n/a                                    |   yes    |

## Outputs

| Name                                                     | Description                        |
| -------------------------------------------------------- | ---------------------------------- |
| <a name="output_ssh_key"></a> [ssh_key](#output_ssh_key) | SSH public key for git integration |
