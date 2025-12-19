output "id" {
  value = azurerm_firewall.this.id
}

output "public_ip_address" {
  value = azurerm_public_ip.fw_pip.ip_address
}
