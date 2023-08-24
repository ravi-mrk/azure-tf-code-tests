resource "random_string" "resource_code" {
  length  = 3
  special = false
  upper   = false
}

resource "azurerm_resource_group" "devsecopstfstate" {
  name     = "devsecops-tfstate"
  location = "East US"
}

resource "azurerm_storage_account" "devsecopstfstate" {
  name                          = "devsecopstfstate${random_string.resource_code.result}"
  resource_group_name           = azurerm_resource_group.devsecopstfstate.name
  location                      = azurerm_resource_group.devsecopstfstate.location
  public_network_access_enabled = false
  account_tier                  = "Standard"
  account_replication_type      = "LRS"

  tags = {
    environment = "test"
  }
}
