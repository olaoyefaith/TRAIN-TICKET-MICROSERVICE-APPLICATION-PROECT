resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name       = "systempool"
    node_count = var.node_count
    vm_size    = "Standard_D2s_v4"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "kubenet"
    network_policy = "calico"
  }


  tags = {
    Environment = "Development"
  }
}


# resource "azurerm_virtual_network" "example" {
#   name                = "example-vnet"
#   address_space       = ["10.7.29.0/29"]
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
# }

# resource "azurerm_subnet" "internal" {
#   name                 = "internal"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.example.name
#   address_prefixes     = ["10.7.29.0/29"]
#   service_endpoints    = ["Microsoft.Sql"]
# }

# resource "azurerm_postgresql_server" "example" {
#   name                = "postgresql-server-7q000"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name

#   sku_name = "GP_Gen5_2"

#   storage_mb            = 5120
#   backup_retention_days = 7


#   administrator_login          = var.administrator_login
#   administrator_login_password = var.administrator_login_password
#   version                      = "9.5"
#   ssl_enforcement_enabled      = true
# }

# resource "azurerm_postgresql_virtual_network_rule" "example" {
#   name                                 = "postgresql-vnet-rule"
#   resource_group_name                  = azurerm_resource_group.rg.name
#   server_name                          = azurerm_postgresql_server.example.name
#   subnet_id                            = azurerm_subnet.internal.id
#   ignore_missing_vnet_service_endpoint = true
# }


# module "postgresql" {
#   source = "Azure/postgresql/azurerm"

#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location

#   server_name                   = "examples-server"
#   sku_name                      = "B_Gen5_2"
#   storage_mb                    = 5120
#   auto_grow_enabled             = false
#   backup_retention_days         = 7
#   geo_redundant_backup_enabled  = false
#   administrator_login           = "login"
#   administrator_password        = "password"
#   server_version                = "9.5"
#   ssl_enforcement_enabled       = true
#   public_network_access_enabled = false
#   db_names                      = ["my_db1"]
#   db_charset                    = "UTF8"
#   db_collation                  = "English_United States.1252"

#   # firewall_rule_prefix = "firewall-"
#   # firewall_rules = [
#   #   { name = "test1", start_ip = "10.0.0.5", end_ip = "10.0.0.8" },
#   #   { start_ip = "127.0.0.0", end_ip = "127.0.1.0" },
#   # ]

#   # vnet_rule_name_prefix = "postgresql-vnet-rule-"
#   # vnet_rules = [
#   #   { name = "subnet1", subnet_id = "<subnet_id>" }
#   # ]

#   tags = {
#     Environment = "Production",
#     CostCenter  = "Contoso IT",
#   }

#   postgresql_configurations = {
#     backslash_quote = "on",
#   }

#   depends_on = [azurerm_resource_group.rg]
# }



# resource "azurerm_container_registry" "acr" {
#   name                = var.acr_name
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location
#   sku                 = "Standard"
#   admin_enabled       = true # false
# }

# data "azurerm_client_config" "current" {
# }

# data "azurerm_user_assigned_identity" "identity" {
#   name                = "${azurerm_kubernetes_cluster.k8s.name}-agentpool"
#   resource_group_name = azurerm_kubernetes_cluster.k8s.node_resource_group
# }

# resource "azurerm_role_assignment" "role_acrpull" {
#   scope                            = azurerm_container_registry.acr.id
#   role_definition_name             = "AcrPull"
#   principal_id                     = data.azurerm_user_assigned_identity.identity.principal_id
#   skip_service_principal_aad_check = true
# }

# resource "azurerm_sql_server" "sql" {
#   name                         = var.sql_name
#   resource_group_name          = azurerm_resource_group.rg.name
#   location                     = azurerm_resource_group.rg.location
#   version                      = "12.0"
#   administrator_login          = var.db_admin_login
#   administrator_login_password = var.db_admin_password
# }

# resource "azurerm_storage_account" "storage" {
#   name                     = var.storage_name
#   resource_group_name      = azurerm_resource_group.rg.name
#   location                 = azurerm_resource_group.rg.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
# }

# resource "azurerm_sql_database" "db" {
#   name                = var.db_name
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location
#   server_name         = azurerm_sql_server.sql.name
#   create_mode         = "Default"
#   edition             = "Standard"

#   tags = {
#     environment = "production"
#   }
# }

# resource "azurerm_sql_firewall_rule" "rule" {
#   name                = "AllowAzureServicesAndResources"
#   resource_group_name = azurerm_resource_group.rg.name
#   server_name         = azurerm_sql_server.sql.name
#   # The Azure feature Allow access to Azure services can be enabled 
#   # by setting start_ip_address and end_ip_address to 0.0.0.0
#   start_ip_address = "0.0.0.0"
#   end_ip_address   = "0.0.0.0"
# }
