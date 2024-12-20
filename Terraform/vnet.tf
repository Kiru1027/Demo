
resource "azurerm_virtual_network" "vn-kiru" {
  name                = "vn-kiru"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}
resource "azurerm_subnet" "subnetA" {
  name                 = "subnetA"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vn-kiru.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "subnetB" {
  name                 = "subnetB"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vn-kiru.name
  address_prefixes     = ["10.0.2.0/24"]
}


