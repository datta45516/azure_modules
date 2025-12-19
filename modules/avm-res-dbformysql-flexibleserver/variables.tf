variable "name" {
  type        = string
  description = "Name of the MySQL Flexible Server"
}

variable "resource_group_name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "mysql_version" {
  type        = string
  default     = "8.0.21"
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

variable "storage_size_gb" {
  type        = number
  default     = 32
}

variable "sku_name" {
  type        = string
  default     = "GP_Standard_D2ds_v4"
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
