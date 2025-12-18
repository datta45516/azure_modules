variable "name" {
  type        = string
  description = "Name of the Log Analytics workspace"
}

variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "sku" {
  type        = string
  default     = "PerGB2018"
  description = "Pricing SKU"
}

variable "retention_in_days" {
  type        = number
  default     = 30
}

variable "daily_quota_gb" {
  type        = number
  default     = null
}

variable "tags" {
  type        = map(string)
  default     = {}
}
