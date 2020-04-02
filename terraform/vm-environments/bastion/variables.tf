#Define variables

variable "vm-count" {
  default = "1"
}

variable "env" {
  default = "management"
}

variable "environment" {
  type        = "string"
  description = "tag for env"
  default     = "management"
}

variable "rg-name" {
  type        = "string"
  description = "resource group name"
  default     = "pfs-management-digital-hub-rg"
}

variable "vm_size" {
  type        = "string"
  description = "size of the vm from t-shirts in Azure"
  default     = "Standard F4s_v2"
}

variable "nic" {
  default = "pfs-management-hub-vnic"
}

variable "prefix" {
  default = "pfs-management"
}

variable "location" {
  default = "UK South"
}

variable "username" {
  default = "hubuser"
}

variable "existing-subnet-name" {
  default = "pfs-prod-vm-sn"
}

variable "existing-vnet-name" {
  default = "pfs-prod-access-vn"
}

variable "network-rg" {
  default = "pfs-prod-access-rg"
}

variable "nic-name" {
  default = "management-hub-nic"
}

variable "ipallocation" {
  default = "dynamic"
}

variable "domainnamelabel" {
  default = "pfs-management-bastion"
}

variable "publicipname" {
  default = "management-hub-publicip"
}

variable "backup-rg" {
  description = "the name of the backup resource group"
  default     = "value"
}

variable "asg" {
  description = "The application security group this VM belongs to"
  default     = "pfs-bastion-asg"
}

variable "asg_rg" {
  description = "resource_group for the ASG"
  default     = "pfs-prod-core-rg"
}

variable "manageddisktype" {
  description = "type of disk, premium or standard - ssd or hdd"
  default     = "Standard_LRS"
}

variable "disk_size_gb" {
  description = "Size of managed disk"
  default     = "30"
}

variable "usecase" {
  description = "Use case, such as digital hub or bastion"
  default     = "bastion"
}


variable "sku" {
  description = "The sku for the NIC"
  default     = "Basic"
}
