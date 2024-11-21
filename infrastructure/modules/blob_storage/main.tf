resource "random_string" "random_name" {
  length  = 8
  special = false
}

resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.rg_name
  location                 = var.physical_loc
  account_tier             = "Standard"
  account_replication_type = "LRS"
} 

resource "azurerm_storage_container" "storage_container" {
  name                    = var.storage_container_name
  storage_account_name    = azurerm_storage_account.storage_account.name
  container_access_type   = "private"
}

resource "azurerm_storage_blob" "storage_blob" {
  name                   = "cpi-content${random_string.random_name.result}.zip"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.storage_container.name
  type                   = "Block"
}

