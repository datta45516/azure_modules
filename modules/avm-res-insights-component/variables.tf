variable "name" {
  type        = string
  description = "Name of the Application Insights component"
}

variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "application_type" {
  type        = string
  default     = "web"
  description = "Type of application (web, other, Node.JS, java, etc.)"
}

variable "retention_in_days" {
  type        = number
  default     = 90
}

variable "sampling_percentage" {
  type        = number
  default     = 100
}

variable "tags" {
  type        = map(string)
  default     = {}
}
