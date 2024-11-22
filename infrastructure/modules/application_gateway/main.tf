resource "azurerm_public_ip" "public_ip" {
    name= "public_ip"
    location=var.physical_loc
    resource_group_name = var.rg_name
    allocation_method = "Static" 
}

resource "azurerm_application_gateway" "app_gateway" {
  name= var.gateway_name
  location=var.physical_loc
  resource_group_name =  var.rg_name
  sku {
    name="Standard_v2"
    tier="Standard_v2"
    capacity = 2
  }
  gateway_ip_configuration {
    name="gateway-ip-config"
    subnet_id = var.subnet_id
  }
  frontend_ip_configuration {
    name="frontend-ip-config"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
  frontend_port {
    name="frontend-port-name"
    port=80
  }
  backend_address_pool {
    name="backend-address-pool"
  }
  backend_http_settings {
    name= "backend-http-settings"
    cookie_based_affinity = "Disabled"
    path = "/"
    port = 80
    protocol = "Http"
    request_timeout = 1
  }
  http_listener {
    name="listener-cpi"
    frontend_ip_configuration_name = "frontend-ip-config"
    frontend_port_name = "frontend-port-name"
    protocol = "Http"
  }
  request_routing_rule {
    name="routing-rule-name"
    priority = 9
    rule_type = "Basic"
    http_listener_name = "listener-cpi"
    backend_address_pool_name = "backend-address-pool"
    backend_http_settings_name = "backend-http-settings"
  }
}