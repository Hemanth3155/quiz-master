variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string
  default     = "quiz-rg"
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "westus"
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  default     = "quiz-service-plan"
}

variable "app_service_name" {
  description = "Name of the Azure App Service (Web App)"
  type        = string
  default     = "quiz-web-app-12345" 
}

variable "storage_account_name" {
  description = "Name of the Azure Storage Account"
  type        = string
  default     = "quizstorageacct123" 
}

variable "app_insights_name" {
  description = "Name of the Application Insights resource"
  type        = string
  default     = "quiz-app-insights"
}
