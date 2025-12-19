terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_data_protection_backup_vault" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  storage_settings {
    datastore_type = "VaultStore"
    type           = "GeoRedundant"
  }

  tags = var.tags
}
