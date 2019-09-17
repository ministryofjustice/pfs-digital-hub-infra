
resource "azurerm_virtual_machine" "vm" {
    name                  = "${lookup(var.vm-name, var.env)}"
    location              = "uksouth"
    resource_group_name   = "${azurerm_resource_group.resourceGroup.name}"
    network_interface_ids = ["${azurerm_network_interface.nic.id}"]
    vm_size               = "Standard_DS1_v2"

    storage_os_disk {
        name              = "${lookup(var.storage-osdisk-name, var.env)}"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Standard_LRS"
    }

    storage_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "16.04.0-LTS"
        version   = "latest"
    }

    os_profile {
        computer_name  = "${lookup(var.vm-name, var.env)}"
        admin_username = "${var.username}"
        admin_password = "${random_password.password.result}"
    }

  os_profile_linux_config {
    disable_password_authentication = false
  }

    tags = {
        environment = "${lookup(var.environment, var.env)}"
    }
}