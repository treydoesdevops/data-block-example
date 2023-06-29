provider "azurerm" {
  features {}
}

#deploy to existing resource group
data "azurerm_resource_group" "existing_rg" {
  name = "existing_rg"
}


resource "azurerm_virtual_network" "vnet" {
  name                = "data-vnet"
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name
  address_space       = ["10.0.0.0/16"]
}
