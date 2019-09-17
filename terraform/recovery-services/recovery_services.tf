terraform {
  backend "azurerm" {
    storage_account_name  = "pfsbackendtfrgacctprod" #Needs to be centralised?
    container_name        = "azstatelock-prod" # Dev test only? Could be a env variable TF_CONTAINER_NAME
    key                   = "pfshubrecoveryvault_tf_state.tfsprod" #Needs to be somewhow unique
  }
}



resource "azurerm_resource_group" "pfs-prod-digital-hub-backup-vault-rg" {
  name     = "${var.rg-name}"
  location = "${var.location}"

    tags = {
      environment = "prod"
    }
}


resource "azurerm_recovery_services_vault" "pfs-hub-prod-backup-vault" {
  name                = "${var.recoveryvault}-recovery-vault"
  location            = "${azurerm_resource_group.pfs-prod-digital-hub-backup-vault-rg.location}"
  resource_group_name = "${azurerm_resource_group.pfs-prod-digital-hub-backup-vault-rg.name}"
  sku                 = "Standard"

}

resource "azurerm_recovery_services_protection_policy_vm" "backup_policy" {
  name                = "${var.recoveryvault}-content-bkp-policy"
  resource_group_name = "${azurerm_resource_group.pfs-prod-digital-hub-backup-vault-rg.name}"
  recovery_vault_name = "${azurerm_recovery_services_vault.pfs-hub-prod-backup-vault.name}"


backup {
    frequency = "Weekly"
    time      = "00:00"
    weekdays  = ["Friday"]
  }
  retention_weekly {
    count    = 2
    weekdays = ["Friday"]
  }
} 