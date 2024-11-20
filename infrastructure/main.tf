provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
  tenant_id = var.tenant_id
}

module "resource_group" {
  source       = "./modules/resource_group"
  rg_name      = var.rg_name
  physical_loc = var.physical_loc
}

module "vnet" {
  source             = "./modules/vnet"
  rg_name            = module.resource_group.rg_name
  physical_loc       = module.resource_group.physical_loc
  vnet_name          = var.vnet_name
  vnet_address_space = var.vnet_address_space
  subnets            = var.subnets
}

