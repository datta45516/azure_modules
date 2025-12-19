variable "name" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "storage_account_id" {
  type        = string
  description = "ID of storage account for Batch diagnostics"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
