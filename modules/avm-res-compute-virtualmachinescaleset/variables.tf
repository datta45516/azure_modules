variable "name" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "location" {
  type        = string
}

variable "vm_size" {
  type        = string
  default     = "Standard_D2s_v3"
}

variable "instance_count" {
  type        = number
  default     = 2
}

variable "admin_username" {
  type        = string
}

variable "ssh_public_key" {
  type        = string
}

variable "subnet_id" {
  type        = string
}

variable "storage_account_type" {
  type        = string
  default     = "Standard_LRS"
}

variable "image_publisher" {
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  type        = string
  default     = "UbuntuServer"
}

variable "image_sku" {
  type        = string
  default     = "18.04-LTS"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
