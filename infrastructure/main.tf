provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

module "resource_group" {
  source       = "./modules/resource_group"
  rg_name      = var.rg_name
  physical_loc = var.physical_loc
}

