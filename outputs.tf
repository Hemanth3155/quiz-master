output "web_app_url" {
  description = "URL of the deployed Web App"
  value       = "https://${azurerm_app_service.quiz_app.default_site_hostname}"
}
