

###modules notes

/*
Things to add

 boot_diagnostics {
    enabled     = true
    storage_uri = "${module.create-vm-common.boot_diags_storage_endpoint}"
  }

  os_profile_linux_config {
    disable_password_authentication = false

    ssh_keys = [
      {
        path     = "/home/${data.azurerm_key_vault_secret.LocalAdmin.content_type}/.ssh/authorized_keys"
        key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1c90tG3K9D0SlTLI5QWa6hBC1ucMlXzH575jTt/g70Na7HpL5TtxxN9smKL21mK+JjUfikqKTDMobhGUia0m7GTRMQi2lojw11izAshk2H9ZYn4oDcBo59QYix1zFxzxXP0JnGhuEPGzhGhNmqMG112d/tq8s2eRggBcZB/O4TPoZ57zjIBio1QMKJeWcRCaM47bqP6irU0WOxP0CC3FkZv1ezuZk5HW8BidyHq/X/AAiG3ko+aIvTaCWhpehuBOUnzaNIxTMNyTKH3DFusCoTJwYIDMstIkEAip4IaSVE5RwH3ypr4+8lOyEyKjJ/YOBXrsSLhUxPxXS5z2Mx3H/"
      },
      {
        path     = "/home/${data.azurerm_key_vault_secret.LocalAdmin.content_type}/.ssh/authorized_keys"
        key_data = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC2HlheE8NXxc9VoTF0N/jZO18p+jL+f1n6qqe1yulWA0ibQO5zEAsu4DMgI1P/VRVXb9H3yWSQLX8BE68bV0rlaQMeqd+RgL5ZCYiaOflIGIOQ3TK9zARENVWZEZYDYpUQbgHQipMl5/NywBQVJfcgiYSb2t+OozqBHBzS8uoRq1c6ymI4zc1iz5R8lF7hg6kmoyH06Us80csZ7D5EYZPPQvbI+8oLupwbyu4jeUBCuLdHXXWqf03O2IMHO2A4vAaV6si998NWzjxgR7rnejVDGK1LCx4S8rzIkUvKO08GSl4npc5rNps3uXYW75k1HpLuAb5gdYwqFytqPnJx1QOp"
      },
    ]


Split into root module hub modukle
Root - main.tf, variables.tf, output.tf 

Vm module
Storage module
nsg module
network module
Each modules has a main, variables and output file

# Download the image
module "image" {
  source = "./image"
  image_name  = "${var.image_name}"
}

# Start the container
module "container" {
  source             = "./container"
  image              = "${module.image.image_out}"
  container_name     = "${var.container_name}"
  int_port           = "${var.int_port}"
  ext_port           = "${var.ext_port}"
}
*/


###This needs to be a wrapper - Run before terraform is applied

resource "null_resource" "example1" {
  provisioner "local-exec" {
    command = "..\\ps\\terraformenvironment.ps1"
    interpreter = ["Powershell"]
  }
}

terraform {
  backend "azurerm" {
    storage_account_name  = "backendtfrgacctdevstage" #Needs to be centralised?
    container_name        = "azstatelock-devstage" # Dev test only? Could be a env variable TF_CONTAINER_NAME
    key                   = "azure_hub_tf_dev.tfstate" #Needs to be somewhow unique
  }
}


resource "azurerm_resource_group" "resourceGroup" {
  name     = "${lookup(var.rg-name, var.env)}"
  location = "${var.location}"
}

resource "random_password" "password" {
  length = 16
  special = true
}


