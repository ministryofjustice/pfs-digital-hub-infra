terraform {
  backend "azurerm" {
    storage_account_name = "pfsbackendtfrgacctprod"       #Needs to be centralised
    container_name       = "azstatelock-prod"             # 
    key                  = "pfsbootdiag_tf_state.tfsprod" #Needs to be unique
  }
}



resource "azurerm_resource_group" "bootdiag-rg" {
  name     = "${var.rg-name}"
  location = "${var.location}"
}


resource "azurerm_storage_account" "pfsdighubbootdiagact" {
  name                      = "${var.bootdiagstorage}"
  resource_group_name       = "${azurerm_resource_group.bootdiag-rg.name}"
  location                  = "${var.location}"
  account_tier              = "Standard"
  account_replication_type  = "GRS"
  enable_https_traffic_only = true

  tags = {
    environment = "${var.env}"
  }

}
