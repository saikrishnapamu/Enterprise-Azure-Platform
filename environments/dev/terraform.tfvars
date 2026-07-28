location            = "Central India"
resource_group_name = "rg-dev-customer"

vnet_name = "vnet-dev-customer"

address_space = ["10.10.0.0/16"]

tags = {
  "Environment" = "Dev"
  "Project"     = "Customer"
  "Owner"       = "Sai"
}


subnets = {
  frontend = {
    address_prefix = "10.10.1.0/24"
  }
  backend = {
    address_prefix = "10.10.2.0/24"
  }
  database = {
    address_prefix = "10.10.3.0/24"
  }
}




nsgs = {
  frontend = {
    rules = [
      {
        name                       = "AllowHTTP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "AllowHTTPS"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "443"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }


  backend = {
    rules = [
      {
        name                       = "AllowApp"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "8080"
        source_address_prefix      = "10.10.1.0/24"
        destination_address_prefix = "*"
      }
    ]
  }


  database = {
    rules = [
      {
        name                       = "AllowPostgres"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "5432"
        source_address_prefix      = "10.10.2.0/24"
        destination_address_prefix = "*"
      }
    ]
  }

}



vm_name = "backend-vm"

vm_size = "Standard_D2s_v3"

admin_username = "azureuser"

#ssh_public_key_path = "~/.ssh/id_ed25519.pub"

public_ip_enabled = true

availability_zone = null

image = {
  publisher = "Canonical"
  offer     = "ubuntu-24_04-lts"
  sku       = "server"
  version   = "latest"
}

subnet_name = "backend"


storage_account_name = "stcustdevsai001"

containers = {
  invoices = {
    access_type = "private"
  }

  logs = {
    access_type = "private"
  }

  backups = {
    access_type = "private"
  }
}


key_vault_name = "kv-customer-dev-sai-001"