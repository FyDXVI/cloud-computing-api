resource "azurerm_service_plan" "api_plan" {
  name                = var.service_plan_name
  resource_group_name = var.rg_name
  location            = var.physical_loc
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "app_service" {
  name = var.web_app_name
  resource_group_name = var.rg_name
  location = azurerm_service_plan.api_plan.location
  service_plan_id = azurerm_service_plan.api_plan.id
  virtual_network_subnet_id = var.subnet_id
  
  depends_on = [ azurerm_service_plan.api_plan ]
  
  site_config {}
}