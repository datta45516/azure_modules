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

resource "azurerm_communication_service" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  data_location       = var.data_location

  tags = var.tags
}
