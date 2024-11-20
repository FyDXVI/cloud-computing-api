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