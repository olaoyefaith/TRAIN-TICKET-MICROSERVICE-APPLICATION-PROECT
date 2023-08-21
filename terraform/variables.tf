variable "resourcegroup1" {
    type = string
    description = "resource group name"
}

variable "storageaccountname" {
    type = string
    description = "storage account name"
}

variable "containername" {
    type = string
    description = "container name"
}

variable "location" {
    type = string
    default = "West Europe"
    description = "location of resource"
}

variable "service_principal_name" {
  type = string
}

variable "keyvault_name" {
  type = string
}