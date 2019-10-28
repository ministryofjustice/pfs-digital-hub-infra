

terraform {
  backend "azurerm" {
    storage_account_name  = "pfsbackendtfrgacctprod" #Needs to be centralised?
    container_name        = "azstatelock-prod" # Dev test only? Could be a env variable TF_CONTAINER_NAME
    key                   = "pfshubvm-prod-tf_state.tfsprod" #Needs to be somewhow unique
  }
}




  resource "azurerm_resource_group" "hub-rg" {
     name = "${var.rg-name}"
     location = "${var.location}"
  }



##########################################################
## Create VM
####################################### ###################

module "vm" {
  source                 = "..\\modules\\vm"
  vm-count               = "${var.vm-count}"
  location               = "${var.location}"
  rg-name                = "${azurerm_resource_group.hub-rg.name}"    
  env                    = "${var.env}"
  environment            = "${var.environment}"
  nic                    = "${var.nic}"
  prefix                 = "${var.prefix}"
  existing-subnet-name   = "${var.existing-subnet-name}"
  existing-vnet-name     = "${var.existing-vnet-name}"
  network-rg             = "${var.network-rg}"
  ipallocation           = "${var.ipallocation}"
  domainnamelabel        = "${var.domainnamelabel}"
  publicipname           = "${var.publicipname}"
  nic-name               = "${var.nic-name}"
  #bootdiagstorage        = "${var.bootdiagstorage}"
  vm_size                = "${var.vm_size}"
  recovery_vault_name    = "${var.recovery_vault_name}"
}


