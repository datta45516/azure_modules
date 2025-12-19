output "id" {
  value = azurerm_app_configuration.this.id
}

output "endpoint" {
  value = azurerm_app_configuration.this.endpoint
}

output "primary_read_key" {
  value     = azurerm_app_configuration.this.primary_read_key[0].connection_string
  sensitive = true
}
