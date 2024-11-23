output "storage_account_id" {
  description = "ID of the Azure Blob storage account"
  value       = azurerm_storage_account.storage_account.id
}

output "storage_container_id" {
  description = "ID of the Azure Blob storage container"
  value       = azurerm_storage_container.storage_container.id
}

output "storage_account_name" {
  description = "The name of the Blob storage account"
  value       = azurerm_storage_account.storage_account.name
}

output "storage_container_name" {
  description = "The name of the Blob storage container"
  value       = azurerm_storage_container.storage_container.name
}

output "storage_blob_name" {
  description = "The name of the Blob storage"
  value       = azurerm_storage_blob.storage_blob.name
}

output "storage_url" {
  description = "URL of the Blob storage"
  value       = azurerm_storage_account.storage_account.primary_blob_endpoint
}