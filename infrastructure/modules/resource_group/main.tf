## Resource Group
# This resource creates a resource group in Azure.
resource "azurerm_resource_group" "resource_group" {
  name     = var.rg_name
  location = var.physical_loc
}