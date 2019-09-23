

#Define variables

variable "vm-count" {
  default = "2"  
}

variable "env" {
  default  = "stage"
}

variable "environment" {
      type        = "string"
  description = "tag for env"
  default     = "stage"
  }

variable "rg-name" {
  type        = "string"
  description = "resource group name"
  default     = "pfs-stage-digital-hub-rg"
}

variable "nic" {
  default = "pfs-stage-hub-vnic"
}

variable "prefix" {
  default = "pfs-stage"
  
}

variable "location" {
  default = "UK South"
}

variable "username" {
  default = "hubuser"
}


 variable "existing-subnet-name" {
   default = "pfs-stage-web-sn"
   } 


variable "existing-vnet-name" {
  default = "pfs-stage-core-vn"
}

 variable "network-rg" {
  default = "pfs-stage-core-rg"
 }



 variable "nic-name" {
   default = "digital-hub-nic"
 } 

                                                                                                                                                                                                                                

variable "ipallocation" {
  default = "dynamic"
}


 variable "domainnamelabel" {
   default = "pfs-stage-hub"
 }

variable "publicipname" {
  default = "digital-hub-publicip"
}

variable "bootdiagstorage" {
  default = "bootdiagstorageact"
}
