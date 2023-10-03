# variable "oidc_token" {}
# variable "oidc_token_file_path" {}
# variable "oidc_request_token" {}
# variable "oidc_request_url" {}

provider "azurerm" {
   subscription_id = var.SUBSCRIPTION_ID
   tenant_id       = var.SP_TENANT_ID
   use_oidc = true
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

