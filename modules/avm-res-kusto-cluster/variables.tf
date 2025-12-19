variable "name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "sku_name" {
  type        = string
  default     = "Dev(No SLA)_Standard_D11_v2"
}

variable "sku_capacity" {
  type        = number
  default     = 1
}

variable "tags" {
  type        = map(string)
  default     = {}
}
