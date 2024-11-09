data "azurerm_resource_group" "registry"{
			name = var.rg_name
		}


resource "azurerm_container_registry" "regtf" {
  name                = "acrchandra"
  resource_group_name = data.azurerm_resource_group.registry.name
  location            = data.azurerm_resource_group.registry.location
  sku                 = "Standard"
  admin_enabled       = true
}


output adminpwd{
		value = azurerm_container_registry.regtf.admin_password
                sensitive = true
		}

