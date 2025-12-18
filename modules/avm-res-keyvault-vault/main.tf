terraform { required_providers { azurerm = { source = "hashicorp/azurerm" version = ">= 3.0.0" } } }
provider "azurerm" { features {} }

resource "azurerm_key_vault" "this" {
  name                        = var.name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = var.tenant_id
  sku_name                    = var.sku_name
  purge_protection_enabled    = var.purge_protection_enabled
  soft_delete_retention_days  = 90
  enable_rbac_authorization   = true
  tags                        = var.tags
}
