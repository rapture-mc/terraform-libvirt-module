output "name" {
  value = libvirt_domain.virt-machine[*].name
}
