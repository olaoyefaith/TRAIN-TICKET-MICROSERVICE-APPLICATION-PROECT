variable "oidc_token" {}
variable "oidc_token_file_path" {}
variable "oidc_request_token" {}
variable "oidc_request_url" {}

provider "azurerm" {
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

subscription_id = "020d10b6-a8c2-4fda-9368-e3b309869f5b"
  client_id       = "6aff537c-9231-44f7-b6fc-d3e3339ebd71"
  use_oidc        = true

  # for GitHub Actions
  oidc_request_token = var.oidc_request_token
  oidc_request_url   = var.oidc_request_url
