output "id" {
  value = azurerm_lb.this.id
}

output "backend_address_pool_id" {
  value = azurerm_lb_backend_address_pool.this.id
}

output "frontend_ip_configuration" {
  value = azurerm_lb.this.frontend_ip_configuration
}
