resource "azurerm_network_interface" "ni-kiru" {
  name                = "ni-kiru"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnetA.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.pubip-kiru.id
  }
}

resource "azurerm_windows_virtual_machine" "vm-kiru" {
  name                = "vm-kiru"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  availability_set_id = azurerm_availability_set.availset-kiru.id
  network_interface_ids = [
    azurerm_network_interface.ni-kiru.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

}
resource "azurerm_public_ip" "pubip-kiru" {
  name                = "pubip-kiru"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"

}

resource "azurerm_managed_disk" "mdisk-kiru" {
  name                 = "mdisk-kiru"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 16
}

resource "azurerm_virtual_machine_data_disk_attachment" "vmd-kiru" {
  managed_disk_id    = azurerm_managed_disk.mdisk-kiru.id
  virtual_machine_id = azurerm_windows_virtual_machine.vm-kiru.id
  lun                = "0"
  caching            = "ReadWrite"


}
resource "azurerm_availability_set" "availset-kiru" {
  name                = "availset-kiru"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  platform_fault_domain_count = 3
  platform_update_domain_count = 3

}
