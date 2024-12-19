resource "azurerm_storage_account" "san1027" {
  name                          = "san1027"
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  public_network_access_enabled = false
}

resource "azurerm_storage_container" "con-Kiru" {
  name                  = "con-Kiru"
  storage_account_name  = azurerm_storage_account.san1027.name
  container_access_type = "private"
}
resource "azurerm_storage_blob" "sample" {
  name                   = "sample.txt"
  storage_account_name   = azurerm_storage_account.san1027.name
  storage_container_name = azurerm_storage_container.con-Kiru.name
  type                   = "Block"
  source                 = "./sample.txt"
}

