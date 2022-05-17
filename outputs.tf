output "manifest" {
  value = local.manifest
}

output "name" {
  description = "Name of the object with suffix(if enabled)"
  value       = local.name
}

output "ssh_key" {
  description = "SSH public key for git integration"
  value       = local.create_ssh_key ? tls_private_key.this.0.public_key_openssh : null
}

output "kind" {
  description = "Kubernetes API Kind"
  value       = "GitRepository"
}

output "namespace" {
  value = local.namespace
}
