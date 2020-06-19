
terraform {
  backend "azurerm" {
    storage_account_name = "pfsbackendtfrgacctprod"    #Needs to be centralised?
    container_name       = "azstatelock-prod"          # 
    key                  = "pfsvault_tf_state.tfsprod" #Needs to be somewhow unique
  }
}

resource "azurerm_resource_group" "pfs-prod-digital-hub-vault-rg" {
  name     = "${var.rg-name}"
  location = "${var.location}"
  lifecycle {
    prevent_destroy = true
  }
}

data "azurerm_azuread_service_principal" "pfs-1" {
  display_name = "pfs-prod-digital-hub-1"
}


data "azurerm_azuread_service_principal" "pfs-2" {
  display_name = "pfs-prod-digital-hub-2"
}

data "azurerm_azuread_service_principal" "pfs-stage-1" {
  display_name = "pfs-stage-digital-hub-1"
}


data "azurerm_azuread_service_principal" "pfs-dev-1" {
  display_name = "pfs-dev-digital-hub-1"
}


data "azurerm_azuread_service_principal" "pfs-ad-bwi-1" {
  display_name = "pfs-prd-bwi-dc1"
}


data "azurerm_azuread_service_principal" "pfs-ad-wli-1" {
  display_name = "pfs-prd-wli-dc1"
}

data "azurerm_azuread_service_principal" "pfs-bastion" {
  display_name = "pfs-management-bastion-1"
}

data "azurerm_azuread_service_principal" "pfs-backup" {
  display_name = "Backup Management Service"
}






data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "vault" {
  tenant_id           = "${data.azurerm_client_config.current.tenant_id}"
  name                = "${var.vault-name}"
  location            = "${var.location}"
  resource_group_name = "${var.rg-name}"


  sku_name                    = "standard"
  enabled_for_disk_encryption = true
  enabled_for_deployment      = true


  access_policy {
    object_id = "${data.azurerm_azuread_service_principal.pfs-1.object_id}"
    tenant_id = "${data.azurerm_client_config.current.tenant_id}"

    secret_permissions = [
      "get",
    "list"]
  }

  access_policy {
    object_id = "${data.azurerm_azuread_service_principal.pfs-2.object_id}"
    tenant_id = "${data.azurerm_client_config.current.tenant_id}"

    secret_permissions = [
      "get",
    "list"]
  }

  access_policy {
    object_id = "${data.azurerm_azuread_service_principal.pfs-stage-1.object_id}"
    tenant_id = "${data.azurerm_client_config.current.tenant_id}"

    secret_permissions = [
      "get",
    "list"]
  }

  access_policy {
    object_id = "${data.azurerm_azuread_service_principal.pfs-dev-1.object_id}"
    tenant_id = "${data.azurerm_client_config.current.tenant_id}"

    secret_permissions = [
      "get",
    "list"]
  }

  access_policy {
    object_id = "${data.azurerm_azuread_service_principal.pfs-ad-bwi-1.object_id}"
    tenant_id = "${data.azurerm_client_config.current.tenant_id}"

    secret_permissions = [
      "get",
    "list"]
  }

  access_policy {
    object_id = "${data.azurerm_azuread_service_principal.pfs-ad-wli-1.object_id}"
    tenant_id = "${data.azurerm_client_config.current.tenant_id}"

    secret_permissions = [
      "get",
    "list"]
  }

  access_policy {
    object_id = "${data.azurerm_azuread_service_principal.pfs-bastion.object_id}"
    tenant_id = "${data.azurerm_client_config.current.tenant_id}"

    secret_permissions = [
      "get",
    "list"]
  }


  access_policy {
    object_id = "${data.azurerm_azuread_service_principal.pfs-backup.object_id}"
    tenant_id = "${data.azurerm_client_config.current.tenant_id}"

    secret_permissions = [
      "get",
    "list"]

    key_permissions = [
      "backup",
      "get",
    "list"]
  }

  enabled_for_template_deployment = false
  tags = {
    "environment" = "Prod"
  }

  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
    ip_rules       = "${var.ips}"

    virtual_network_subnet_ids = [
      "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourcegroups/pfs-dev-core-rg/providers/microsoft.network/virtualnetworks/pfs-dev-core-vn/subnets/pfs-dev-app-sn",
      "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourcegroups/pfs-dev-core-rg/providers/microsoft.network/virtualnetworks/pfs-dev-core-vn/subnets/pfs-dev-data-sn",
      "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourcegroups/pfs-dev-core-rg/providers/microsoft.network/virtualnetworks/pfs-dev-core-vn/subnets/pfs-dev-management-sn",
      "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourcegroups/pfs-dev-core-rg/providers/microsoft.network/virtualnetworks/pfs-dev-core-vn/subnets/pfs-dev-web-sn",
      "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourcegroups/pfs-prod-access-rg/providers/microsoft.network/virtualnetworks/pfs-prod-access-vn/subnets/pfs-prod-spare-sn",
      "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourcegroups/pfs-prod-access-rg/providers/microsoft.network/virtualnetworks/pfs-prod-access-vn/subnets/pfs-prod-vm-sn",
      "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourcegroups/pfs-prod-core-rg/providers/microsoft.network/virtualnetworks/pfs-prod-core-vn/subnets/pfs-prod-app-sn",
      "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourcegroups/pfs-prod-core-rg/providers/microsoft.network/virtualnetworks/pfs-prod-core-vn/subnets/pfs-prod-data-sn",
      "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourcegroups/pfs-prod-core-rg/providers/microsoft.network/virtualnetworks/pfs-prod-core-vn/subnets/pfs-prod-management-sn",
      "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourcegroups/pfs-prod-core-rg/providers/microsoft.network/virtualnetworks/pfs-prod-core-vn/subnets/pfs-prod-web-sn",
      "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourcegroups/pfs-stage-core-rg/providers/microsoft.network/virtualnetworks/pfs-stage-core-vn/subnets/pfs-stage-app-sn",
      "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourcegroups/pfs-stage-core-rg/providers/microsoft.network/virtualnetworks/pfs-stage-core-vn/subnets/pfs-stage-data-sn",
      "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourcegroups/pfs-stage-core-rg/providers/microsoft.network/virtualnetworks/pfs-stage-core-vn/subnets/pfs-stage-management-sn",
      "/subscriptions/340944f4-b60c-46ba-9377-5668bba83ecd/resourcegroups/pfs-stage-core-rg/providers/microsoft.network/virtualnetworks/pfs-stage-core-vn/subnets/pfs-stage-web-sn"
    ]
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
  name                      = "pfsprodvaultloga"
  resource_group_name       = "${var.rg-name}"
  location                  = "${var.location}"
  account_tier              = "Standard"
  account_replication_type  = "GRS"
  enable_https_traffic_only = true
}

resource "azurerm_monitor_diagnostic_setting" "prodworkspace" {
  name                       = "all"
  target_resource_id         = "${azurerm_key_vault.vault.id}"
  storage_account_id         = "${azurerm_storage_account.pfs-prod-hub-vault-storage-acct.id}"
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
