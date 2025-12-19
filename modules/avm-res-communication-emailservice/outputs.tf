output "id" {
  value = azurerm_communication_service.this.id
}

output "connection_string" {
  value     = azurerm_communication_service.this.primary_connection_string
  sensitive = true
}
