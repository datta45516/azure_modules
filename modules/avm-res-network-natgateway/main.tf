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

resource "azurerm_public_ip" "nat_pip" {
  count               = length(var.public_ip_names)
  name                = var.public_ip_names[count.index]
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_nat_gateway" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku_name            = "Standard"

  tags = var.tags
}

resource "azurerm_nat_gateway_public_ip_association" "this" {
  count           = length(azurerm_public_ip.nat_pip)
  nat_gateway_id  = azurerm_nat_gateway.this.id
  public_ip_address_id = azurerm_public_ip.nat_pip[count.index].id
}
