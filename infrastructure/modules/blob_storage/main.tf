resource "random_string" "random_name" {
  length  = 8
  special = false
  upper = false 
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "cpistoracc${random_string.random_name.result}"
  resource_group_name      = var.rg_name
  location                 = var.physical_loc
  account_tier             = "Standard"
  account_replication_type = "LRS"
  network_rules {
    default_action = "Allow"
    virtual_network_subnet_ids = [var.subnet_id]
  }
} 

resource "azurerm_storage_container" "storage_container" {
  name                    = "cpi-container-${random_string.random_name.result}"
  storage_account_id      = azurerm_storage_account.storage_account.id
  container_access_type   = "private"

  depends_on = [ azurerm_storage_account.storage_account ]
}

resource "azurerm_storage_blob" "storage_blob" {
  name                   = "cpi-blob-${random_string.random_name.result}.zip"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.storage_container.name
  type                   = "Block"

  depends_on = [ azurerm_storage_container.storage_container ]
}

