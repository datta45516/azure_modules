variable "name" {
  type        = string
  description = "Name of the web app"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "service_plan_id" {
  type        = string
  description = "ID of the App Service Plan"
}

variable "always_on" {
  type        = bool
  default     = true
}

variable "dotnet_version" {
  type        = string
  default     = null
}

variable "node_version" {
  type        = string
  default     = null
}

variable "python_version" {
  type        = string
  default     = null
}

variable "java_version" {
  type        = string
  default     = null
}

variable "docker_image_name" {
  type        = string
  default     = null
}

variable "app_settings" {
  type        = map(string)
  default     = {}
  description = "Application settings for the web app"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
