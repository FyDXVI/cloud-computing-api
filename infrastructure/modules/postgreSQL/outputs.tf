output "dns_private_zone_id" {
  description = "ID of the DNS private zone"
  value       = azurerm_private_dns_zone.cpi_dns.id
}

output "postgresql_server_fqdn" {
  description = "Fully Qualified Domain Name for the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.postgresql.fqdn
}

output "postgresql_server_id" {
  description = "Unique ID of the PostgreSQL flexible server"
  value       = azurerm_postgresql_flexible_server.postgresql.id
}

output "database_id" {
  description = "ID of the database created within the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server_database.database.id
}

output "database_port" {
  description = "Port of the database created within the PostgreSQL server"
  value       = 5432
}

output "database_name" {
  description = "Name of the database created within the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server_database.database.name
}
