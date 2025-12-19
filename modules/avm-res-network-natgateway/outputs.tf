output "id" {
  value = azurerm_nat_gateway.this.id
}

output "public_ip_addresses" {
  value = azurerm_public_ip.nat_pip[*].ip_address
}
