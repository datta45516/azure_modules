variable "name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "allocation_method" {
  type        = string
  default     = "Static"
}

variable "sku" {
  type        = string
  default     = "Standard"
}

variable "domain_name_label" {
  type        = string
  default     = null
}

variable "tags" {
  type        = map(string)
  default     = {}
}
