resource "azurerm_public_ip" "this" {
  count = var.public_ip_enabled ? 1 : 0

  name = "${var.vm_name}-pip"
  location = var.location

  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku = "Standard"

}



resource "azurerm_network_interface" "this" {
    name = "${var.vm_name}-nic"
    location = var.location
    resource_group_name = var.resource_group_name

    ip_configuration {
      name = "internal"
      subnet_id = var.subnet_id
      private_ip_address_allocation = "Dynamic"

      public_ip_address_id = var.public_ip_enabled ? azurerm_public_ip.this[0].id : null
    } 

    tags = var.tags
}



resource "azurerm_linux_virtual_machine" "this" {
    name = var.vm_name
    resource_group_name = var.resource_group_name

    location = var.location

    size = var.vm_size
    admin_username = var.admin_username

    disable_password_authentication = true

    network_interface_ids = [ azurerm_network_interface.this.id ]

    zone = var.availability_zone

    admin_ssh_key {
      username = var.admin_username
      public_key = var.ssh_public_key
    }

    tags = var.tags

    boot_diagnostics {}

    os_disk {
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    
    source_image_reference {
      publisher = var.image.publisher
      offer = var.image.offer
      sku = var.image.sku
      version = var.image.version
    }

    identity {
      type = "SystemAssigned"
    }
}