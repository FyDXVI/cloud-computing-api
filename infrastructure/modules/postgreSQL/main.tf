resource "random_string" "random_name" {
  length  = 8
  special = false
  upper   = false 
}

resource "azurerm_private_dns_zone" "cpi_dns" {
  name                = "cloud-cpi-domain.postgres.database.azure.com"
  resource_group_name = var.rg_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_private_link" {
  name                  = "cpi_dns_link"
  resource_group_name   = var.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.cpi_dns.name
  virtual_network_id    = var.vnet_id

  depends_on = [ azurerm_private_dns_zone.cpi_dns ]
}

locals {
  flex_server_name = "${var.postgresql_server_name}-${random_string.random_name.result}"
}

resource "azurerm_postgresql_flexible_server" "postgresql" {
  name                          = local.flex_server_name
  location                      = var.physical_loc
  resource_group_name           = var.rg_name
  sku_name                      = var.sku_name
  storage_mb                    = var.storage_mb
  version                       = var.db_version
  administrator_login           = var.admin_username
  administrator_password        = var.admin_password
  delegated_subnet_id           = var.subnet_id
  private_dns_zone_id           = azurerm_private_dns_zone.cpi_dns.id
  public_network_access_enabled = false
  zone                          = "1"

  depends_on = [ azurerm_private_dns_zone.cpi_dns ]
}

resource "azurerm_postgresql_flexible_server_database" "database" {
  name      = var.db_name
  server_id = azurerm_postgresql_flexible_server.postgresql.id
  charset   = "utf8"
  collation = "en_US.utf8"

  depends_on = [ azurerm_postgresql_flexible_server.postgresql ]
}

