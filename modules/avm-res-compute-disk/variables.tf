variable "name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "storage_account_type" {
  type        = string
  default     = "Premium_LRS"
}

variable "disk_size_gb" {
  type        = number
}

variable "tags" {
  type        = map(string)
  default     = {}
}
