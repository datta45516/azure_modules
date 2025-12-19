output "id" {
  value       = azurerm_application_insights.this.id
  description = "Application Insights resource ID"
}

output "instrumentation_key" {
  value       = azurerm_application_insights.this.instrumentation_key
  sensitive   = true
  description = "Instrumentation key"
}

output "connection_string" {
  value       = azurerm_application_insights.this.connection_string
  sensitive   = true
  description = "Connection string"
}

output "app_id" {
  value       = azurerm_application_insights.this.app_id
  description = "App ID"
}
