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

module "postgresql" {
  source = "./modules/postgreSQL"
  postgresql_server_name = var.postgresql_server_name
  rg_name = module.resource_group.rg_name
  physical_loc = module.resource_group.physical_loc
  admin_username = var.admin_username
  admin_password = var.admin_password
  storage_mb = var.storage_mb
  db_name = var.db_name
  db_version = var.db_version
  sku_name = var.sku_name
  subnet_id = module.vnet.subnets["storage_subnet"]

}

