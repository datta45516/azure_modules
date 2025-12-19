variable "name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "subnet_id" {
  type        = string
  description = "ID of AzureBastionSubnet"
}

variable "public_ip_address_id" {
  type        = string
}

variable "sku" {
  type        = string
  default     = "Standard"
}

variable "scale_units" {
  type        = number
  default     = 2
}

variable "tags" {
  type        = map(string)
  default     = {}
}
