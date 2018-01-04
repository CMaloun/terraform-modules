#rg
variable "resource_group_name" {}
variable "location" {}
#vnet
variable "address_space" { }
variable "dns_servers" {type = "list"}
variable "virtual_network_name" {}
variable "tags" { type = "map"}

resource "azurerm_resource_group" "rg" {
  name = "${var.resource_group_name}"
  location = "${var.location}"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.virtual_network_name}"
  location            = "${var.location}"
  address_space       = ["${var.address_space}"]
  resource_group_name = "${azurerm_resource_group.rg.name}"
}

output "vnet_name" { value = "${azurerm_virtual_network.vnet.name}" }