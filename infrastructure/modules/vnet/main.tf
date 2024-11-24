## Virtual Network
# This resource creates a virtual network (VNet) in Azure.
# The VNet defines a private network space for your Azure resources to communicate.
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.physical_loc
  resource_group_name = var.rg_name
  address_space       = var.vnet_address_space
}

## Subnets
# This resource configures subnets within the VNet.
# Each subnet can have specific address ranges and associated services (e.g., Azure Storage).
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

## Network Security Groups

# Web App Network Security Group
# Allows inbound traffic from Database's subnet
resource "azurerm_network_security_group" "webapp_nsg" {
  name                = "webapp-nsg"
  resource_group_name = var.rg_name
  location            = var.physical_loc

  security_rule {
    name                       = "AllowDbSubnetTraffic"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.0.1.0/24" # DB Subnet
    destination_address_prefix = "10.0.2.0/24" # App Subnet
  }
}

# Database Network Security Group
# Allows inbound traffic from Web App's subnet
resource "azurerm_network_security_group" "db_nsg" {
  name                = "db-nsg"
  resource_group_name = var.rg_name
  location            = var.physical_loc

  security_rule {
    name                       = "AllowAppSubnetTraffic"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.0.2.0/24" # App Subnet
    destination_address_prefix = "10.0.1.0/24" # DB Subnet
  }
}
