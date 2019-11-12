#Define variables

variable "sku" {
  description = "publicipsku"
  default = "standard"
}

variable "vm-count" {
  default = "4"
}

variable "env" {
  default = "prod"
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

variable "vm_size" {
  type        = "string"
  description = "size of the vm from t-shirts in Azure"
  default     = "Standard_DS2_v2"
}

#
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
  default = "static"
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

variable "recovery_vault_name" {
  description = "recovery_vault_name"
  default     = "pfs-hub-prod-recovery-vault"
}

variable "asg" {
  description = "The application security group this VM belongs to"
  default     = "pfs-prod-asg"
}

variable "asg_rg" {
  description = "resource_group for the ASG"
  default     = "pfs-prod-core-rg"
}

variable "manageddisktype" {
  description = "type of disk, premium or standard - ssd or hdd"
  default     = "Premium_LRS"
}

variable "disk_size_gb" {
  description = "Size of managed disk"
  default     = "500"
}
