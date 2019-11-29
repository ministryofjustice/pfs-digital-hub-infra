resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_%@"
}

#refer to a subnet
data "azurerm_subnet" "hub_subnet" {
  name                 = "${var.existing-subnet-name}"
  virtual_network_name = "${var.existing-vnet-name}"
  resource_group_name  = "${var.network-rg}"
}

data "azurerm_recovery_services_protection_policy_vm" "backup_policy" {
  recovery_vault_name = "pfs-hub-prod-recovery-vault"
  name                = "pfs-hub-prod-content-bkp-policy"
  resource_group_name = "pfs-prod-hub-content-backup-services"
}

data "azurerm_storage_account" "bootdiagstorageact" {
  name                = "bootdiagstorageact"
  resource_group_name = "pfs-all-bootdiag-rg"
}

data "azurerm_application_security_group" "asg_env" {
  name                = "${var.asg}"
  resource_group_name = "${var.asg_rg}"
}

resource "azurerm_availability_set" "digital_hub_availset" {
  name                         = "${var.prefix}-digital_hub-av"
  resource_group_name          = "${var.rg-name}"
  location                     = "${var.location}"
  platform_fault_domain_count  = 2
  platform_update_domain_count = 5
  managed                      = true

  tags = {
    environment = "${var.env}"
  }
}

# create public IP address (Temp only)
resource "azurerm_public_ip" "publicip" {
  count                        = "${var.vm-count}"
  name                         = "${var.prefix}-${var.publicipname}-${1 + count.index}"
  location                     = "${var.location}"
  resource_group_name          = "${var.rg-name}"
  public_ip_address_allocation = "${var.ipallocation}"
  idle_timeout_in_minutes      = 30
  domain_name_label            = "${var.domainnamelabel}-${1 + count.index}"

  #sku                          = "${var.sku}"                                           #Standard is needed for lb

  tags = {
    environment = "${var.env}"
  }
}

resource "azurerm_network_interface" "nic" {
  count               = "${var.vm-count}"
  name                = "${var.prefix}-${var.nic-name}-${1 + count.index}"
  location            = "${var.location}"
  resource_group_name = "${var.rg-name}"

  #network_security_group_id = "${azurerm_network_security_group.nsg.id}"

  ip_configuration {
    name                           = "nic"
    subnet_id                      = "${data.azurerm_subnet.hub_subnet.id}"
    private_ip_address_allocation  = "Dynamic"
    public_ip_address_id           = "${azurerm_public_ip.publicip.*.id[count.index]}"
    application_security_group_ids = ["${data.azurerm_application_security_group.asg_env.id}"]
  }
  tags = {
    environment = "${var.env}"
  }
}

resource "azurerm_virtual_machine" "vm" {
  count                 = "${var.vm-count}"
  name                  = "${var.prefix}-${var.usecase}-${1 + count.index}"
  availability_set_id   = "${azurerm_availability_set.digital_hub_availset.id}"
  location              = "${var.location}"
  resource_group_name   = "${var.rg-name}"
  network_interface_ids = ["${element(azurerm_network_interface.nic.*.id, count.index)}"]

  #vm_size               = "Standard_DS1_v2"
  vm_size = "${var.vm_size}"

  storage_os_disk {
    name              = "${var.prefix}-digital-hub-osdisk-${1 + count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "${var.manageddisktype}"
    disk_size_gb      = "${var.disk_size_gb}"
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
    storage_uri = "${data.azurerm_storage_account.bootdiagstorageact.primary_blob_endpoint}"
  }

  tags = {
    environment = "${var.environment}"
  }
}

resource "azurerm_virtual_machine_extension" "network-watcher" {
  count                      = "${var.vm-count}"
  name                       = "PrisonerFacingService"
  location                   = "${var.location}"
  resource_group_name        = "${var.rg-name}"
  virtual_machine_name       = "${azurerm_virtual_machine.vm.*.name[count.index]}"
  publisher                  = "Microsoft.Azure.NetworkWatcher"
  type                       = "NetworkWatcherAgentLinux"
  type_handler_version       = "1.4"
  auto_upgrade_minor_version = true
}

resource "azurerm_virtual_machine_extension" "Linux_diag" {
  count                = "${var.vm-count}"
  name                 = "${azurerm_virtual_machine.vm.*.name[count.index]}"
  location             = "${var.location}"
  resource_group_name  = "${var.rg-name}"
  virtual_machine_name = "${azurerm_virtual_machine.vm.*.name[count.index]}"
  publisher            = "Microsoft.OSTCExtensions"
  type                 = "LinuxDiagnostic"
  type_handler_version = "2.3"

  settings = <<SETTINGS
    {
        "storageAccount": "${data.azurerm_storage_account.bootdiagstorageact.name}"
    }
SETTINGS

  protected_settings = <<SETTINGS
    {
        "storageAccountName": "${data.azurerm_storage_account.bootdiagstorageact.name}",
        "storageAccountKey": "${data.azurerm_storage_account.bootdiagstorageact.primary_access_key}"
    }
SETTINGS
}

/*
resource "azurerm_virtual_machine_extension" "anti-malware" {
  count                = "${var.vm-count}"
  name                 = "IaaSAntimalware"
  location             = "${var.location}"
  resource_group_name  = "${var.rg-name}"
  virtual_machine_name = "${azurerm_virtual_machine.vm.*.name[count.index]}"
  publisher            = "Microsoft.Azure.Security"
  type                 = "IaaSAntimalware"
  type_handler_version = "1.3"

  settings = <<SETTINGS
    {
      "AntimalwareEnabled": "true",
      "RealtimeProtectionEnabled": "true",
      "ScheduledScanSettings": {
        "isEnabled": "true",
        "day": "7",
        "time": "120",
        "scanType": "Quick"
      },
      "Exclusions": {
        "Extensions": "",
        "Paths": "",
        "Processes": ""
      }
    }
  SETTINGS
}
*/

/*##module.vm.azurerm_recovery_services_protected_vm.vm1 - Due to a bug in the terraform destroy you need to skip this  */

resource "azurerm_recovery_services_protected_vm" "vm1" {
  count               = "${var.vm-count}"
  resource_group_name = "pfs-prod-hub-content-backup-services"
  recovery_vault_name = "${var.recovery_vault_name}"
  source_vm_id        = "${azurerm_virtual_machine.vm.*.id[count.index]}"
  backup_policy_id    = "${data.azurerm_recovery_services_protection_policy_vm.backup_policy.id}"
}
