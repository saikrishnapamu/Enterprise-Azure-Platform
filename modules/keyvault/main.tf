resource "azurerm_key_vault" "this" {

  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name

  tenant_id = var.tenant_id
  sku_name  = var.sku_name

  purge_protection_enabled   = true
  soft_delete_retention_days = 90

  rbac_authorization_enabled = true

  public_network_access_enabled = var.public_network_access_enabled

  tags = var.tags

  network_acls {
  default_action = var.default_action
  bypass         = var.bypass
  ip_rules       = var.ip_rules
}

}