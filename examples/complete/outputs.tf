output "ssh_key" {
  value = length(module.git-repository-ssh) == 1 ? trimspace(module.git-repository-ssh.0.ssh_key) : null
}
