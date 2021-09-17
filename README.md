# MOVED TO OMNITEQ


<!--- start terraform-docs --->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0, < 2.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.4.1, < 3.0.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.1.0, < 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.4.1, < 3.0.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | >= 3.1.0, < 4.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_manifest.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_secret.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [tls_private_key.this](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_ssh_key"></a> [create\_ssh\_key](#input\_create\_ssh\_key) | Whether or not to create an ssh key(overrides `existing_secret`) | `bool` | `false` | no |
| <a name="input_existing_secret"></a> [existing\_secret](#input\_existing\_secret) | Existing ssh/https secret in the namespace for auth | `string` | `null` | no |
| <a name="input_git_implementation"></a> [git\_implementation](#input\_git\_implementation) | Git implementation to use, use libgit2 for Azure | `string` | `"go-git"` | no |
| <a name="input_interval"></a> [interval](#input\_interval) | How frequently to pull changes from the source repository | `string` | `"1m0s"` | no |
| <a name="input_known_hosts"></a> [known\_hosts](#input\_known\_hosts) | List of known SSH hosts for key | `list(string)` | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the GitRepository resource | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace location to create the GitRepository | `string` | `"flux-system"` | no |
| <a name="input_ref"></a> [ref](#input\_ref) | Repo refs object | <pre>object({<br>    branch = optional(string)<br>    commit = optional(string)<br>    tag    = optional(string)<br>    semver = optional(string)<br>  })</pre> | <pre>{<br>  "branch": "main"<br>}</pre> | no |
| <a name="input_url"></a> [url](#input\_url) | URL of the git repository | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ssh_key"></a> [ssh\_key](#output\_ssh\_key) | SSH public key for git integration |
