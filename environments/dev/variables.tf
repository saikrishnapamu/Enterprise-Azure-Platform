variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "subnets" {
  type = map(object({
    address_prefix = string
  }))
}

variable "nsgs" {
  type = map(object({
    rules = list(object({
      name                   = string
      priority               = number
      direction              = string
      access                 = string
      protocol               = string
      source_port_range      = string
      destination_port_range = string

      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}



variable "vm_name" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "ssh_public_key_path" {
  type = string
}

variable "public_ip_enabled" {
  type = bool
}

variable "availability_zone" {
  type    = string
  default = null
}

variable "image" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}

variable "subnet_name" {
  type = string
}


variable "storage_account_name" {
  type = string
}

variable "containers" {
  type = map(object({
    access_type = string
  }))
}


variable "key_vault_name" {
  type = string
}