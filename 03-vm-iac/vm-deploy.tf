provider "azurerm" {
  features {}
  subscription_id = "f4b37f4c-d63d-4db8-93ec-44e89abe0633"
}

# Reference existing resource group
data "azurerm_resource_group" "existing" {
  name = "azure-vm-demo-rg"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "myVnetTF"
  address_space       = ["10.2.0.0/16"]
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "mySubnetTF"
  resource_group_name  = data.azurerm_resource_group.existing.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.2.0.0/24"]
}

resource "azurerm_public_ip" "public_ip" {
  name                = "myPublicIPTF"
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "nic" {
  name                = "myNICTF"
  location            = data.azurerm_resource_group.existing.location
  resource_group_name = data.azurerm_resource_group.existing.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                    = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                  = "myVMTF"
  location              = data.azurerm_resource_group.existing.location
  resource_group_name   = data.azurerm_resource_group.existing.name
  size                  = "Standard_DS1_v2"
  admin_username        = "azureuser"
  admin_password        = "YourSecurePassword123!"
  network_interface_ids = [azurerm_network_interface.nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}
