output "storage_account_id" {
  description = "L'ID du compte de stockage Azure."
  value       = azurerm_storage_account.storage_account.id
}

output "storage_container_id" {
  description = "L'ID du conteneur de stockage Azure."
  value       = azurerm_storage_container.storage_container.id
}
