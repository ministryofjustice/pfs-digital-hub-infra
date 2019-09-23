
resource "random_password" "password" {
  length = 16
  special = true
}
#refer to a subnet
data "azurerm_subnet" "hub_subnet" {
  name                 = "${var.existing-subnet-name}"
  virtual_network_name = "${var.existing-vnet-name}"
  resource_group_name  = "${var.network-rg}"
}
data "azurerm_resource_group" "hub-rg" {
  name = "${var.rg-name}"
}



resource "azurerm_availability_set" "dev_digital_hub_availset" {
  name                         = "${var.prefix}-digital_hub-av"
  resource_group_name          = "${data.azurerm_resource_group.hub-rg.name}"
  location                     = "${var.location}"
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  managed                      = true
  tags = {
    environment = "${var.env}"
  }
  
}

resource "azurerm_storage_account" "pfsdighubbootdiagact" {
  name                     = "${var.bootdiagstorage}"
  resource_group_name      = "${data.azurerm_resource_group.hub-rg.name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"

   tags = {
      environment = "${var.env}"
    }

    network_rules {
    default_action             = "Deny"

  }
}



# create public IP address (Temp only)
resource "azurerm_public_ip" "publicip" {
  count                        = "${var.vm-count}"
  name                         = "${var.prefix}-${var.publicipname}-${1 + count.index}"
  location                     = "${var.location}"
  resource_group_name          = "${data.azurerm_resource_group.hub-rg.name}"
  public_ip_address_allocation = "${var.ipallocation}"
  idle_timeout_in_minutes      = 30
  domain_name_label            = "${var.domainnamelabel}-${1 + count.index}"

  tags = {
    environment = "${var.env}"
  }
}


resource "azurerm_network_interface" "nic" {
  count                     = "${var.vm-count}"
  name                      = "${var.prefix}-${var.nic-name}-${1 + count.index}"
  location                  = "${var.location}"
  resource_group_name       = "${data.azurerm_resource_group.hub-rg.name}"
  #network_security_group_id = "${azurerm_network_security_group.nsg.id}"

  ip_configuration {
    name                          = "nic"
    subnet_id                     = "${data.azurerm_subnet.hub_subnet.id}"
    private_ip_address_allocation = "dynamic"
    public_ip_address_id          = "${azurerm_public_ip.publicip.*.id[count.index]}"
  }
  tags = {
    environment = "${var.env}"
  }
}

resource "azurerm_virtual_machine" "vm" {
    count                 = "${var.vm-count}"
    name                  = "${var.prefix}-digital-hub-${1 + count.index}"
    location              = "${var.location}"
    resource_group_name   = "${data.azurerm_resource_group.hub-rg.name}"
    network_interface_ids = ["${element(azurerm_network_interface.nic.*.id, count.index + 1)}"]
    vm_size               = "Standard_DS1_v2"

    storage_os_disk {
        name              = "${var.prefix}-digital-hub-osdisk-${1 + count.index}"
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
        computer_name  = "${var.prefix}-digital-hub-${1 + count.index}"
        admin_username = "${var.username}"
        admin_password = "${random_password.password.result}"
    }

  os_profile_linux_config {
    disable_password_authentication = false
  }

   boot_diagnostics {
    enabled     = true
    storage_uri = "${azurerm_storage_account.pfsdighubbootdiagact.primary_blob_endpoint}"
  }


    tags = {
        environment = "${var.environment}"
    }
}

resource "azurerm_virtual_machine_extension" "network-watcher" {
  count                      = "${var.vm-count}"
  name                       = "PrisonerFacingService"
  location                   = "${var.location}"
  resource_group_name        = "${data.azurerm_resource_group.hub-rg.name}"
  virtual_machine_name       = "${azurerm_virtual_machine.vm.*.name[count.index]}"
  publisher                  = "Microsoft.Azure.NetworkWatcher"
  type                       = "NetworkWatcherAgentLinux"
  type_handler_version       = "1.4"
  auto_upgrade_minor_version = true
}
