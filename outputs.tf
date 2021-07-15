output "ssh_key" {
  description = "SSH public key for git integration"
  value       = local.create_ssh_key ? tls_private_key.this.0.public_key_openssh : null
}
