output "id" {
  value = try(azurerm_linux_virtual_machine.this[0].id, null)
}

output "private_ip_address" {
  value = try(azurerm_linux_virtual_machine.this[0].private_ip_address, null)
}
