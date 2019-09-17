

#Define variables
variable "env" {
  description = "env: dev or stage or prod"
}


variable "publicipname" {
  type        = "map"
  description = "Name of public IP"
  default     = {
    dev  = "pfshubdevtest"
    stage = "pfs-hub-stage"
    prod = "pfs-hub-prod"
  }
}

variable "ipallocation" {
    type        = "map"
  description = "IP Allocation"
  default     = {
    dev  = "Dynamic"
    stage = "Dynamic"
    prod = "Dynamic"
  }
}


variable "domainnamelabel" {
      type        = "map"
  description = "domainnamelabel"
  default     = {
    dev  = "pfshubdevtest"
    stage = "pfs-hub-stage"
    prod = "pfs-hub-prod"
  }
}

variable "environment" {
      type        = "map"
  description = "tag for env"
  default     = {
    dev  = "devtest"
    stage = "stage"
    prod = "prod"
  }
}


variable "vnetname" {
      type        = "map"
  description = "Virtual network name"
  default     = {
    dev  = "pfshubtest-vnet"
    stage = "pfs-hub-test-vnet"
    prod = "pfs-hub-prod-vnet"
  }
}


variable "nsgname" {
  type        = "map"
  description = "nsg name"
  default     = {
    dev  = "pfshubtestnsg"
    stage = "pfs-hub-stage-nsg"
    prod = "pfs-hub-prod-nsg"
  }
}

variable "subnet-name" {
  type        = "map"
  description = "subnet name"
  default     = {
    dev  = "pfshubdevtest-subnet"
    stage = "pfs-hub-stage-subnet"
    prod = "pfs-hub-prod-subnet"
  }
}
variable "nic-name" {
    type        = "map"
  description = "NIC name"
  default     = {
    dev  = "pfshubdevtest-nic"
    stage = "pfs-hub-stage-nic"
    prod = "pfs-hub-prod-nic"
  }
}


variable "vm-name" {
  type        = "map"
  description = "Name of the virtual machine"
  default     = {
    dev  = "pfs-digital-dev-test"
    stage = "pfs-hub-stage-vm"
    prod = "pfs-hub-prod-vm"
  }
}

variable "storage-osdisk-name" {
  type        = "map"
  description = "Name of the OS disk attached to the VM"
  default     = {
    dev  = "pfs-digital-hub-osdisk"
    stage = "pfs-hub-stage-osdisk"
    prod = "pfs-hub-prod-osdisk"
  }
}

variable "storageacct" {
  type        = "map"
  description = "Name of the storage account"
  default     = {
    dev  = "pfshubvmteststoacc" 
    stage = "pfs-hub-stage-storageacct"
    prod = "pfs-hub-prod-storageacct"
  }
}

variable "location" {
  default = "UK South"
}

variable "username" {
  default = "hubuser"
}


variable "rg-name" {
  type        = "map"
  description = "resource group name"
  default     = {
    dev  = "pfshubtest"
    stage = "pfs-hub-stage-rg"
    prod = "pfs-hub-prod-rg"
  }
}



/*
variable "publicipname" {
  default = "pfshubdevtest"
}

variable "ipallocation" {
  default = "Dynamic"
}


variable "ipallocation" {
  default = "Dynamic"
}

variable "domainnamelabel" {
  default = "pfshubdevtest"
}

variable "environment" {
  default = "devtest"
}

variable "vnetname" {
  default = "pfshubtest-vnet"
}

variable "nsgname" {
  default = "pfshubtestnsg"  
}

variable "subnet-name" {
  default = "pfshubdevtest-subnet"
}

variable "nic-name" {
  default = "pfshubdevtest-nic"  
}

variable "vm-name" {
  default = "pfs-digital-dev-test"
}

variable "storage-osdisk-name" {
  default = "pfs-digital-hub-osdisk"
}

variable "storageacct" {
  default = "pfshubvmteststoacc"
}

variable "location" {
  default = "UK South"
}

variable "username" {
  default = "***"
}

variable "password" {
  default = "***"
}

variable "name" {
    default = "pfshubtest"
}


####Not used ?###
variable "ip_configuration-name" {
  default = "configuration"
}

variable "vm-stage-name" {
  default = "pfs-digital-hub-devtest-vm"
}


variable "storagecontainer" {
  default = "pfshubvmteststoragecont"
}
#

*/

#####


#####
