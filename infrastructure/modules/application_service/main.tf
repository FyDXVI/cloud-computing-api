resource "random_string" "random_name" {
  length  = 8
  special = false
  upper = false 
}

locals {
  web_app_name = "${var.web_app_name}-${random_string.random_name.result}"
}

resource "azurerm_service_plan" "api_plan" {
  name                = var.service_plan_name
  resource_group_name = var.rg_name
  location            = var.physical_loc
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "app_service" {
  name = local.web_app_name
  resource_group_name = var.rg_name
  location = azurerm_service_plan.api_plan.location
  service_plan_id = azurerm_service_plan.api_plan.id
  virtual_network_subnet_id = var.subnet_id
  
  depends_on = [ azurerm_service_plan.api_plan ]

  app_settings = {
    DATABASE_HOST = var.database_host
    DATABASE_PORT = var.database_port
    DATABASE_NAME = var.database_name
    DATABASE_USER = var.admin_username
    DATABASE_PASSWORD = var.admin_password

    STORAGE_ACCOUNT_URL = var.storage_url
  }

  identity {
    type = "SystemAssigned"
  }
  
  site_config {
    application_stack {
      docker_registry_url = var.docker_registry_url
      docker_image_name = var.docker_image
      docker_registry_password = var.docker_registry_password
      docker_registry_username = var.docker_registry_username
    }
  }
}

resource "azurerm_role_assignment" "app_service_storage_access" {
  principal_id         = azurerm_linux_web_app.app_service.identity[0].principal_id
  role_definition_name = "Storage Blob Data Contributor"
  scope                = var.storage_account_id
}