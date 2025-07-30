output "webapp_url" {
  description = "The URL of the web application"
  value       = "https://${azurerm_windows_web_app.webapp.default_hostname}"
}
