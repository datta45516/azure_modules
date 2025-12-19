variable "name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "os_type" {
  type        = string
  default     = "Linux"
}

variable "restart_policy" {
  type        = string
  default     = "Always"
}

variable "container_name" {
  type        = string
  default     = "appcontainer"
}

variable "container_image" {
  type        = string
}

variable "cpu" {
  type        = number
  default     = 1
}

variable "memory" {
  type        = number
  default     = 1.5
}

variable "container_port" {
  type        = number
  default     = 80
}

variable "dns_name_label" {
  type        = string
  default     = null
}

variable "tags" {
  type        = map(string)
  default     = {}
}
