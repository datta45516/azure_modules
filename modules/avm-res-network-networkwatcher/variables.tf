variable "name" {
  type        = string
  default     = "NetworkWatcher_${var.location}"
}

variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "tags" {
  type        = map(string)
  default     = {}
}
