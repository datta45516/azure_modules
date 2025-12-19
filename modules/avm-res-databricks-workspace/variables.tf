variable "name" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "sku" {
  type        = string
  default     = "standard"
  description = "Values: standard, premium, trial"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
