variable "name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "sku" {
  type        = string
  default     = "Standard_Microsoft"
  description = "Standard_Microsoft, Standard_Akamai, Standard_Verizon, Premium_Verizon"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
