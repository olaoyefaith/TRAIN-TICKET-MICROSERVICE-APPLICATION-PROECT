provider "azurerm" {
   subscription_id = var.SUBSCRIPTION_ID
   client_id       = var.SP_CLIENT_ID
   client_secret   = var.SP_CLIENT_SECRET
   tenant_id       = var.SP_TENANT_ID
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.7.0"
    }
  }
}
