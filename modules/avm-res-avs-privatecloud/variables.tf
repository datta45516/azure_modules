variable "name" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "sku_name" {
  type        = string
  default     = "av36"
}

variable "cluster_size" {
  type        = number
  default     = 3
}

variable "network_subnet_cidr" {
  type        = string
}

variable "tags" {
  type        = map(string)
  default     = {}
}
