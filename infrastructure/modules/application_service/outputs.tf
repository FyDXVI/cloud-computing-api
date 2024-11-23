output "app_id" {
  description = "The ID of the Linux Web App"
  value       = azurerm_linux_web_app.app_service.id
}

output "app_service_fqdn" {
  description = "The default hostname of the Linux Web App"
  value       = azurerm_linux_web_app.app_service.default_hostname
}