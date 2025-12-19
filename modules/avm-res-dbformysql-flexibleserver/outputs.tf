output "id" {
  value       = azurerm_mysql_flexible_server.this.id
  description = "MySQL Flexible Server ID"
}

output "fqdn" {
  value       = azurerm_mysql_flexible_server.this.fqdn
  description = "Fully qualified domain name"
}

output "name" {
  value       = azurerm_mysql_flexible_server.this.name
}
