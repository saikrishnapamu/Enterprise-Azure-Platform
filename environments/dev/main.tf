module "resource_group" {
  source   = "../../modules/resource-group"
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

module "network" {
  source = "../../modules/network"

  resource_group_name = module.resource_group.resource_group_name
  location            = var.location

  vnet_name     = var.vnet_name
  address_space = var.address_space
}


module "subnet" {
  source               = "../../modules/subnet"
  resource_group_name  = module.resource_group.resource_group_name
  virtual_network_name = module.network.vnet_name

  subnets = var.subnets
}


module "nsg" {
  source = "../../modules/nsg"

  for_each = var.nsgs

  nsg_name            = each.key
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  tags                = var.tags

  subnet_id = module.subnet.subnet_ids[each.key]

  security_rules = each.value.rules
}



module "vm" {
  source = "../../modules/vm"

  vm_name = var.vm_name

  resource_group_name = module.resource_group.resource_group_name

  vm_size = var.vm_size

  location = var.location

  subnet_id = module.subnet.subnet_ids[var.subnet_name]

  admin_username = var.admin_username

  ssh_public_key = var.ssh_public_key

  public_ip_enabled = var.public_ip_enabled

  availability_zone = var.availability_zone

  image = var.image

  tags = var.tags
}




module "storage" {

  source = "../../modules/storage"

  storage_account_name = var.storage_account_name

  resource_group_name = module.resource_group.resource_group_name

  location = var.location

  containers = var.containers

  tags = var.tags
}







module "storage_role_assignment" {

  source = "../../modules/role-assignment"

  scope = module.storage.storage_account_id

  role_definition_name = "Storage Blob Data Contributor"

  principal_id = module.vm.principal_id
}




module "keyvault" {

  source = "../../modules/keyvault"

  key_vault_name = var.key_vault_name

  resource_group_name = module.resource_group.resource_group_name

  location = var.location

  tenant_id = data.azurerm_client_config.current.tenant_id

  public_network_access_enabled = var.public_network_access_enabled

  tags = var.tags

  default_action = var.default_action
  bypass         = var.bypass
  ip_rules       = var.ip_rules

}