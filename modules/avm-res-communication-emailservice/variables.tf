variable "name" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "data_location" {
  type        = string
  default     = "United States"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
