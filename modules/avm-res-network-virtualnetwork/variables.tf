variable "name" {
  type        = string
  description = "Name of the virtual network"
}

variable "location" {
  type        = string
  description = "Azure region for the VNet"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "address_space" {
  type        = list(string)
  description = "Address space for the VNet"
}

variable "dns_servers" {
  type        = list(string)
  default     = null
  description = "Custom DNS servers (optional)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to apply to the resource"
}
