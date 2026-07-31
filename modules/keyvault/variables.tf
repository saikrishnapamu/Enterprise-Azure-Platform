variable "key_vault_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "sku_name" {
  type    = string
  default = "standard"
}

variable "tags" {
  type = map(string)
}

variable "public_network_access_enabled" {
  type = bool
  default = true  
}


variable "default_action" {
  description = "Default firewall action for Key Vault."
  type        = string
  default     = "Allow"
}

variable "bypass" {
  description = "Azure services allowed to bypass firewall."
  type        = string
  default     = "AzureServices"
}

variable "ip_rules" {
  description = "List of allowed public IP addresses."
  type        = list(string)
  default     = []
}