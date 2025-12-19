variable "name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "public_ip_names" {
  type        = list(string)
  description = "List of public IP names to create and associate"
  default     = ["nat-pip-01"]
}

variable "tags" {
  type        = map(string)
  default     = {}
}
