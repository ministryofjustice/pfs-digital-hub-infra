#Define variables

variable "vm-count" {
  default = "1"
}

variable "env" {
  default = "dev"
}

variable "environment" {
  description = "tag for env"
  default     = "dev"
}

variable "rg-name" {
  description = "resource group name"
  default     = "pfs-dev-digital-hub-rg"
}


variable "vm_size" {
  description = "size of the vm from t-shirts in Azure"
  default     = "Standard_DS2_v2"
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

variable "recovery_vault_name" {
  description = "recovery_vault_name"
  default     = "pfs-hub-prod-recovery-vault"
}

variable "asg" {
  type        = map(string)
  description = "The application security group this VM belongs to"
  default = {
    "1" = "pfs-dev-asg"
    "2" = "pfs-dev-asg"
    "3" = "pfs-dev-asg"
  }
}

variable "asg_rg" {
  description = "resource_group for the ASG"
  default     = "pfs-dev-core-rg"
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
  default     = "digital-hub"
}


variable "sku" {
  description = "The sku for the NIC"
  default     = "Basic"
}
