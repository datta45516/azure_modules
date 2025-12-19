output "id" {
  value = azurerm_batch_account.this.id
}

output "primary_access_key" {
  value     = azurerm_batch_account.this.primary_access_key
  sensitive = true
}
