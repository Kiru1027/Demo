terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
}

provider "azurerm" {


  client_id       = var.client_id       # The Application (client) ID
  client_secret   = var.client_secret   # The client secret you created
  tenant_id       = var.tenant_id       # The Directory (tenant) ID
  subscription_id = var.subscription_id # Your Azure subscription ID
  features {}
}