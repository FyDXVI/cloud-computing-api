output "storage_account_id" {
  description = "L'ID du compte de stockage Azure."
  value       = azurerm_storage_account.storage_account.id
}

output "storage_container_id" {
  description = "L'ID du conteneur de stockage Azure."
  value       = azurerm_storage_container.storage_container.id
}

output "storage_account_name" {
  description = "The name of the storage account"
  value = azurerm_storage_account.storage_account.name
}

output "storage_container_name" {
  description = "The name of the container"
  value = azurerm_storage_container.storage_container.name
}

output "storage_blob_name" {
  description = "The name of the blob storage"
  value = azurerm_storage_blob.storage_blob.name
}
