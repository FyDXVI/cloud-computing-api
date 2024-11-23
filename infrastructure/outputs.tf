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
output "subnets" {
  description = "Virtual network ID"
  value       = module.vnet.subnets
}


## PostgreSQL

output "dns_private_zone_id" {
  description = "id of the dns private zone"
  value       = module.postgresql.dns_private_zone_id
}

output "postgresql_server_fqdn" {
  description = "Nom DNS complet du serveur PostgreSQL."
  value       = module.postgresql.postgresql_server_fqdn
}

output "postgresql_server_id" {
  description = "ID unique du serveur PostgreSQL Flexible."
  value       = module.postgresql.postgresql_server_id
}

output "database_id" {
  description = "Nom de la base de données créée sur le serveur."
  value       = module.postgresql.database_id
}

output "database_port" {
  description = "Port of the PostGre SQL db"
  value       = 5432
}

output "database_name" {
  description = "Database Name"
  value       = module.postgresql.database_name
}

## App Service
output "app_id" {
  description = "The ID of the Linux Web App"
  value       = module.app_service.app_id
}

output "app_service_fqdn" {
  description = "The FQDN of the Linux Web App"
  value       = module.app_service.app_service_fqdn
}

## Blob storage

output "storage_account_id" {
  description = "L'ID du compte de stockage Azure."
  value       = module.blob_storage.storage_account_id
}

output "storage_container_id" {
  description = "L'ID du conteneur de stockage Azure."
  value       = module.blob_storage.storage_container_id
}

output "storage_account_name" {
  description = "The name of the storage account"
  value       = module.blob_storage.storage_account_name
}

output "storage_container_name" {
  description = "The name of the container"
  value       = module.blob_storage.storage_container_name
}

output "storage_blob_name" {
  description = "The name of the blob storage"
  value       = module.blob_storage.storage_blob_name
}

output "storage_url" {
  description = "Storage url"
  value       = module.blob_storage.storage_url
}