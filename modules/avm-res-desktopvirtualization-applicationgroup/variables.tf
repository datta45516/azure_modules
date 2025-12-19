variable "name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "type" {
  type        = string
  default     = "Desktop"
  description = "Desktop or RemoteApp"
}

variable "host_pool_id" {
  type        = string
}

variable "tags" {
  type        = map(string)
  default     = {}
}
