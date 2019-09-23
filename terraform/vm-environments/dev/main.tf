
terraform {
  backend "azurerm" {
    storage_account_name  = "pfsbackendtfrgacctdev" #Needs to be centralised?
    container_name        = "azstatelock-dev" # Dev test only? Could be a env variable TF_CONTAINER_NAME
    key                   = "pfshubvm-test_tf_dev.tfstate" #Needs to be somewhow unique
  }
}


####Create specific resource group


resource "azurerm_resource_group" "rg-name" {
  name     = "${var.rg-name}"
  location = "${var.location}"
}


##########################################################
## Create VM
####################################### ###################

module "vm" {
  source                 = "..\\modules\\vm"
  vm-count               = "${var.vm-count}"
  location               = "${var.location}"
  rg-name                = "${var.rg-name}"
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
  bootdiagstorage        = "${var.bootdiagstorage}"
}


