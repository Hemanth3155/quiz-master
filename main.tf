provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}


resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_service_plan" "plan" {
  name                = "quiz-app-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku_name = "B1"         # Example SKU name
  os_type  = "Windows"    # or "Linux"

  # Optional scaling properties:
  # capacity = 1
  # per_site_scaling = false
  # maximum_elastic_worker_count = 1
}

resource "azurerm_windows_web_app" "webapp" {
  name                = "quiz-app-webapp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id = azurerm_service_plan.plan.id

  site_config {
    default_documents = ["index.html"]
    always_on         = false
  }

  https_only = true
  zip_deploy_file = "site.zip" 
}


