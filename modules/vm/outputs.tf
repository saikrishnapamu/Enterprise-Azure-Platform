output "vm_id" {
  value = azurerm_linux_virtual_machine.this.id
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.this.name
}

output "private_ip" {
  value = azurerm_linux_virtual_machine.this.private_ip_address
}

output "public_ip" {
  value = var.public_ip_enabled ? azurerm_public_ip.this[0].ip_address : null
}

output "nic_id" {
  value = azurerm_network_interface.this.id
}

output "principal_id" {
    value = azurerm_linux_virtual_machine.this.identity[0].principal_id
}