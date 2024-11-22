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

  depends_on = [ module.resource_group ]
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

  depends_on = [ module.vnet ]
}

module "app_service" {
  source = "./modules/application_service"
  service_plan_name = var.service_plan_name
  rg_name = module.resource_group.rg_name
  physical_loc = module.resource_group.physical_loc
  web_app_name = var.web_app_name
  subnet_id = module.vnet.subnets["web_app_subnet"]

  depends_on = [ module.vnet ]
}

module "blob_storage" {
  source = "./modules/blob_storage"
  rg_name = module.resource_group.rg_name
  physical_loc = module.resource_group.physical_loc
  blob_storage_name = var.blob_storage_name
  type = var.type
  subnet_id = module.vnet.subnets["blob_subnet"]

  depends_on = [ module.vnet ]
}