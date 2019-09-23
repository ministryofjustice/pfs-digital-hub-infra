

#Define variables

variable "vm-count" {
  default = "2"  
}

variable "env" {
  default  = "prod"
}

variable "environment" {
      type        = "string"
  description = "tag for env"
  default     = "prod"
  }

variable "rg-name" {
  type        = "string"
  description = "resource group name"
  default     = "pfs-prod-digital-hub-rg"
}

variable "nic" {
  default = "pfs-prod-hub-vnic"
}

variable "prefix" {
  default = "pfs-prod"
  
}

variable "location" {
  default = "UK South"
}

variable "username" {
  default = "hubuser"
}


 variable "existing-subnet-name" {
   default = "pfs-prod-web-sn"
   } 


variable "existing-vnet-name" {
  default = "pfs-prod-core-vn"
}

 variable "network-rg" {
  default = "pfs-prod-core-rg"
 }



 variable "nic-name" {
   default = "digital-hub-nic"
 } 

                                                                                                                                                                                                                                

variable "ipallocation" {
  default = "dynamic"
}


 variable "domainnamelabel" {
   default = "pfs-prod-hub"
 }

variable "publicipname" {
  default = "digital-hub-publicip"
}

variable "bootdiagstorage" {
  default = "bootdiagstorageact"
}
