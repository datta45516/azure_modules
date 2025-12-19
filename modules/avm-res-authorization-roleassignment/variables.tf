variable "scope" {
  type        = string
  description = "Scope (resource ID) to assign the role"
}

variable "role_definition_name" {
  type        = string
  description = "Built-in role name (e.g., Contributor)"
}

variable "principal_id" {
  type        = string
  description = "Object ID of the principal (user, group, SP)"
}

variable "principal_type" {
  type        = string
  default     = null
  description = "Optional: User, Group, ServicePrincipal"
}
