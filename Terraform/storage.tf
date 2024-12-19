resource "azurerm_storage_account" "san2403"{
name = "san2403"
resource_group_name = azurerm_resource_group.rg.name
location = azurerm_resource_group.rg.location
account_tier = "Standard"
account_replication_type = "LRS"
public_network_access_enabled = false
}

resource "azurerm_storage_container" "data" {
name = "data"
storage_account_name = "san2403"
container_access_type = "private"
}
resource "azurerm_storage_blob" "sample"{
name = "sample.txt"
storage_account_name = "san2403"
storage_container_name = "data"
type = "Block"
source = "sample.txt"
}

