variable "name" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "postgresql_version" {
  type        = string
  default     = "15"
}

variable "administrator_login" {
  type        = string
}

variable "administrator_password" {
  type        = string
  sensitive   = true
}

variable "zone" {
  type        = string
  default     = "1"
}

variable "storage_mb" {
  type        = number
  default     = 32768
}

variable "sku_name" {
  type        = string
  default     = "GP_Standard_D2s_v3"
}

variable "delegated_subnet_id" {
  type        = string
  default     = null
}

variable "private_dns_zone_id" {
  type        = string
  default     = null
}

variable "tags" {
  type        = map(string)
  default     = {}
}
