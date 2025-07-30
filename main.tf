terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "azurerm" {
  features {}
  subscription_id = "f99f998b-61e8-4e12-a066-703892cfa30d"
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_service_plan" "quiz_plan" {
  name                = var.app_service_plan_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "F1"
}

resource "azurerm_app_service" "quiz_app" {
  name                = var.app_service_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_service_plan.quiz_plan.id

  site_config {
    linux_fx_version = "PYTHON|3.11"
    always_on        = true
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "true"
    "SCM_DO_BUILD_DURING_DEPLOYMENT"      = "true"
  }

  provisioner "local-exec" {
    command = <<EOT
      echo "Deploying ZIP to App Service..."
      access_token=$(az account get-access-token --query accessToken -o tsv)
      curl -X POST "https://${self.default_site_hostname}/api/zipdeploy" \
        -H "Authorization: Bearer $access_token" \
        -H "Content-Type: application/zip" \
        --data-binary "@app/app.zip"
    EOT
    interpreter = ["bash", "-c"]
  }

  depends_on = [azurerm_service_plan.quiz_plan]
}

resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_application_insights" "insights" {
  name                = var.app_insights_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"
}
