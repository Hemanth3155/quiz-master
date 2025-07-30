variable "resource_group_name" {
  default = "quiz-app-rg"
}

variable "location" {
  default = "East US"
}

variable "app_service_plan_name" {
  default = "quiz-app-plan"
}

variable "web_app_name" {
  description = "Must be globally unique"
  type        = string
}


variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}
