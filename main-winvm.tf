resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = var.rg_name
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.rg_name
  address_space       = var.address_space
  location            = var.location
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_space

	depends_on = [azurerm_resource_group.rg]
}


resource "azurerm_public_ip" "public-ip" {
  name                = var.public-ipwin_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "nic" {
  name                = var.winnic_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  ip_configuration {
    name                          = var.ip_name
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public-ip.id
    subnet_id                     = azurerm_subnet.subnet.id
  }
}
resource "azurerm_windows_virtual_machine" "wintfvm" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.location
  size                  = var.size
  network_interface_ids = [azurerm_network_interface.nic.id]
  

  admin_username      = var.admin
  admin_password      = var.admin_password  

 
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

resource "azurerm_network_security_group" "nsgwin" {
  name                = var.nsg
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
  name                       = "rdp"
  priority                   = 101
  direction                  = "Inbound"
  access                     = "Allow"
  protocol                   = "Tcp"
  source_port_range          = "*"
  destination_port_range     = "3389"
  source_address_prefix      = "*"
  destination_address_prefix = "*"
}
security_rule {
    name                       = "icmp"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Icmp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"

}
}
resource "azurerm_network_interface_security_group_association" "nsgasoc" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.nsgwin.id
}
