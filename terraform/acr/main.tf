##ACR is azure container registry. This is used by the development team to store secure and confidential containers away from docker hub

terraform {
  backend "azurerm" {
    storage_account_name = "pfsbackendtfrgacctprod"  #Needs to be centralised?
    container_name       = "azstatelock-prod"        # Dev test only? Could be a env variable TF_CONTAINER_NAME
    key                  = "pfsacr_tf_state.tfsprod" #Needs to be somewhow unique
  }
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.rg-name}"
  location = "${var.location}"
}

resource "azurerm_container_registry" "acr" {
  name                = "pfsprodhubacr"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  location            = "${azurerm_resource_group.rg.location}"
  sku                 = "basic"
  admin_enabled       = true

  #georeplication_locations = ["UK West"]
  network_rule_set = []

  tags = {
    environment = "prod"

    # using a hard code for now
    #environment = "${lookup(var.environment, var.env)}"
  }
}
