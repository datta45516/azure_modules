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

resource "azurerm_mysql_flexible_server" "this" {
  name                   = var.name
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = var.mysql_version
  administrator_login    = var.administrator_login
  administrator_password = var.administrator_password
  zone                   = var.zone
  storage {
    size_gb = var.storage_size_gb
  }
  sku_name               = var.sku_name
  delegated_subnet_id    = var.delegated_subnet_id
  private_dns_zone_id    = var.private_dns_zone_id

  tags = var.tags
}
