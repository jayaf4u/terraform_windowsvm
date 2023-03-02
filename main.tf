resource "azurerm_resource_group" "main" {

  name     = var.resource_group
  location = var.location
}
resource "azurerm_network_security_group" "main" {
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  name                = var.tf_nsg
}

resource "azurerm_virtual_network" "main" {
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  name                = var.vnet_name
  address_space       = [var.vnet_address_space]

}

resource "azurerm_subnet" "main" {
  name                 = var.tf_subnet_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.tf_subnet_address_space]
}
resource "azurerm_public_ip" "main" {
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  name                = var.tfvm_publicIp_Name
  allocation_method   = "Dynamic"
  sku                 = "Basic"

}
resource "azurerm_network_interface" "main" {
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  name                = var.tfvm_nic_name

  ip_configuration {
    name                          = "ipconfig1"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id
    subnet_id                     = azurerm_subnet.main.id
  }

}

resource "azurerm_windows_virtual_machine" "main" {
  name                  = var.VM_Name
  admin_password        = var.admin_password
  admin_username        = var.admin_user
  resource_group_name   = azurerm_resource_group.main.name
  location              = azurerm_resource_group.main.location
  size                  = var.Vm_Size
  network_interface_ids = [azurerm_network_interface.main.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb     = var.vm_os_disk_size_in_GB

  }
  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
}
