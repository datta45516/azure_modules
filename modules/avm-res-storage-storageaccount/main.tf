terraform { required_providers { azurerm = { source = "hashicorp/azurerm" version = ">= 3.0.0" } } }
provider "azurerm" { features {} }

resource "azurerm_storage_account" "this" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind
  access_tier              = var.access_tier
  enable_https_traffic_only = true
  min_tls_version          = "TLS1_2"
  tags                     = var.tags
}
