# generates a random string used for naming and to allow multiple user to run the code without naming conflicts
resource "random_string" "random_name" {
  length  = 8
  special = false
  upper   = false 
}

# Create an account to access and manage the Blob storage
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

# Creates a container to store the Blobs
resource "azurerm_storage_container" "storage_container" {
  name                    = "api"
  storage_account_id      = azurerm_storage_account.storage_account.id
  container_access_type   = "private"

  depends_on = [ azurerm_storage_account.storage_account ]
}

# Creates a Blob to store within the container
resource "azurerm_storage_blob" "storage_blob" {
  name                   = "quotes.json"
  storage_account_name   = azurerm_storage_account.storage_account.name
  storage_container_name = azurerm_storage_container.storage_container.name
  type                   = "Block"
  source                 = "${path.module}/quotes.json"

  depends_on = [ azurerm_storage_container.storage_container ]
}

