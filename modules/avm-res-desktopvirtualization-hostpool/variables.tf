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
  default     = "Pooled"
  description = "Pooled or Personal"
}

variable "load_balancer_type" {
  type        = string
  default     = "BreadthFirst"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
