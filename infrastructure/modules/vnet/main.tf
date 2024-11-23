## Virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.physical_loc
  resource_group_name = var.rg_name
  address_space       = var.vnet_address_space
}

## Subnets
resource "azurerm_subnet" "subnets" {
  for_each             = { for subnet in var.subnets : subnet.name => subnet }
  name                 = each.value.name
  resource_group_name  = var.rg_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = each.value.address_prefixes
  service_endpoints    = each.value.name == "blob_subnet" ? ["Microsoft.Storage"] : []

  depends_on = [ azurerm_virtual_network.vnet ]
  
  dynamic "delegation" {
    for_each = each.value.service_delegation == true ? [1]:[]

    content {
      name = each.value.delegation.delegation_name

      service_delegation {
        name    = each.value.delegation.name
        actions = each.value.delegation.actions
      }
    }
  }

}