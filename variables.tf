variable "prefix" {
  type        = string
  description = "Prefix used for all resource names to ensure uniqueness and organization"
  default     = "avmdemo"
}

variable "location" {
  type        = string
  description = "Primary Azure region where most resources will be deployed"
  default     = "eastus"
}

variable "secondary_location" {
  type        = string
  description = "Secondary Azure region (used for geo-redundant resources if needed)"
  default     = "westus2"
}

variable "tags" {
  type        = map(string)
  description = "Common tags to apply to all resources"
  default = {
    environment = "demo"
    project     = "avm-full-deployment"
    created_by  = "terraform"
    date        = "2025-12-19"
  }
}

variable "admin_username" {
  type        = string
  description = "Administrator username for VMs, databases, and other services requiring credentials"
  default     = "azureadmin"
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "Administrator password for database servers (PostgreSQL, MySQL). In production, use Key Vault references or secrets managers"
  default     = null  # Force user to provide via tfvars or environment
}

variable "ssh_public_key_path" {
  type        = string
  description = "Local path to the SSH public key file used for Linux VMs and scale sets"
  default     = "~/.ssh/id_rsa.pub"
}

# Optional overrides for specific modules (uncomment and customize if needed)

# variable "vnet_address_space" {
#   type        = list(string)
#   default     = ["10.0.0.0/16"]
# }

# variable "aks_node_count" {
#   type        = number
#   default     = 2
# }

# variable "aks_vm_size" {
#   type        = string
#   default     = "Standard_DS3_v2"
# }

# variable "postgresql_sku_name" {
#   type        = string
#   default     = "GP_Standard_D2s_v3"
# }

# variable "mysql_sku_name" {
#   type        = string
#   default     = "GP_Standard_D2ds_v4"
# }

# variable "redis_capacity" {
#   type        = number
#   default     = 1
# }

# variable "acr_sku" {
#   type        = string
#   default     = "Premium"
# }

# variable "databricks_sku" {
#   type        = string
#   default     = "premium"
# }
