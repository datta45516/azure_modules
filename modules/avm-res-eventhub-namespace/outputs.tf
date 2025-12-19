output "id" {
  value = azurerm_eventhub_namespace.this.id
}

output "default_primary_connection_string" {
  value     = azurerm_eventhub_namespace.this.default_primary_connection_string
  sensitive = true
}
