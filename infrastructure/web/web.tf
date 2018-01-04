variable "resource_group_name" {}
variable "prefix" {}
variable "location" {}
variable "storage_account_name" {}
variable "vm_computer_name" {}
variable "vm_name_prefix" {}
variable "vm_admin_password" {}
variable "vm_admin_username" {}
variable "image_publisher" {}
variable "image_offer" {}
variable "image_sku" {}
variable "image_version" {}
variable "vm_count" {}
variable "tags" { type = "map"}
variable "address_prefix" {}
variable "subnet_name" {}
variable "virtual_network_name" {}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.subnet_name}"
  virtual_network_name = "${var.virtual_network_name}"
  resource_group_name  = "${var.resource_group_name}"
  address_prefix       = "${var.address_prefix}"
}

module "web" {
  source = "../../compute/web"
  resource_group_name = "${var.resource_group_name}"
  location = "${var.location}"
  prefix = "${var.prefix}"
  vm_count = "${var.vm_count}"
  subnet_id = "${azurerm_subnet.subnet.id}"
  storage_account_name = "${var.storage_account_name}"
  vm_computer_name = "${var.vm_computer_name}"
  vm_name_prefix = "${var.vm_name_prefix}"
  vm_admin_password =  "${var.vm_admin_password}"
  vm_admin_username = "${var.vm_admin_username}"
  image_publisher = "${var.image_publisher}"
  image_offer     = "${var.image_offer}"
  image_sku       = "${var.image_sku}"
  image_version   = "${var.image_version}"
  tags = "${var.tags}"
}
