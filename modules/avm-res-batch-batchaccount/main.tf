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

resource "azurerm_batch_account" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  pool_allocation_mode = "BatchService"
  storage_account_id  = var.storage_account_id

  tags = var.tags
}
