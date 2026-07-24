terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-backend-rg"
    storage_account_name = "tfstatepamu2026"
    container_name       = "tfstate"
    key                  = "dev/terraform.tfstate"
  }
}