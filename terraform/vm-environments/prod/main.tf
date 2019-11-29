terraform {
  backend "azurerm" {
    storage_account_name = "pfsbackendtfrgacctprod"         #Needs to be centralised?
    container_name       = "azstatelock-prod"               # Dev test only? Could be a env variable TF_CONTAINER_NAME
    key                  = "pfshubvm-prod-tf_state.tfsprod" #Needs to be somewhow unique
  }
}

resource "azurerm_resource_group" "hub-rg" {
  name     = "${var.rg-name}"
  location = "${var.location}"
}

data "azurerm_recovery_services_protection_policy_vm" "backup_policy" {
  recovery_vault_name = "pfs-hub-prod-recovery-vault"
  name                = "pfs-hub-prod-content-bkp-policy"
  resource_group_name = "pfs-prod-hub-content-backup-services"
}

##########################################################
## Create VM
####################################### ###################

module "vm" {
  source               = "..\\modules\\vm"
  vm-count             = "${var.vm-count}"
  location             = "${var.location}"
  rg-name              = "${azurerm_resource_group.hub-rg.name}"
  env                  = "${var.env}"
  environment          = "${var.environment}"
  nic                  = "${var.nic}"
  prefix               = "${var.prefix}"
  existing-subnet-name = "${var.existing-subnet-name}"
  existing-vnet-name   = "${var.existing-vnet-name}"
  network-rg           = "${var.network-rg}"
  ipallocation         = "${var.ipallocation}"
  domainnamelabel      = "${var.domainnamelabel}"
  publicipname         = "${var.publicipname}"
  nic-name             = "${var.nic-name}"
  sku                  = "${var.sku}"

  #bootdiagstorage        = "${var.bootdiagstorage}"
  manageddisktype     = "${var.manageddisktype}"
  disk_size_gb        = "${var.disk_size_gb}"
  vm_size             = "${var.vm_size}"
  asg                 = "${var.asg}"
  asg_rg              = "${var.asg_rg}"
  recovery_vault_name = "${data.azurerm_recovery_services_protection_policy_vm.backup_policy.recovery_vault_name}"
  usecase             = "${var.usecase}"
}
