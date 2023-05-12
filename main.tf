#Azure provider source and version being used
terraform{
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "=2.52.0"
        }
    }
}

#Configure the Microsoft Azure provider 
provider "azurerm" {
    features {}
}

#Creating a resource group
resource "azurerm_resource_group" "myrg" {
    name = "kavish-rg"
    location = "UK South"
}

#Creating a virtual network
resource "azurerm_virtual_network" "myvn" {
    name = "kavish-vn"
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myrg.location
    address_space = ["10.0.0.0/16"]
}

#Creating a subnet
resource "azurerm_subnet" "mysn" {
    name = "kavish-sn"
    resource_group_name = azurerm_resource_group.myrg.name
    virtual_network_name = azurerm_virtual_network.myvn.name
    address_prefixes = ["10.0.1.0/24"]
}