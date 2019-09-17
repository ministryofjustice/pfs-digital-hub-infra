resource "azurerm_storage_account" "storageacc" {
  name                     = "${lookup(var.storageacct, var.env)}"
  resource_group_name      = "${azurerm_resource_group.resourceGroup.name}"
  location                 = "${var.location}"
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "storagecont" {
  name                  = "${lookup(var.storageacct, var.env)}"
  resource_group_name   = "${azurerm_resource_group.resourceGroup.name}"
  storage_account_name  = "${azurerm_storage_account.storageacc.name}"
  container_access_type = "private"
}

