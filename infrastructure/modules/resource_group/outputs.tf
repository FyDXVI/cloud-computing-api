output "rg_id" {
  description = "Resource group ID"
  value       = azurerm_resource_group.resource_group.id
}

output "rg_name" {
  description = "Resource group name"
  value       = azurerm_resource_group.resource_group.name
}

output "physical_loc" {
  description = "Resource group and modules physical location"
  value       = azurerm_resource_group.resource_group.location
}