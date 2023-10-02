variable "node_count" {
  default = 1
}

variable "dns_prefix" {
  default = "aks-k8s-2022"

}

variable "cluster_name" {

}

variable "kubernetes_version" {

}

# variable "acr_name" {

# }

# variable "sql_name" {

# }

# variable "db_name" {

# }

# variable "db_admin_login" {

# }

# variable "db_admin_password" {

# }

# variable "storage_name" {

# }

variable "resource_group_name" {
  description = "Name of the Azure resource group"
  type        = string

}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "westeurope"
}

variable "aks_service_principal_client_id" {
  description = "Client ID of the Azure service principal for AKS"
  type        = string
}

variable "aks_service_principal_client_secret" {
  description = "Client Secret of the Azure service principal for AKS"
  type        = string
}



# variable "administrator_login" {
#   description = "Administrator username for PostgreSQL"
#   type        = string
# }

# variable "administrator_login_password" {
#   description = "Administrator password for PostgreSQL"
#   type        = string
# }
           

# variable "pg_server_name" {
#   description = "Name of the PostgreSQL server"
#   type        = string
# }

# variable "environment_tag" {
#   description = "Tag to identify the environment"
#   type        = string
#   default     = "dev"
# }
