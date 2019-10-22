variable "rg-name" {
  type        = "string"
  description = "resource group name"
  default     = "pfs-all-bootdiag-rg"
}

variable "location" {
  default = "UK South"
}

variable "bootdiagstorage" {
  default = "bootdiagstorageact"
}

variable "env" {
      type        = "string"
  description = "tag for env"
  default     = "all"
  }