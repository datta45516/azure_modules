variable "name" {
  type        = string
}

variable "container_app_environment_id" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "container_name" {
  type        = string
  default     = "app"
}

variable "container_image" {
  type        = string
}

variable "cpu" {
  type        = number
  default     = 0.5
}

variable "memory" {
  type        = string
  default     = "1Gi"
}

variable "environment" {
  type        = string
  default     = "production"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
