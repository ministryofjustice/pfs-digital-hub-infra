# Configure the Microsoft Azure Provider


variable "rg-name" {
    default = "pfs-prod-hub-content-backup-services"
}

variable "recoveryvault" {
  default =  "pfs-hub-prod"
  
}


variable "location" {
  default = "UK South"
}
