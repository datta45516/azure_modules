output "id" {
  value       = azurerm_linux_web_app.this.id
  description = "Web App ID"
}

output "default_hostname" {
  value       = azurerm_linux_web_app.this.default_hostname
  description = "Default hostname of the web app"
}

output "outbound_ip_addresses" {
  value       = azurerm_linux_web_app.this.outbound_ip_addresses
}
