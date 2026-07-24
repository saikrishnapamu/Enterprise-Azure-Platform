variable "vm_name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vm_size" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "ssh_public_key" {
  type = string
}

variable "public_ip_enabled" {
  type = bool
}

variable "availability_zone" {
  type    = string
  default = null
}

variable "tags" {
  type = map(string)
}


variable "image" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}