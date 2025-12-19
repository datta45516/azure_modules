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

resource "azurerm_vmware_private_cloud" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = var.sku_name
  management_cluster {
    size = var.cluster_size
  }
  network_subnet_cidr = var.network_subnet_cidr

  tags = var.tags
}
