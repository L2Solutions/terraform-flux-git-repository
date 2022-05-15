output "ssh_key" {
  value = trimspace(module.git-repository-ssh.ssh_key)
}
