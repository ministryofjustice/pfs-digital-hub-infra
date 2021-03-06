locals {
  name = "pfs-digital-hub-stage"
}

/*
variable "sku" {
  description = "description"
}
*/

#Define variables
variable "env" {
  description = "env: dev or stage or prod"
}

variable "vm-count" {
  description = "How many VM's are required"
  type        = "string"
}

variable "environment" {
  type        = "string"
  description = "what the environment is"
}

variable "location" {
  default = "UK South"
}

variable "username" {
  default = "hubuser"
}
/*
variable "recovery_vault_name" {
  type        = "string"
  description = "recovery_vault_name"
}
*/

variable "rg-name" {
  type        = "string"
  description = "resource group name"
}

variable "nic" {
  type        = "string"
  description = "nic name"
}

variable "vm_size" {
  type        = "string"
  description = "size of the vm from t-shirts in Azure"
}

variable "prefix" {
  type        = "string"
  description = "prefix for environment"
}

variable "existing-subnet-name" {
  description = "name of the existing subnet"
  type        = "string"
}

variable "existing-vnet-name" {
  description = "name of existing vnet"
  type        = "string"
}

variable "network-rg" {
  description = "name of the existing network rg"
  type        = "string"
}

variable "publicipname" {
  description = "the name of the public Ip address"
  type        = "string"
}

variable "ipallocation" {
  description = "Ip allocation range"
  type        = "string"
}

variable "domainnamelabel" {
  description = "domainnamelabel"
  type        = "string"
}

variable "nic-name" {
  description = "nicname"
  type        = "string"
}

variable "asg" {
  description = "The application security group this VM belongs to"
  type        = "map"
}

variable "asg_rg" {
  description = "resource_group for the ASG"
  type        = "string"
}

variable "manageddisktype" {
  description = "type of disk, premium or standard - ssd or hdd"
  type        = "string"
}

variable "disk_size_gb" {
  description = "Size of managed disk"
  type        = "string"
}

variable "usecase" {}

variable "sku" {}

variable "prison" {
  type = "map"
  default = {
    "1" = "Wayland"
    "2" = "Berwyn"
  }
}
