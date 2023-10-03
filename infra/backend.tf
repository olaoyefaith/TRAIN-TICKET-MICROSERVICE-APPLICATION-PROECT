terraform {
  backend "azurerm" {
    use_oidc             = true
    subscription_id      = var.SUBSCRIPTION_ID
    tenant_id            = var.SP_TENANT_ID
  }
}
