# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.7.0"
    }
    
  }
}

terraform {
  backend "azurerm" {
    resource_group_name   = var.resourcegroup1
    storage_account_name  = var.storageaccountname
    container_name        = var.containername
    key                   = "terraform.tfstate"
    access_key            = "<your-storage-access-key>"
  }
}


# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg1"{
    name= var.resourcegroup1
    location= var.location
}

module "ServicePrincipal" {
  source                 = "./modules/ServicePrinciple"
  service_principal_name = var.service_principal_name
  depends_on = [
    azurerm_resource_group.rg1
  ]
}

data "azurerm_subscription" "primary" {
}

resource "azurerm_role_assignment" "rolespn" {

  scope                = data.azurerm_subscription.primary.id
  role_definition_name = "Contributor"
  principal_id         = module.ServicePrincipal.service_principal_object_id

  depends_on = [
    module.ServicePrincipal
  ]
}

module "keyvault" {
  source                      = "./modules/keyvault"
  keyvault_name               = var.keyvault_name
  location                    = var.location
  resource_group_name         = var.resourcegroup1
  service_principal_name      = var.service_principal_name
  service_principal_object_id = module.ServicePrincipal.service_principal_object_id
  service_principal_tenant_id = module.ServicePrincipal.service_principal_tenant_id

  depends_on = [
    module.ServicePrincipal
  ]
}

resource "azurerm_key_vault_secret" "example" {
  name         = module.ServicePrincipal.client_id
  value        = module.ServicePrincipal.client_secret
  key_vault_id = module.keyvault.keyvault_id

  depends_on = [
    module.keyvault
  ]
}

# #create Azure Kubernetes Service
# module "aks" {
#   source                 = "./modules/aks/"
#   service_principal_name = var.service_principal_name
#   client_id              = module.ServicePrincipal.client_id
#   client_secret          = module.ServicePrincipal.client_secret
#   location               = var.location
#   resource_group_name    = var.resourcegroup1

#   depends_on = [
#     module.ServicePrincipal
#   ]

# }