resource "azurerm_public_ip" "publicip" {
  name                         = "${lookup(var.publicipname, var.env)}"
  location                     = "${var.location}"
  resource_group_name          = "${azurerm_resource_group.resourceGroup.name}"
  public_ip_address_allocation = "${lookup(var.ipallocation, var.env)}"
  idle_timeout_in_minutes      = 30
  domain_name_label            = "${lookup(var.domainnamelabel, var.env)}"

  tags = {
    environment = "${lookup(var.environment, var.env)}"
  }
}



resource "azurerm_virtual_network" "vnet" {
  name                = "${lookup(var.vnetname, var.env)}"
  address_space       = ["10.0.0.0/16"]
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.resourceGroup.name}"
}


resource "azurerm_subnet" "subnet" {
  name                 = "${lookup(var.subnet-name, var.env)}"
  resource_group_name  = "${azurerm_resource_group.resourceGroup.name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_network_interface" "nic" {
  name                      = "${lookup(var.nic-name, var.env)}"
  location                  = "${var.location}"
  resource_group_name       = "${azurerm_resource_group.resourceGroup.name}"
  network_security_group_id = "${azurerm_network_security_group.nsg.id}"

  ip_configuration {
    name                          = "ip_configuration"
    subnet_id                     = "${azurerm_subnet.subnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.publicip.id}"
  }
}
