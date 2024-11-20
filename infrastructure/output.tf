## General

## Resource group

output "rg_id" {
  description = "Resource group ID"
  value       = module.resource_group.rg_id
}

output "rg_name" {
  description = "Resource group name"
  value       = module.resource_group.rg_name
}

output "physical_loc" {
  description = "Resource group and modules physical location"
  value       = module.resource_group.physical_loc
}

## Virtual network

output "vnet_id" {
  description = "Virtual network ID"
  value       = module.vnet.vnet_id
}

output "vnet_name" {
  description = "Virtual network name"
  value       = module.vnet.vnet_name
}

## Subnets
output "subnets_ids" {
  description = "Virtual network ID"
  value       = module.vnet.subnets_ids
}

output "subnets_names" {
  description = "Virtual network name"
  value       = module.vnet.subnets_names
}
