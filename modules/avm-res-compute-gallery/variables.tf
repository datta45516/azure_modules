variable "name" {
  type        = string
  description = "Name of the Compute Gallery"
}

variable "resource_group_name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "description" {
  type        = string
  default     = null
}

variable "tags" {
  type        = map(string)
  default     = {}
}
