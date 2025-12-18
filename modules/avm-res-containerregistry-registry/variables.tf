variable "name" {
  type        = string
  description = "Name of the ACR (must be globally unique)"
}

variable "resource_group_name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "sku" {
  type        = string
  default     = "Premium"
}

variable "admin_enabled" {
  type        = bool
  default     = false
}

variable "zone_redundancy_enabled" {
  type        = bool
  default     = true
}

variable "tags" {
  type        = map(string)
  default     = {}
}
