variable "name" {
  type        = string
  description = "DNS zone name (e.g., privatelink.blob.core.windows.net)"
}

variable "resource_group_name" {
  type        = string
}

variable "tags" {
  type        = map(string)
  default     = {}
}
