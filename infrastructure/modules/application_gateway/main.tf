resource "azurerm_public_ip" "public_ip" {
    name                = "public_ip"
    location            = var.physical_loc
    resource_group_name = var.rg_name
    allocation_method   = "Static" 
}

locals {
  back_ip_config_name     = "${var.gateway_name}-back-ip-config"
  front_ip_config_name    = "${var.gateway_name}-front-ip-config"
  front_port_name         = "${var.gateway_name}-front-port"
  back_addr_pool_name     = "${var.gateway_name}-back-addr-pool"
  back_http_settings_name = "${var.gateway_name}-back-http-settings"
  http_listener_name      = "${var.gateway_name}-http-listener"
  routing_rule_name       = "${var.gateway_name}-routing-rule"
}

resource "azurerm_application_gateway" "app_gateway" {
  name                = var.gateway_name
  location            = var.physical_loc
  resource_group_name = var.rg_name

  sku {
    name     ="Standard_v2"
    tier     ="Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = local.back_ip_config_name
    subnet_id = var.subnet_id
  }

  frontend_ip_configuration {
    name                 = local.front_ip_config_name
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }

  frontend_port {
    name = local.front_port_name
    port = 80
  }

  backend_address_pool {
    name  = local.back_addr_pool_name
    fqdns = [
      var.app_service_fqdn
    ]
  }

  backend_http_settings {
    name                  = local.back_http_settings_name
    cookie_based_affinity = "Disabled"
    path                  = "/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 5
  }
  
  http_listener {
    name                           = local.http_listener_name
    frontend_ip_configuration_name = local.front_ip_config_name
    frontend_port_name             = local.front_port_name
    protocol                       = "Http"
  }
  
  request_routing_rule {
    name                       = local.routing_rule_name
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = local.http_listener_name
    backend_address_pool_name  = local.back_addr_pool_name
    backend_http_settings_name = local.back_http_settings_name
  }
}