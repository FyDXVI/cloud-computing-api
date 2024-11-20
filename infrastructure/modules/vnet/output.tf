output "vnet_id" {
  description = "Virtual network ID"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "Virtual network name"
  value       = azurerm_virtual_network.vnet.name
}

output "subnets_ids" {
  description = "Subnets IDs"
  value       = { for k, v in azurerm_subnet.subnets : k => v.id }
}

output "subnets_names" {
  description = "Subnets names"
  value       = { for k, v in azurerm_subnet.subnets : k => v.name }
}