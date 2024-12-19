resource "azurerm_storage_account" "san2403"{
name = "san2403"
resource_group_name = azurerm_resource_group.rg.name
location = azurerm_resource_group.rg.location
account_tier = "Standard"
account_replication_type = "LRS"
tags ={
    environment = "staging"
}
}
  
