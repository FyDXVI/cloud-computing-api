output "dns_private_zone_id" {
  description = "id of the dns private zone"
  value       = azurerm_private_dns_zone.cpi_dns.id
}

output "postgresql_server_fqdn" {
  description = "Nom DNS complet du serveur PostgreSQL."
  value       = azurerm_postgresql_flexible_server.postgresql.fqdn
}

output "postgresql_server_id" {
  description = "ID unique du serveur PostgreSQL Flexible."
  value       = azurerm_postgresql_flexible_server.postgresql.id
}

output "database_id" {
  description = "Nom de la base de données créée sur le serveur."
  value       = azurerm_postgresql_flexible_server_database.database.id
}

output "database_port" {
  description = "Port of the PostGre SQL db"
  value       = 5432
}

output "database_name" {
  description = "Database Name"
  value       = azurerm_postgresql_flexible_server.postgresql.name
}
