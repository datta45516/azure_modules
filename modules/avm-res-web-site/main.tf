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

resource "azurerm_linux_web_app" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id

  site_config {
    application_stack {
      dotnet_version     = var.dotnet_version
      node_version       = var.node_version
      python_version     = var.python_version
      java_version       = var.java_version
      docker_image_name  = var.docker_image_name
    }
    http2_enabled      = true
    always_on          = var.always_on
  }

  app_settings = var.app_settings

  tags = var.tags
}
