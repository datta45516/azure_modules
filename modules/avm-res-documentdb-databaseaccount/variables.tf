variable "name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "kind" {
  type        = string
  default     = "GlobalDocumentDB"
  description = "GlobalDocumentDB or MongoDB"
}

variable "consistency_level" {
  type        = string
  default     = "Session"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
