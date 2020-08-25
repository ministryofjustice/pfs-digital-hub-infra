###Prod
data "azurerm_subnet" "prod-data-sn" {
  name                 = "pfs-prod-data-sn"
  virtual_network_name = "pfs-prod-core-vn"
  resource_group_name  = "pfs-prod-core-rg"
}

output "subnet_id_prod_data" {
  value = "${data.azurerm_subnet.prod-data-sn.id}"

}


data "azurerm_subnet" "prod-web-sn" {
  name                 = "pfs-prod-web-sn"
  virtual_network_name = "pfs-prod-core-vn"
  resource_group_name  = "pfs-prod-core-rg"
}

output "subnet_id_prod_web" {
  value = "${data.azurerm_subnet.prod-web-sn.id}"

}


data "azurerm_subnet" "prod-app-sn" {
  name                 = "pfs-prod-app-sn"
  virtual_network_name = "pfs-prod-core-vn"
  resource_group_name  = "pfs-prod-core-rg"
}

output "subnet_id_prod_app" {
  value = "${data.azurerm_subnet.prod-app-sn.id}"

}





####Stage --- stage
data "azurerm_subnet" "stage-app-sn" {
  name                 = "pfs-stage-app-sn"
  virtual_network_name = "pfs-stage-core-vn"
  resource_group_name  = "pfs-stage-core-rg"
}

output "subnet_id_stage_app" {
  value = "${data.azurerm_subnet.stage-app-sn.id}"

}

data "azurerm_subnet" "stage-web-sn" {
  name                 = "pfs-stage-web-sn"
  virtual_network_name = "pfs-stage-core-vn"
  resource_group_name  = "pfs-stage-core-rg"
}

output "subnet_id_stage_web" {
  value = "${data.azurerm_subnet.stage-web-sn.id}"

}


data "azurerm_subnet" "stage-data-sn" {
  name                 = "pfs-stage-data-sn"
  virtual_network_name = "pfs-stage-core-vn"
  resource_group_name  = "pfs-stage-core-rg"
}

output "subnet_id_stage_data" {
  value = "${data.azurerm_subnet.stage-data-sn.id}"

}

####Dev

data "azurerm_subnet" "dev-app-sn" {
  name                 = "pfs-dev-app-sn"
  virtual_network_name = "pfs-dev-core-vn"
  resource_group_name  = "pfs-dev-core-rg"
}

output "subnet_id_dev_app" {
  value = "${data.azurerm_subnet.dev-app-sn.id}"

}

data "azurerm_subnet" "dev-web-sn" {
  name                 = "pfs-dev-web-sn"
  virtual_network_name = "pfs-dev-core-vn"
  resource_group_name  = "pfs-dev-core-rg"
}

output "subnet_id_dev_web" {
  value = "${data.azurerm_subnet.dev-web-sn.id}"

}


data "azurerm_subnet" "dev-data-sn" {
  name                 = "pfs-dev-data-sn"
  virtual_network_name = "pfs-dev-core-vn"
  resource_group_name  = "pfs-dev-core-rg"
}

output "subnet_id_dev_data" {
  value = "${data.azurerm_subnet.dev-data-sn.id}"

}


###


terraform {
  backend "azurerm" {
    storage_account_name = "pfsbackendtfrgacctprod"           #Needs to be centralised?
    container_name       = "azstatelock-prod"                 # Dev test only? Could be a env variable TF_CONTAINER_NAME
    key                  = "pfscontentshare_tf_state.tfsprod" #Needs to be somewhow unique
  }
}


resource "azurerm_resource_group" "pfs-prod-digital-hub-content-rg" {
  name     = "pfs-prod-digital-hub-content-share"
  location = "${var.location}"
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    environment = "prod"
  }
}

resource "azurerm_storage_account" "pfs-prod-digital-hub-content-acct" {
  name                      = "pfsprodhubstorageacc"
  resource_group_name       = "${azurerm_resource_group.pfs-prod-digital-hub-content-rg.name}"
  location                  = "${var.location}"
  account_tier              = "Premium"
  account_replication_type  = "LRS"
  account_kind              = "FileStorage"
  enable_https_traffic_only = true
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    environment = "prod"
  }

  network_rules {
    default_action             = "Deny"
    ip_rules                   = "${var.ips}"
    virtual_network_subnet_ids = "${var.subnets}"

  }
}

resource "azurerm_storage_share" "pfs-prod-hub-content-share" {
  name                 = "pfs-prod-digital-hub-content-share"
  resource_group_name  = "${azurerm_resource_group.pfs-prod-digital-hub-content-rg.name}"
  storage_account_name = "${azurerm_storage_account.pfs-prod-digital-hub-content-acct.name}"

  quota = 400
  lifecycle {
    prevent_destroy = true
  }
  acl {
    id = "drupal"

    access_policy {
      permissions = "rcwdl"
      start       = "${timestamp()}"
      expiry      = "${timeadd(timestamp(), "2629746m")}"
    }
  }

}
