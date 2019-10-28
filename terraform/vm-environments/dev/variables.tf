

#Define variables

variable "vm-count" {
  default = "1"  
}

variable "env" {
  default  = "dev"
}

variable "environment" {
      type        = "string"
  description = "tag for env"
  default     = "dev"
  }

variable "rg-name" {
  type        = "string"
  description = "resource group name"
  default     = "pfs-dev-digital-hub-rg"
}


variable "vm_size" {
  type = "string"
  description = "size of the vm from t-shirts in Azure"
  default = "Standard_DS2_v2"
}

variable "nic" {
  default = "pfs-dev-hub-vnic"
}

variable "prefix" {
  default = "pfs-dev"
  
}

variable "location" {
  default = "UK South"
}

variable "username" {
  default = "hubuser"
}


 variable "existing-subnet-name" {
   default = "pfs-dev-web-sn"
   } 


variable "existing-vnet-name" {
  default = "pfs-dev-core-vn"
}

 variable "network-rg" {
  default = "pfs-dev-core-rg"
 }



 variable "nic-name" {
   default = "digital-hub-nic"
 } 

                                                                                                                                                                                                                                

variable "ipallocation" {
  default = "dynamic"
}


 variable "domainnamelabel" {
   default = "pfs-dev-hub"
 }

variable "publicipname" {
  default = "digital-hub-publicip"
}

variable "backup-rg" {
  description = "the name of the backup resource group"
  default = "value"
}


/*
variable "bootdiagstorage" {
  default = "bootdiagstorageact"
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
