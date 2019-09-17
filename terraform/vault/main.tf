
terraform {
  backend "azurerm" {
    storage_account_name  = "pfsbackendtfrgacctprod" #Needs to be centralised?
    container_name        = "azstatelock-prod" # 
    key                   = "pfsvault_tf_state.tfsprod" #Needs to be somewhow unique
  }
}




resource "azurerm_resource_group" "pfs-prod-digital-hub-vault-rg" {
  name     = "${var.rg-name}"
  location = "${var.location}"
    lifecycle {
    prevent_destroy = true
  }
}

data "azuread_group" "DSDT" {
  name = "Digital Studio Dev Team - Digital Hub"
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "vault" {
  tenant_id = "${data.azurerm_client_config.current.tenant_id}"
  name                = "${var.vault-name}"
  location            = "${var.location}"
  resource_group_name = "${var.rg-name}"
  

  sku_name = "standard"
  enabled_for_disk_encryption = true
  enabled_for_deployment = true

  access_policy {
    object_id = "${data.azuread_group.DSDT.id}"
    tenant_id = "${data.azurerm_client_config.current.tenant_id}"



    key_permissions = [
      "create",
      "get",
      "list",
      "wrapKey",
      "sign",
      "verify",
      "restore",
      "unwrapKey",
      "decrypt",
      "encrypt",
      "purge",
      "update",
      "import",
      "delete",
      "recover",
      "backup"
    ]

    secret_permissions = [
      "get",
      "set",
      "list",
      "backup",
      "restore",
      "delete",
      "Recover",
      "Backup",
      "Purge"
    ]

    storage_permissions = [
      "backup",
      "delete",
      "deletesas",
      "get",
      "list",
      "listsas",
      "purge",
      "recover",
      "regeneratekey",
      "restore",
      "set",
      "setsas",
      "update"
    ]
  }
    network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
    ip_rules       = "${var.ips}"
  }
    tags = {
    environment = "Prod"
  }
}
resource "null_resource" "azure_storage_queue-enable-soft-delete" {
  provisioner "local-exec" {
    command = "az resource update --id ${azurerm_key_vault.vault.id} --set properties.enableSoftDelete=true"
  }
}


resource "azurerm_log_analytics_workspace" "prodworkspace" {
  name                = "pfshubprodvaultloga"
  location            = "${var.location}"
  resource_group_name = "${var.rg-name}"
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_storage_account" "pfs-prod-hub-vault-storage-acct" {
   name = "pfsprodvaultloga"
   resource_group_name = "${var.rg-name}"
   location = "${var.location}"
   account_tier = "Standard"
   account_replication_type = "GRS"
}

resource "azurerm_monitor_diagnostic_setting" "prodworkspace" {
  name               = "all"
  target_resource_id = "${azurerm_key_vault.vault.id}"
  storage_account_id = "${azurerm_storage_account.pfs-prod-hub-vault-storage-acct.id}"
  log_analytics_workspace_id = "${azurerm_log_analytics_workspace.prodworkspace.id}"


  log {
    category = "AuditEvent"
    enabled  = false

    retention_policy {
      enabled = false
    }
  }

 metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}
