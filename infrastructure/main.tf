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


module "blob_storage" {
  source = "./modules/blob_storage"
  rg_name = module.resource_group.rg_name
  physical_loc = module.resource_group.physical_loc
  blob_storage_name = var.blob_storage_name
  type = var.type
  subnet_id = module.vnet.subnets["blob_subnet"]

  depends_on = [ module.vnet ]
}

module "app_service" {
  source = "./modules/application_service"
  service_plan_name = var.service_plan_name
  rg_name = module.resource_group.rg_name
  physical_loc = module.resource_group.physical_loc
  web_app_name = var.web_app_name
  subnet_id = module.vnet.subnets["web_app_subnet"]

  # FOR POSTGRESQL CONNECTION
  database_host = module.postgresql.postgresql_server_fqdn
  database_port = module.postgresql.database_port
  database_name = module.postgresql.database_name
  admin_username = var.admin_username
  admin_password = var.admin_password

  # FOR DOCKER CONNECTION
  docker_image = var.docker_image
  docker_registry_url = var.docker_registry_url
  docker_registry_password = var.docker_registry_password
  docker_registry_username = var.docker_registry_username

  # STORAGE
  storage_url = module.blob_storage.storage_url
  storage_account_id = module.blob_storage.storage_account_id
  
  depends_on = [ module.vnet, module.postgresql ]
}

module "app_gateway" {
  source = "./modules/application_gateway"
  rg_name = module.resource_group.rg_name
  physical_loc = module.resource_group.physical_loc
  gateway_name = var.gateway_name
  subnet_id = module.vnet.subnets["gateway_subnet"]
  app_service_fqdn = module.app_service.app_service_fqdn

  depends_on = [ module.vnet ]
}