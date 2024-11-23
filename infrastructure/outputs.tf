## General

# This section defines the outputs related to the resource group.

## Resource group

# Outputs the ID of the resource group, fetched from the resource_group module.
output "rg_id" {
  description = "Resource group ID"
  value       = module.resource_group.rg_id
}

# Outputs the name of the resource group, fetched from the resource_group module.
output "rg_name" {
  description = "Resource group name"
  value       = module.resource_group.rg_name
}

# Outputs the physical location of the resource group, fetched from the resource_group module.
output "physical_loc" {
  description = "Resource group and modules physical location"
  value       = module.resource_group.physical_loc
}

## Virtual network

# Outputs the ID of the virtual network, fetched from the vnet module.
output "vnet_id" {
  description = "Virtual network ID"
  value       = module.vnet.vnet_id
}

# Outputs the name of the virtual network, fetched from the vnet module.
output "vnet_name" {
  description = "Virtual network name"
  value       = module.vnet.vnet_name
}

## Subnets

# Outputs information about the subnets in the virtual network, fetched from the vnet module.
output "subnets" {
  description = "Virtual network ID"
  value       = module.vnet.subnets
}

## PostgreSQL

# Outputs the ID of the DNS private zone for PostgreSQL, fetched from the postgresql module.
output "dns_private_zone_id" {
  description = "id of the dns private zone"
  value       = module.postgresql.dns_private_zone_id
}

# Outputs the FQDN of the PostgreSQL server, fetched from the postgresql module.
output "postgresql_server_fqdn" {
  description = "Nom DNS complet du serveur PostgreSQL."
  value       = module.postgresql.postgresql_server_fqdn
}

# Outputs the unique ID of the PostgreSQL Flexible Server, fetched from the postgresql module.
output "postgresql_server_id" {
  description = "ID unique du serveur PostgreSQL Flexible."
  value       = module.postgresql.postgresql_server_id
}

# Outputs the ID of the created database, fetched from the postgresql module.
output "database_id" {
  description = "Nom de la base de données créée sur le serveur."
  value       = module.postgresql.database_id
}

# Outputs the port used by PostgreSQL (5432 is the default port for PostgreSQL).
output "database_port" {
  description = "Port of the PostGre SQL db"
  value       = 5432
}

# Outputs the name of the PostgreSQL database, fetched from the postgresql module.
output "database_name" {
  description = "Database Name"
  value       = module.postgresql.database_name
}

## App Service

# Outputs the ID of the Linux Web App (App Service), fetched from the app_service module.
output "app_id" {
  description = "The ID of the Linux Web App"
  value       = module.app_service.app_id
}

# Outputs the fully qualified domain name (FQDN) of the Linux Web App, fetched from the app_service module.
output "app_service_fqdn" {
  description = "The FQDN of the Linux Web App"
  value       = module.app_service.app_service_fqdn
}

## Blob storage

# Outputs the ID of the Azure Storage Account, fetched from the blob_storage module.
output "storage_account_id" {
  description = "L'ID du compte de stockage Azure."
  value       = module.blob_storage.storage_account_id
}

# Outputs the ID of the Azure Storage Container, fetched from the blob_storage module.
output "storage_container_id" {
  description = "L'ID du conteneur de stockage Azure."
  value       = module.blob_storage.storage_container_id
}

# Outputs the name of the Azure Storage Account, fetched from the blob_storage module.
output "storage_account_name" {
  description = "The name of the storage account"
  value       = module.blob_storage.storage_account_name
}

# Outputs the name of the Azure Storage Container, fetched from the blob_storage module.
output "storage_container_name" {
  description = "The name of the container"
  value       = module.blob_storage.storage_container_name
}

# Outputs the name of the blob in the storage container, fetched from the blob_storage module.
output "storage_blob_name" {
  description = "The name of the blob storage"
  value       = module.blob_storage.storage_blob_name
}

# Outputs the URL for accessing the blob storage, fetched from the blob_storage module.
output "storage_url" {
  description = "Storage url"
  value       = module.blob_storage.storage_url
}
