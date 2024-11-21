output "app_id" {
  description = "The ID of the Linux Web App"
  value = azurerm_linux_web_app.app_service.id
}