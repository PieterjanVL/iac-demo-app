locals {
  default_tags = merge(var.default_tags, {
    environment = var.environment,
    name = "pj"
  })
}

resource "azurerm_resource_group" "example" {
  name     = "iac-demo-${var.environment}"
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = "storageaccountnamepjaetest"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "local.default_tags"
  }
}