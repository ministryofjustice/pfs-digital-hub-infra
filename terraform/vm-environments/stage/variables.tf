

#Define variables

variable "vm-count" {
  default = "1"  
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

variable "vm_size" {
  type = "string"
  description = "size of the vm from t-shirts in Azure"
  default = "Standard_DS2_v2"
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
  default = "static"
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


variable "asg" {
    description = "The application security group this VM belongs to"
    default = "pfs-stage-asg"
}

variable "asg_rg" {
  description = "resource_group for the ASG"
  default = "pfs-stage-core-rg"
}
variable "manageddisktype" {
  description = "type of disk, premium or standard - ssd or hdd"
  default = "Standard_LRS"
}

variable "disk_size_gb" {
  description = "Size of managed disk"
  default = "30"
}
