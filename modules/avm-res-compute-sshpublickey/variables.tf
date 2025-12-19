variable "name" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "public_key" {
  type        = string
  description = "SSH public key content"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
