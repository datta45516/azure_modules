output "id" {
  value = azurerm_static_site.this.id
}

output "default_host_name" {
  value = azurerm_static_site.this.default_host_name
}

output "api_key" {
  value     = azurerm_static_site.this.api_key
  sensitive = true
}
